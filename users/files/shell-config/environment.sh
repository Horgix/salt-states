# HGXonf
# by Alexis 'Horgix' Chotard
# https://bitbucket.org/Horgix/

# environment.sh for SHELLS
# Set/unset some useful environment variables

# Set the default EDITOR to vim
export EDITOR=vim

# TODO : use localectl instead
# Set default encoding to UTF8 settings
export LC_ALL=en_US.UTF-8

# Set default Language to en_US from LC_ALL
export LANGUAGE="$LC_ALL"
export LANG="$LC_ALL"

# Set TERMINAL for i3-sensible-terminal call
export TERMINAL=urxvt

# Set NTTPSERVER for slrn (it's the newsgroup it will read from)
export NNTPSERVER="news.epita.fr"

# Set LESSHISTFILE to avoid less history from being stored in ~/.lesshst
export LESSHISTFILE="-"

# Set the pager according to the following priority :
# most > less > more > None
if [ -x "`which most 2> /dev/null`" ]; then
    export PAGER=most
elif [ -x "`which less 2> /dev/null`" ]; then
    export PAGER=less
elif [ -x "`which more 2> /dev/null`" ]; then
    export PAGER=more
fi

export PATH=$HOME/.myscripts:$HOME/docker-helpers:$PATH
export SCREENSHOTS=/home/horgix/screenshots/
export SMILEUSER=alcho

FZF_CTRL_R_OPTS="--reverse"
