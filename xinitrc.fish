#!/bin/fish

set userresources $HOME/.Xresources
set usermodmap $HOME/.Xmodmap
set sysresources /etc/X11/xinit/.Xresources
set sysmodmap /etc/X11/xinit/.Xmodmap

set DEFAULT_SESSION i3 --shmlog-size 0

# merge in defaults and keymaps

if test -f $sysresources
  xrdb -merge $sysresources
end

if test -f $sysmodmap
  xmodmap $sysmodmap
end

if test -f "$userresources"
  xrdb -merge "$userresources"
end

if test -f "$usermodmap"
  xmodmap "$usermodmap"
end

# start some nice programs

if test -d /etc/X11/xinit/xinitrc.d
  for f in /etc/X11/xinit/xinitrc.d/*.fish
    if test -x "$f"
      source $f
    end
  end
end

#set dbus_args --sh-syntax --exit-with-session
if test $argv[1]
  switch $argv[1]
  case awesome
    set dbus_args $dbus_args awesome
  case bspwm
    set dbus_args $dbus_args bspwm-session
  case budgie
    set dbus_args $dbus_args budgie-desktop
  case cinnamon
    set dbus_args $dbus_args cinnamon-session
  case deepin
    set dbus_args $dbus_args startdde
  case enlightenment
    set dbus_args $dbus_args enlightenment_start
  case fluxbox
    set dbus_args $dbus_args startfluxbox
  case i3 i3wm
    set dbus_args $dbus_args i3 --shmlog-size 0
  case gnome
    set dbus_args $dbus_args gnome-session
  case jwm
    set dbus_args $dbus_args jwm
  case kde
    set dbus_args $dbus_args startkde
  case lxde
    set dbus_args $dbus_args startlxde
  case lxqt-session
    set dbus_args $dbus_args lxqt-session
  case mate
    set dbus_args $dbus_args mate-session
  case xfce
    set dbus_args $dbus_args xfce4-session
  case openbox
    set dbus_args $dbus_args openbox-session
  case '*'
    set dbus_args $dbus_args $DEFAULT_SESSION
  end
else
  set dbus_args $dbus_args $DEFAULT_SESSION
end

exec dbus-run-session $dbus_args