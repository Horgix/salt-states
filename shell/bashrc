# HGXonf
# by Alexis 'Horgix' Chotard
# https://bitbucket.org/Horgix/

# .bashrc for BASH
# Loads every needed configuration file for bash

for file in ~/.shell-config/*; do
    source $file;
done

for file in ~/.bash/*; do
    source $file;
done

if [ -d ~/.local.bash/ ]; then
    for file in ~/.local.bash/*; do
        source $file;
    done
fi

if [ -f ~/.extra-paths ]; then
    source ~/.extra-paths
fi

true

# EOF
