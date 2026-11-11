# Roadmap

Step-by-step plan derived from the subject (v1.5). Each step ends with a commit
and an update of [kanban.md](kanban.md).

| # | Step | Done when |
|---|------|-----------|
| 0 | Setup: repo, venv, Makefile, lint config, PM docs | `make install lint run` work |
| 1 | Project skeleton (`pacman/` modules, views folder, tests) | Modules exist, lint clean |
| 2 | Config loader (JSON + `#` comments, defaults, clamping) | pytest covers bad/missing/invalid files |
| 3 | Maze adapter around `mazegenerator` | ASCII dump of level 1 (seed 42) is correct |
| 4 | Rendering: walls, dots, HUD | Level 1 drawn, fits the window |
| 5 | Player movement, eating, scoring, level win | Level can be cleared |
| 6 | Ghosts: chase, frightened, eaten/respawn, collisions | Lives lost / ghosts eaten correctly |
| 7 | Progression: 10+ levels, timer, game over, victory, pause | Full run start to end |
| 8 | Views: main menu, instructions, game over, victory, name entry | Full game loop navigable by keyboard |
| 9 | Highscores (JSON, top 10, validation, robust to bad file) | Survives deleted/corrupt file |
| 10 | Cheat mode (invincible, skip level, freeze, +life, speed) | Toggles shown on HUD |
| 11 | Hardening: `lint-strict`, edge cases, acceptance tests | [acceptance_tests.md](acceptance_tests.md) all pass |
| 12 | Packaging: PyInstaller spec at root, itch.io unlisted build | Package works on a clean machine |
| 13 | README (all required sections) + final PM docs | Checklist below complete |

## Facts about the assigned generator (verified by running it)

- Real constructor: `MazeGenerator(size=(w, h), perfect=False, seed=42)`.
  The README's `MazeGenerator(width=..., height=...)` raises `TypeError`.
- Grid is `maze[y][x]`; wall bits N=1, E=2, S=4, W=8. Value `15` = closed
  cell belonging to the "42" pattern.
- `maze_entry` / `maze_exit` are returned as `(x, y)`, not `(row, col)`.
- The centre of the maze lies inside the "42" pattern: spawn on the nearest
  reachable cell instead.
- Some cells inside the "42" are open but unreachable (e.g. values 7, 13):
  place pacgums only on cells reachable (BFS) from the spawn.
- Sizes <= 0 raise `IndexError`; below ~14x10 the "42" is skipped with a
  printed warning. Validate sizes first and wrap the call in `try/except`.
- `seed=0` means random; it reseeds the **global** `random` module, so the
  game uses its own `random.Random()` instance.
- With `perfect=False` it removes dead ends (braiding).

## Graphics library constraint

Only Arcade features with an MLX equivalent are used: window, Views, textures
/ sprites, basic shape drawing, `arcade.Text`, key / update / draw / close
events. Not used: `arcade.gui`, physics engines, Arcade pathfinding, sound.

## README checklist (step 13)

- [ ] First line in italics: *This project has been created as part of the 42 curriculum by ...*
- [ ] Description
- [ ] Instructions
- [ ] Resources (+ how AI was used)
- [ ] Configuration
- [ ] Highscore
- [ ] Maze Generation
- [ ] Implementation
- [ ] General Software Architecture
- [ ] Project Management (link to this folder)
