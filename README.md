# Christmas tree for the terminal

[![Verification](https://github.com/heyvaldemar/terminal-christmas-tree/actions/workflows/verification.yml/badge.svg?branch=main)](https://github.com/heyvaldemar/terminal-christmas-tree/actions/workflows/verification.yml)
[![OpenSSF Best Practices](https://www.bestpractices.dev/projects/14921/badge)](https://www.bestpractices.dev/projects/14921)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A bash script that draws a Christmas tree in the terminal and keeps its lights blinking until you press Ctrl-C. Nothing to install: `bash`, `tput` and a terminal.

```bash
curl -fsSLO https://raw.githubusercontent.com/heyvaldemar/terminal-christmas-tree/main/terminal-christmas-tree.sh
bash terminal-christmas-tree.sh
```

The address is the raw file. The earlier instructions pointed `curl -O` at the GitHub page for the script, which downloads the page's HTML under the script's name, and `bash` then fails on the first line of it.

## Testing

CI runs ShellCheck and actionlint on every push, then [`tests/run-headless.sh`](tests/run-headless.sh) runs the tree under a pseudo-terminal and checks what a person would see: the tree at its full nineteen stars, the trunk, next year in the greeting, the lights still blinking at four seconds, and the cursor visible again after Ctrl-C. [`tests/plant-violations.py`](tests/plant-violations.py) then breaks each of those on a copy of the script, six ways listed in [`tests/plants.tsv`](tests/plants.tsv), and fails the run if the test stays green through any of them.

```bash
./tests/run-headless.sh
python3 tests/plant-violations.py -- ./tests/run-headless.sh
```

---

## About the maintainer

<div align="center">

**Maintained by [Vladimir Mikhalev](https://github.com/heyvaldemar)** · Docker Captain · IBM Champion · AWS Community Builder

[YouTube](https://www.youtube.com/channel/UCf85kQ0u1sYTTTyKVpxrlyQ?sub_confirmation=1) · [Blog](https://heyvaldemar.com) · [LinkedIn](https://www.linkedin.com/in/heyvaldemar/)

</div>
