# -*- grammar-ext: sh -*-

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

NODE_ENV=production forever start ~/code/apollo/server.js &
NODE_ENV=production forever start ~/code/PurpleRSS/index.js &
sleep 20s && conkystartup &
compton -b --config ~/.config/compton/compton.conf &
dunst &
exec startxfce4
