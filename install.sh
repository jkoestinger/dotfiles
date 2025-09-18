#!/bin/bash

HYPR_LOCAL_PATH=$HOME/.config/hypr-local

echo [*] Installing zsh...
yay --needed --noconfirm -Sq zsh zsh-antidote lazyssh-bin hyprmon-bin
sudo pacman --needed --noconfirm -Sq lazygit ghostty
sudo chsh -s /usr/bin/zsh $USER

echo [*] Creating local hypr config files...
mkdir -p $HYPR_LOCAL_PATH
touch $HYPR_LOCAL_PATH/autostart.conf
touch $HYPR_LOCAL_PATH/bindings.conf
touch $HYPR_LOCAL_PATH/envs.conf
touch $HYPR_LOCAL_PATH/hypridle.conf
touch $HYPR_LOCAL_PATH/hyprland.conf
touch $HYPR_LOCAL_PATH/hyprlock.conf
touch $HYPR_LOCAL_PATH/hyprsunset.conf
touch $HYPR_LOCAL_PATH/input.conf
touch $HYPR_LOCAL_PATH/monitors.conf
touch $HYPR_LOCAL_PATH/windows.conf

echo [*] Installing configs...
stow -S nvim
stow -S hypr
stow -S zsh
stow -S ghostty

echo [*] Done!
