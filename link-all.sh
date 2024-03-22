#!/bin/bash
SCRIPT=$(realpath "$0")
BASE_DIR=$(dirname "$SCRIPT")

CONFIG_DIR="$HOME/.config"

function get_latest_state () {
    cd "$1" && git checkout main && git pull && cd -
}

# (re)link nvim config
echo "[*] Linking nvim config..."
source_dir="$BASE_DIR/nvim"
get_latest_state $source_dir
rm -rf "$CONFIG_DIR/nvim"
ln -s "$source_dir" "$CONFIG_DIR/nvim"

# (re)link tmux config
echo "[*] Linking tmux config..."
source_dir="$BASE_DIR/tmux"
get_latest_state $source_dir
rm -rf "$CONFIG_DIR/tmux"
ln -s "$source_dir" "$CONFIG_DIR/tmux"

echo "[*] Done!"
