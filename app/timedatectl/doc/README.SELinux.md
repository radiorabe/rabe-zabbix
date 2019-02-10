## SELinux Policy

The [rabetimedatectl](selinux/rabetimedatectl.te) policy module allows the agent to connect to dbus and lets
it request info from the timedated service. It also allows answers from the timedated service to the agent.
