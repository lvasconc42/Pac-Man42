# Risk analysis

| Risk | Impact | Likelihood | Mitigation |
|------|--------|------------|------------|
| An Arcade feature is judged "not MLX-equivalent" at the defence | High | Medium | Restrict to window/sprites/shapes/text/events; no `arcade.gui`, physics, sound. Validate with peers early. |
| Generator README does not match its real API | Medium | Certain | API verified by running it; documented in ROADMAP.md. |
| Generator crashes on bad sizes from the config | High | Medium | Validate sizes before calling; wrap call in `try/except`; fall back to defaults. |
| Pacgums placed on unreachable cells -> level impossible | High | High | Place pacgums only on BFS-reachable cells. |
| Centre cell is inside the "42" pattern | Medium | Certain | Spawn on nearest reachable cell to the centre. |
| Generator reseeds global `random` | Low | Certain | Use a dedicated `random.Random()` for game logic. |
| Python 3.14 is very new (PyInstaller support) | Medium | Low | Arcade verified; check PyInstaller early (step 12); fall back to Python 3.12 via uv. |
| Config changed during the defence | High | Certain | Defaults + clamping + clear messages; pytest on bad configs. |
| Packaged build cannot find assets / write highscores | High | Medium | Resolve paths via `sys._MEIPASS`; write highscores to a writable user directory. |
| Unhandled exception during the review = fail | High | Medium | Top-level `try/except` in `pac-man.py`; edge-case tests in step 11. |
