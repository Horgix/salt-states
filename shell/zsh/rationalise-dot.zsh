# HGXonf
# by Alexis 'Horgix' Chotard
# https://bitbucket.org/Horgix/

# rationalise-dot.zsh for ZSH
# A ZLE plugin to transform ... -> ../.. when typing.

function rationalise-dot {
    if [[ $LBUFFER = *.. ]]; then
        LBUFFER+=/..
    else
        LBUFFER+=.
    fi
}

zle -N rationalise-dot
bindkey . rationalise-dot

# EOF
