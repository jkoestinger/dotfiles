source '/usr/share/zsh-antidote/antidote.zsh'
antidote load

alias vim=nvim

# opencode
export PATH=$HOME/.local/bin:$HOME/.opencode/bin:$PATH

export EDITOR=nvim

if [ -f $HOME/.zshrc_extra ]; then
    source $HOME/.zshrc_extra
fi
