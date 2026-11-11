"""Entry point for the Pac-Man game.

Usage: python3 pac-man.py config.json
"""

import sys


def main(argv: list[str]) -> int:
    """Run the game.

    Args:
        argv: Command-line arguments, without the program name.

    Returns:
        The process exit code.
    """
    if len(argv) != 1:
        print("Usage: python3 pac-man.py <config.json>", file=sys.stderr)
        return 1
    print("Pac-Man: not implemented yet (step 0 skeleton).")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
