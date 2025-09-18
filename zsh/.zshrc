source '/usr/share/zsh-antidote/antidote.zsh'
antidote load

alias vim=nvim

# opencode
export PATH=$HOME/.local/local-bin/:$HOME/.local/bin/local:$HOME/.local/bin/synced:$HOME/.opencode/bin:$PATH

export EDITOR=nvim

if [ -f $HOME/.zshrc_extra ]; then
    source $HOME/.zshrc_extra
fi
