const Conf = require('conf');
const config = new Conf();
const meow = require('meow');
const chalk = require('chalk');
const inquirer = require('inquirer');
const ora = require('ora');
const spawn = require('child_process').spawn;
const d = require('domain').create();

const Zabbix = require('zabbix-api');
const fs = require('fs');
const pd = require('pretty-data').pd;

const spinner = ora('Starting Rabe Zabbix Helper');
const cli = meow(`
  This script helps fetch templates into a local file from a remote zabbix api endpoint.

  If no arguments ar given the script outputs a list of all available templates.

  Usage
    $ rabe-zabbix [command_options] [FILENAME]

  Options
    --template=[name], -t [name]  Name of template to search, multiple templates allowed
    --insecure, -k                Ignore unauthorized TLS certs
    --make-update                 Call make update after a successful export
    --config-get [key]            Get config value for key
    --config-set [key] [val]      Set config value key to val
    --help, -h                    Print this help

  The script will prompt for some configuration options on first run. These get persisted to
  the disk for later use and they may be queried/changed with the --config-get and --config-set
  options.

  Examples
    Export a single template to a file.

    $ rabe-zabbix --template='Template App ntpd active' app/chrony/Template_App_chrony_active.xml

    Export multiple templates to a single file.

    $ rabe-zabbix \
        -t 'Template App ntpd Common active' \
        -t 'Template App ntpd Client active' \
        -t 'Template App ntpd Server active' app/ntpd/Template_App_ntpd_active.xml

    List all templates

    $ rabe-zabbix

    Set API endpoint to localhost.

    $ rabe-zabbix --config-set api http://localhost/zabbix/api_jsonrpc.php

`, {
    alias: {
      t: 'template',
      k: 'insecure',
      h: 'help'
    },
    string: [
      'config-get',
      'config-set',
    ],
    default: {
      'config-get': false,
      'config-set': false,
    }
});

if (cli.flags.configGet === '') {
  console.error('No config key given');
  cli.showHelp(1);
}
if (cli.flags.configGet) {
  console.log(chalk.yellow(cli.flags.configGet+": ") + config.get(cli.flags.configGet));
  process.exit(0);
}

if (cli.flags.configSet === '') {
  console.error('No config key given');
  cli.showHelp(1);
}
if (cli.flags.configSet && !cli.input[0]) {
  console.error('No config value given');
  cli.showHelp(1);
}
if (cli.flags.configSet) {
  config.set(cli.flags.configSet, cli.input[0]);
  console.log(chalk.yellow(cli.flags.configSet) + chalk.dim(' set to ') + cli.input[0]);
  process.exit(0);
}

if (cli.flags.insecure) {
  process.env.NODE_TLS_REJECT_UNAUTHORIZED = "0";
}

// global error handler
d.on('error', function(err){
  // output the errors full info in any case
  spinner.fail(err.stack);

  // additional info for specific cases that land us here

  // this is the case if the http request was aborted before a response header could be obtained
  // see <https://github.com/v2e4lisp/zabbix-api/blob/882db6cf1aa748119636f65a7d49462a5893cdce/index.js#L106-L107>
  if (err.message == "Cannot read property 'statusCode' of undefined") {
    spinner.stopAndPersist({text: 'A request to Zabbix failed and the error wasn\'t properly handled. --insecure might help in case of TLS errors.'});
  }
  process.exit(1);
});

var questions = [];
if (!config.has('api')) {
  questions.push({
    name: 'api',
    type: 'input',
    message: chalk.yellow('Zabbix API Endpoint: ')
  });
}
if (!config.has('username')) {
  questions.push({
    name: 'username',
    type: 'input',
    message: chalk.yellow('Zabbix Username: ')
  });
}
if (!config.has('password')) {
  questions.push({
    name: 'password',
    type: 'password',
    message: chalk.yellow('Zabbix Password: ')
  });
}
inquirer.prompt(questions).then(function(input) {
  if (input.api) config.set('api', input.api);
  if (input.username) config.set('username', input.username);
  if (input.password) config.set('password', input.password);

  spinner.text = 'Logging in to Zabbix';
  spinner.start();

  var zbx = new Zabbix(
    config.get('username'),
    config.get('password'),
    config.get('api')
  );
  d.run(function() {
    zbx.login(function(err, result) {
      if (err) {
        spinner.fail(err.data);
        process.exit(1);
      } else {
        spinner.succeed('Zabbix login succeeded.');
        fetch_templates(zbx, cli.flags.template, cli.input[0]);
      }
    });
  });
});

function fetch_templates(zbx, templates, target) {
  spinner.text = 'Fetching Templates';
  spinner.start();

  if (typeof templates == 'string') templates = [templates];

  zbx.request('template.get', {filter: { host: templates } }, function (err, res) {
    if (err) {
      spinner.fail(err.data);
      process.exit(1);
    } else if (res.length === 0) {
      spinner.warn('No templates found');
      process.exit(1);
    } else {
      spinner.info('Found ' + res.length + ' templates: ');
      res.forEach(function(template) {
        spinner.stopAndPersist({text: '- ' + template.name});
      });
      if (target) {
        export_templates(zbx, res.map(function(i) { return i.templateid; }), target);
      }
    }
  });
}

function export_templates(zbx, templates, target) {
  spinner.text = 'Exporting Templates';
  spinner.start();

  zbx.request('configuration.export', {format: 'xml', options:{templates: templates}}, function(err, res) {
    if (err) {
      spinner.fail(err.data);
      process.exit(1);
    } else {
      fs.writeFile(target, pd.xml(res), function (err) {
        if (err) throw err;
        spinner.succeed("Template exported to " + target);
        make_update();
      });
    }
  });
}

function make_update() {
  if (cli.flags.makeUpdate) {
    spinner.text = 'Running make update';
    spinner.start();
    const make = spawn('make', ['update']);

    make.stderr.on('data', function (data) {
      spinner.warn(data).start();
    });
    make.on('close', function(code) {
      if (code !== 0) {
        spinner.fail('make update failed');
      } else {
        spinner.succeed('make update done');
      }
    });
  }
}
