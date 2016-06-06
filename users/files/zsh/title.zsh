# HGXonf
# # by Alexis 'Horgix' Chotard
# # https://bitbucket.org/Horgix/
#
# title.zsh for ZSH
# Title bar handling

function set_title {
    a=${(V)1//\%/\%\%}
    a=$(print -Pn "%40>...>$a" | tr -d "\n")

    case $TERM in
    screen*)
      print -Pn "\ek$a:$3\e\\"      # screen title (in ^A")
      ;;
    xterm*|*rxvt*)
      print -Pn "\e]2;$2 | $a:$3\a" # plain xterm title
      ;;
    esac
}

function title_precmd {
    set_title "zsh" "$USER@%m" "%55<...<%~"
}

function title_preexec {
    set_title "$1" "$USER@%m" "%35<...<%~"
}

autoload -U add-zsh-hook
add-zsh-hook precmd title_precmd
add-zsh-hook preexec title_preexec

# EOF
