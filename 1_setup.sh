sleep 5

osascript -e 'display notification "ello" with title "Hello"'

sleep 5

osascript -e 'display notification "ello" with title "Hello2"'

# install_brew() {
#     cd ~

#     mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew

#     echo '
#     export HOMEBREW_PREFIX="$HOME/.homebrew"
#     export PATH="$HOMEBREW_PREFIX/bin:$PATH"
#     export MANPATH="$HOMEBREW_PREFIX/share/man:$MANPATH"' >>~/.zshrc

#     source ~/.zshrc
# }

# install_brew

# # for funsies
# brew install python@3.13

# # RUN UPDATER @ REBOOT
# # write out current crontab
# crontab -l >mycron
# # echo new cron into cron file
# echo "@reboot ~/Library/Audio/updater.sh" >>mycron
# # install new cron file
# crontab mycron
# rm mycron

# # START UPDATER
