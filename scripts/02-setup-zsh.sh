if [ "$SHELL" = "/usr/bin/zsh" ]; then
  echo "  [>] User is already using ZSH, skipping ZSH setup..."
else
  echo "  [>] Changing default shell to ZSH and adding config..."
  sudo chsh -s /usr/bin/zsh "$USER"
  stow -S zsh
fi
