import sys
import os

os.system(f"osascript -e 'display notification \"{sys.argv[1:]}\"'")