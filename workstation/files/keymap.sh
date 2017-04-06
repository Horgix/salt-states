#! /bin/sh

# Change keymap by looping through a given set of keymap (us and fr here)

keymaps=('fr' 'us')

layout=$(setxkbmap -query | grep "layout" | grep -Eo "[^ ]*$")
variant=$(setxkbmap -query | grep "variant" | grep -Eo "[^ ]*$")
current=""
next=0
loop=0
keynum=${#keymaps}

if [ -z $variant ]; then
    current="$layout"
else
    current="$layout $variant"
fi

#echo "${keymaps[@]}"

while [[ $loop < 2 ]]; do
    for map in "${keymaps[@]}"; do
        if [ $next == 1 ]; then
            setxkbmap $map
            notify-send -t 400 "Keymap Changed" "$map"
            /usr/bin/espeak -v mb/mb-en1 -s 180 -p 50 "Keymap changed"
            exit 0
        fi
        if [[ "$map" = "$current" ]]; then
            next=1
        fi
    done
    loop=$(($loop + 1))
done
