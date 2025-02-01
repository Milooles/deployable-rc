# Writes to the out var (testing)
# usage /out <message>

system(f"curl -X PUT -d '\"#{ARGV[0]}\"' https://rc-rubber-ducky-deploy-default-rtdb.asia-southeast1.firebasedatabase.app/users/$USER/out.json")
