from pathlib import Path

import mkdocs_gen_files

with mkdocs_gen_files.open("index.md", "w", encoding="utf-8") as index:
    index.writelines(Path("README.md").open("r").read())
