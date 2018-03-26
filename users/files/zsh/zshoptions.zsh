# HGXonf
# by Alexis 'Horgix' Chotard
# https://bitbucket.org/Horgix/

# zshoptions.zsh for ZSH
# ZSH global options.

setopt autocd
setopt autocontinue
setopt autolist
setopt automenu
setopt autoparamkeys
setopt autoparamslash
setopt correct
unsetopt flow_control
setopt multios
setopt notify
setopt numericglobsort
setopt recexact
setopt aliases

autoload -U edit-command-line

# PUSHD options

## Keeps the directory stack from getting too large
DIRSTACKSIZE=8
## Makes cd act like pushd
setopt autopushd
## Swap the meaning of cd +1 and cd -1
setopt pushdminus
## Keeps the shell from printing the directory stack each time we do a cd/pushd
setopt pushdsilent
## Avoid "pushd' from going to home by default
unsetopt pushdtohome

# EOF
