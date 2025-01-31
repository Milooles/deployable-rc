import sys
import os

def main():
    args = sys.argv[1:]
    # if not args[1]: args[1] = "Notification"

    os.system(f"osascript -e 'display notification \"{args[0]}\"'")

if __name__ == "__main__":
    main()