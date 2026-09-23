# Changelog

All notable changes to this project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

_(no unreleased changes yet)_

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
