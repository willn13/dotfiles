cd $(dirname $0)

function exe () {
    local cmd=$@
    if ! pgrep -x $cmd; then
        $cmd &
    fi
}

exe picom --config=./picom/picom.conf -b
exe $HOME/.config/awesome/scripts/redshift.sh restore

xrdb merge $HOME/.Xresources

xss-lock -- betterlockscreen -l blur &

exe lxsession 

exe autorandr -c

exe nm-applet

exe blueman-applet

exe variety

exe fcitx5

exe mullvad-gui
 
