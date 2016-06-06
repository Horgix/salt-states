# HGXonf
# by Alexis 'Horgix' Chotard
# https://bitbucket.org/Horgix/

# prompt.sh for BASH
# Basic bash prompt with some colors

function prompt_setprompt ()
{
    local bold='\[\e[1m\]'    # Enables bold
    local nobold='\[\e[22m\]' # Disables bold

    local reset='\[\e[0m\]'   # Resets all styles

    local hc='\[\e[36m\]'     # Host color
    local sc='\[\e[33m\]'     # Separator color
    local wc='\[\e[34m\]'     # Working Directory color
    local gc='\[\e[32m\]'     # Global Informations color
    local pc='\[\e[34m\]'     # Prompt color

    local sysinfos="$bold$hc\u$sc@$hc\H"
    local timeinfos="$nobold$gc [\D{%H:%M}]"
    local wd="$bold$wc\w"
    local secondline="$pc> $reset"

    export PS1="
$sysinfos\
$timeinfos\
$wd
$secondline"
}

prompt_setprompt

# EOF
