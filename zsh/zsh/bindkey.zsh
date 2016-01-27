# HGXonf
# by Alexis 'Horgix' Chotard
# https://bitbucket.org/Horgix/

# bindkey.zsh for ZSH
# Sets the keyboard mode and binds other keys.

# Vi^WEmacs mode ftw.
bindkey -e

# ^P -> edit command line in $EDITOR
autoload edit-command-line
zle -N edit-command-line
bindkey '^P' edit-command-line

# EOF
