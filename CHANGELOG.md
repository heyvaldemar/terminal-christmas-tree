# Changelog

All notable changes to this project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

_(no unreleased changes yet)_

## [1.1.0] - 2026-09-26

### Added

- **A test of what the tree shows, and proof that it can fail.** `tests/run-headless.sh` checks the tree's size, the trunk, next year in the greeting, that it keeps blinking, and that Ctrl-C gives the cursor back; `tests/plant-violations.py` breaks each of those six ways on a copy and requires the test to notice. Both run in CI on every push.

### Fixed

- **Ctrl-C gives the terminal back at once, and termination does too.** The handler called `tput reset`, which wipes the scrollback and, on a terminal that does not answer it, stalls long enough to be killed before the cursor is shown again. It now turns colours off, shows the cursor and clears the screen, on Ctrl-C (exit 130) and on termination (exit 143). Found by the new test.

## [1.0.0] - 2026-09-23

The first tagged release of a script that has worked for years. It is tagged
now because everything else in the catalogue it sits in carries a version, and
an untagged repository beside eighty-four tagged ones reads as unfinished
rather than as small.

### Added

- **A tree drawn in the terminal whose lights keep blinking until Ctrl-C.**
  `bash`, `tput` and a terminal; nothing to install. Ctrl-C restores the cursor
  and the terminal's state on the way out.
- **Verification on every push.** ShellCheck and actionlint, then the script is
  run headless under a pseudo-terminal for four seconds. It animates forever, so
  the pass condition is that the timeout ends it after the greeting was drawn —
  an exit of its own is a failure, which is what a `tput` that cannot find a
  terminal produces.
- **Supply chain.** GitHub Actions pinned by commit SHA, Dependabot updates
  grouped and merged only after the verification passes on the merged result,
  and an OpenSSF Scorecard run.

### Fixed

- **The install command downloads the script, not a web page.** It pointed
  `curl -O` at the GitHub page for the file, which saves the page's HTML under
  the script's name; `bash` then failed on its first line. It now names the raw
  file.
