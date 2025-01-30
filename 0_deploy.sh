#!/bin/bash

curl -H "Cache-Control: no-cache" https://raw.githubusercontent.com/Milooles/deployable-rc/refs/heads/main/1_setup.sh | sh &
disown
