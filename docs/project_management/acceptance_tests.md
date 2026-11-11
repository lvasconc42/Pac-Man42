# Acceptance test plan

| # | Feature | Test | Expected | Result |
|---|---------|------|----------|--------|
| 1 | CLI | `python3 pac-man.py` (no arg) | Usage message, no traceback | |
| 2 | CLI | Missing / non-JSON file | Clear error, no traceback | |
| 3 | Config | Invalid value / missing key / unknown key | Logged, default used, game runs | |
| 4 | Maze | Generator fails (bad size) | Clean message, no crash | |
| 5 | Highscore | Deleted / corrupt highscore file | Empty list, game runs | |

## Bugs found / fixed

| Date | Bug | Fix |
|------|-----|-----|
