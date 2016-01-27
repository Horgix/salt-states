# HGXonf
# by Alexis 'Horgix' Chotard
# https://bitbucket.org/Horgix/

# rl.sh for BASH
# Defines a 'rl' function which reload bash configuration

function rl
{
    hash -r
    source ~/.bashrc
}

# EOF
