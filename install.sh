#!/bin/bash

echo [*] Installing zsh...
yay -S zsh zsh-antidote
sudo chsh -s /usr/bin/zsh $USER

echo [*] Installing configs...
stow -S nvim
stow -S hypr
stow -S zsh

echo [*] Done!
