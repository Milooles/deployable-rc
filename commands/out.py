import sys
import os

def main():
    sys.argv.pop(0)
    os.system("osascript -e 'display notification \"" + " ".join(sys.argv) + "\"'")

if __name__ == "__main__":
    main()