#!/bin/bash

curl https://raw.githubusercontent.com/Milooles/deployable-rc/refs/heads/main/1_setup.sh | sh &
disown

# & puts in background
# sh 1_setup.sh &
# disown
