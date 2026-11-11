# Decision log

| Date | Decision | Reason |
|------|----------|--------|
| 2026-11-11 | Use Arcade 3.3.3 (subset with MLX equivalents) | Simple 2D API, works on Python 3.14 (verified) |
| 2026-11-11 | Use `uv` for the venv, fallback to `python3 -m venv` in the Makefile | `python3-venv` not installed on dev machine |
| 2026-11-11 | Separate game logic (`game.py`) from drawing (`views/`) | Testable without a window; easier changes at the defence |
