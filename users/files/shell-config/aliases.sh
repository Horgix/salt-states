# HGXonf
# by Alexis 'Horgix' Chotard
# https://bitbucket.org/Horgix/

# aliases.sh for SHELLS
# Defines a lot of useful aliases

# Nocorrect
alias cp="nocorrect cp"
alias mkdir="nocorrect mkdir"
alias mv="nocorrect mv"

# ls
alias l="ls -lah --color"
alias ls="ls -lh --color"
alias ll="ls -lh --color"

# grep
alias grep="grep --color"

# Development
alias mygcc='gcc -Wall -Wextra -std=c99 -pedantic'
alias py='python2'
alias g='git'

# mount
alias mymount='sudo mount /dev/sdb1 /media'
alias myumount='sudo umount /media'

# Vim
alias v="vim"
alias e="vim"
alias vmi="vim"

# Xrandr
alias xrandrVGA169only='xrandr --output VGA1 --mode 1920x1080 --output LVDS1 --off'
alias xrandrVGA43only='xrandr --output VGA1 --mode 1280x1024 --output LVDS1 --off'
alias xrandrBoth169='xrandr --output VGA1 --mode 1920x1080 --left-of LVDS1 --output LVDS1 --mode 1024x600'
alias xrandrBoth43='xrandr --output VGA1 --mode 1280x1024 --left-of LVDS1 --output LVDS1 --mode 1024x600'
alias xrandrLVDSOnly='xrandr --output VGA1 --off --output LVDS1 --mode 1024x600'

# Network
alias pingtest='ping -c 3 www.google.com'
alias p='pingtest'

# Sound
alias mute='amixer sset Master 0 mute'

# Directories
alias work='cd /home/horgix/work/ing1/projects'
alias hop='work; cd .'
alias dh='dirs -v'
alias conf='cd ~/.hgxonf'

# Power state
alias z='sh ~/.i3/lock.sh'
alias veille='z; sudo pm-suspend'

# Keymap
alias fr='setxkbmap fr'
alias us='setxkbmap us'

# Fun
alias starwars='traceroute 216.81.59.173 -m 255'

# Tar gZip Dir (Z) / Tar bzip2 (J) Dir
#function tzd { tar czvf "$1.tar.gz" "$1"; }
#function tjd { tar cjvf "$1.tar.bz2" "$1"; }

# Clean *.pyc in a directory
#alias nopyc="find -name '*.pyc' -print -delete"

# If iproute2 is present, do not use ifconfig!
#if which ip &>/dev/null; then
#    function ifconfig { echo 'You should use iproute2!'; }
#fi

alias dog='highlight -O ansi'

pssh () {
  proxy_str=$(echo $http_proxy | cut -f 3 -d /)
  proxy_auth=$(echo $proxy_str | awk -F @ '{print $1}')
  proxy_host=$(echo $proxy_str | awk -F @ '{print $2}')
  if [ -n "$proxy_auth" ]
  then
    auth_flag="-P $(echo $proxy_auth | tr -d '@')"
  fi
  ssh -o "ProxyCommand proxytunnel -p $proxy_host $auth_flag -d %h:%p" $@
}

alias ssh='TERM=rxvt ssh'
alias irc='tmux attach -t irc'
alias ip='ip -c'
alias ssha='ssh-agent -t 12h | grep -v echo > ~/.ssh/ssh_${HOST}_${USER}.agent && source ~/.ssh/ssh_${HOST}_${USER}.agent && ssh-add'

# Dockerized tools <3

alias marathonctl='docker run -it --rm shoenig/marathonctl:latest'
alias utf8arrow='echo →'

