# HGXonf
# by Alexis 'Horgix' Chotard
# https://bitbucket.org/Horgix/

# mkcd.sh for SHELLS
# Defines a mkcd function which mkdir a directory and cd into it

function mkcd
{
    nocorrect mkdir -p "$1" && cd "$1"
}

# EOF
