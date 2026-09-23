# Security Policy

## Supported versions

| Version                                       | Status             |
|-----------------------------------------------|--------------------|
| Current `main` and the latest tagged release  | :white_check_mark: |
| Older tags                                    | :x:                |

Fixes land on `main` and ship as a new tag; older tags are not patched in place.

## Reporting a vulnerability

Send reports to v@valdemar.ai. Encrypted email is preferred; the PGP public key is published at [heyvaldemar.com/security](https://heyvaldemar.com/security).

You can expect an acknowledgment within 7 days. This project does not operate a bounty program; researchers who submit valid, responsibly disclosed reports receive public credit in the release notes and the changelog.

Please do not open public GitHub issues for security reports.

## What there is to trust

One bash script with no dependencies beyond `bash` and `tput`, which it runs as the invoking user and never elevates. Read it before you run it: it is short enough for that to take a minute. GitHub Actions in this repository are pinned by commit SHA.
