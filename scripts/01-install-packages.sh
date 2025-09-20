echo "  [>] Installing packages..."
yay --needed --noconfirm -Sq zsh zsh-antidote lazyssh-bin hyprmon-bin >/dev/null 2>&1
sudo pacman --needed --noconfirm -Sq lazygit ghostty stow tmux >/dev/null 2>&1
