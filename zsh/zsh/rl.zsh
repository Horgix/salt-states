# HGXonf
# # by Alexis 'Horgix' Chotard
# # https://bitbucket.org/Horgix/
#
# rl.zsh for ZSH
# Defines a 'rl' function which reload zsh configuration

function rl
{
    hash -r
    source ~/.zshrc
}

# EOF
