# Sends notification
# usage /notification <message> <title (default Notification)>

if ARGV.length == 1
    ARGV.push("Notification")
end

system("osascript -e 'display notification \"#{ARGV[0]}\" with title \"#{ARGV[1]}\"'")