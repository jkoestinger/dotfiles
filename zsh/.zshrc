source '/usr/share/zsh-antidote/antidote.zsh'
antidote load

alias vim=nvim

# opencode
export PATH=/home/justin/.opencode/bin:$PATH

if [ -f $HOME/.zshrc_extra ]; then
    source $HOME/.zshrc_extra
fi
