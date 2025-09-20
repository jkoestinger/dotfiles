if command -v tmux &>/dev/null; then
  echo "  [>] Tmux already installed, skipping..."
else
  echo "  [>] Setting up Tmux"
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm >/dev/null 2>&1
  stow -S tmux
fi
