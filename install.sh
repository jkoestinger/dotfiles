#!/bin/bash

echo "[*] Starting local setup installtion..."

source ./scripts/01-install-packages.sh
source ./scripts/02-setup-zsh.sh
source ./scripts/03-setup-hypr.sh
source ./scripts/04-setup-nvim.sh
source ./scripts/05-setup-ghostty.sh
source ./scripts/06-setup-tmux.sh
source ./scripts/07-unclutter.sh

echo "[*] Done!"
