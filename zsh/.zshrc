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
