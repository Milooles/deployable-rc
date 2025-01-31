# Sends notification
# usage /notification <message> <title (default Notification)>

import sys
import os

def main():
    args = sys.argv[1:]
    if not args[1]: args.append("Notification")

    os.system(f"osascript -e 'display notification \"{args[0]}\" with title \"{args[1]}\"'")

if __name__ == "__main__":
    main()