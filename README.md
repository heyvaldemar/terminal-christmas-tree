# Christmas tree for the terminal

[![Verification](https://github.com/heyvaldemar/terminal-christmas-tree/actions/workflows/verification.yml/badge.svg?branch=main)](https://github.com/heyvaldemar/terminal-christmas-tree/actions/workflows/verification.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A bash script that draws a Christmas tree in the terminal and keeps its lights blinking until you press Ctrl-C. Nothing to install: `bash`, `tput` and a terminal.

```bash
curl -fsSLO https://raw.githubusercontent.com/heyvaldemar/terminal-christmas-tree/main/terminal-christmas-tree.sh
bash terminal-christmas-tree.sh
```

The address is the raw file. The earlier instructions pointed `curl -O` at the GitHub page for the script, which downloads the page's HTML under the script's name, and `bash` then fails on the first line of it.

## Testing

CI runs ShellCheck and actionlint on every push, then runs the script headless under a pseudo-terminal for four seconds: the pass condition is that the timeout ends it — it animates forever — after the greeting was drawn. An exit of its own is a failure, which is what a `tput` that cannot find a terminal would produce.

---

## About the maintainer

<div align="center">

**Maintained by [Vladimir Mikhalev](https://github.com/heyvaldemar)** · Docker Captain · IBM Champion · AWS Community Builder

[YouTube](https://www.youtube.com/channel/UCf85kQ0u1sYTTTyKVpxrlyQ?sub_confirmation=1) · [Blog](https://heyvaldemar.com) · [LinkedIn](https://www.linkedin.com/in/heyvaldemar/)

</div>
