import sys
import os

def main():
    args = sys.argv[1:]

    os.system(f"osascript -e 'display notification \"{args[0]}\"{'with title \"{args[1]}\"' if len(args) > 1 else ''}'")

if __name__ == "__main__":
    main()