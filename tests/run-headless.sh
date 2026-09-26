#!/bin/bash
# What the tree promises, checked on a pseudo-terminal with no one watching:
# it draws the tree and the trunk, greets next year, keeps blinking until it
# is stopped, and gives the terminal back - cursor visible - on Ctrl-C.
# tests/plant-violations.py breaks each promise in a copy of the script and
# requires this to notice.
#
#   ./tests/run-headless.sh        (needs util-linux `script` and `tput`)
set -uo pipefail
cd "$(dirname "$0")/.." || exit 1
PASSED=0; FAILED=0
check() { if [ "$1" = yes ]; then echo "  PASS: $2"; PASSED=$((PASSED+1)); else echo "  FAIL: $3"; FAILED=$((FAILED+1)); fi; }
has() { if grep -q "$@"; then echo yes; else echo no; fi; }
WORK="$(mktemp -d)"; trap 'rm -rf "$WORK"' EXIT

# On a pseudo-terminal, with a reader that keeps reading until the run ends:
# `script` stops draining the terminal once its own input closes, and the
# tree's Ctrl-C handler (tput reset) then waits for a drain that never comes.
# A real terminal always drains, so the harness has to as well.
run_tty() {  # run_tty <signal> <seconds> <log>
  sleep "$(( $2 + 8 ))" | TERM=xterm script -qec "stty cols 80 rows 30; timeout -k 5 -s $1 $2 bash terminal-christmas-tree.sh" "$3" >/dev/null 2>&1
}

run_tty TERM 4 "$WORK/run"
rc=$?
# util-linux script passes the child's status through: 124 is "timed out".
check "$([ "$rc" -eq 124 ] && echo yes || echo no)" "still blinking at four seconds" "the script ended on its own (exit $rc) instead of blinking until stopped"
screen="$(sed 's/\x1b\[[0-9;?]*[a-zA-Z]//g; s/\x1b[()][0-9A-B]//g' "$WORK/run" | tr -d '\r\017')"

# Each row is drawn after a cursor move, so a row is what lies between two
# of them; with the escapes merely stripped, the rows run together and any
# tree has nineteen stars in a row somewhere.
widest="$(sed 's/\x1b\[[0-9;]*H/\n/g' "$WORK/run" | sed 's/\x1b\[[0-9;?]*[a-zA-Z]//g; s/\x1b[()][0-9A-B]//g' | tr -d '\r\017' | grep -E '^\*+$' | awk '{ if (length($0) > m) m = length($0) } END { print m + 0 }')"
check "$([ "$widest" -eq 19 ] && echo yes || echo no)" "the tree's widest row is 19 stars" "the widest row is $widest stars, not 19: the tree was not drawn to size"
check "$([ "$(grep -o 'mWm' <<<"$screen" | wc -l | tr -d ' ')" -ge 2 ] && echo yes || echo no)" "the trunk is there" "no trunk"
check "$(has 'MERRY CHRISTMAS' <<<"$screen")" "the greeting is drawn" "no greeting"
next=$(( $(date +%Y) + 1 ))
check "$(has "And lots of CODE in $next" <<<"$screen")" "it wishes for next year, $next" "the year in the greeting is not $next"

# Ctrl-C: the trap must reset the terminal and show the cursor again.
run_tty INT 3 "$WORK/int"
check "$(has $'\x1b\\[?25h' "$WORK/int")" "Ctrl-C shows the cursor again" "Ctrl-C left the cursor hidden"

echo
echo "passed: $PASSED   failed: $FAILED"
[ "$FAILED" -eq 0 ]
