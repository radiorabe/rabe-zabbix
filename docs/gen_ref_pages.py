"""Generate the code reference pages and navigation.

From https://mkdocstrings.github.io/recipes/
"""

from pathlib import Path

import mkdocs_gen_files

def _gen(name, data):
    with mkdocs_gen_files.open(name, "w", encoding="utf-8") as index:
        index.writelines(data)

_gen("index.md", Path("README.md").open("r").read())

for top_level in ["Stacks", "Templates", "Overrides"]:
    for readme_file in sorted(Path(top_level).rglob("*/README.md")):
        _gen(readme_file.with_name("index.md"), Path(readme_file).open("r").read())

for diff_file in sorted(Path("Overrides").rglob("*/DIFF.md")):
    _gen(diff_file.with_name("diff.md"), Path(diff_file).open("r").read())
