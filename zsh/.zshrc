if command -v zoxide &> /dev/null; then
  eval "$(zoxide init zsh)"
fi

if command -v fzf &> /dev/null; then
  if [[ -f /usr/share/fzf/completion.zsh ]]; then
    source /usr/share/fzf/completion.zsh
  fi
  if [[ -f /usr/share/fzf/key-bindings.zsh ]]; then
    source /usr/share/fzf/key-bindings.zsh
  fi
fi

source ~/.local/share/omarchy/default/bash/functions
source ~/.local/share/omarchy/default/bash/aliases


source '/usr/share/zsh-antidote/antidote.zsh'
antidote load

alias vim=nvim
alias tn='tmux new-session -A -s'
alias tl='tmux list-sessions'
alias ta='tmux attach-session'

# opencode
export PATH=$HOME/.local/local-bin/:$HOME/.local/bin/local:$HOME/.local/bin/synced:$HOME/.opencode/bin:$PATH

export EDITOR=nvim

if [ -f $HOME/.zshrc_extra ]; then
    source $HOME/.zshrc_extra
fi
