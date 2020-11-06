#!/usr/bin/fish

# Dotfile installer
# By Mohammad Amin Mollazadeh

echo 'Installing dotfiles...'

function exist_or_create
  if ! test -d $argv[1]
    mkdir $argv[1]
  end
end

function backup_or_link
  if test -f $argv[1]
    if test -e $argv[2]
      mv $argv[2] $argv[2].bak
      echo "$argv[2] backed up."
    end
    ln -s $argv[1] $argv[2]
  else
    echo "can not install $argv[1], file not found"
  end
end

function backup_or_link_dir
  if test -d $argv[1]
    if test -e $argv[2]
      mv $argv[2] $argv[2].bak
      echo "$argv[2] backed up."
    end
    ln -sT $argv[1] $argv[2]
  else
    echo "can not install $argv[1], directory not found"
  end
end

exist_or_create ~/.config

backup_or_link $PWD/profile.sh $HOME/.profile
backup_or_link $PWD/dir_colors $HOME/.dir_colors
backup_or_link $PWD/nord.xresources $HOME/.Xresources
backup_or_link $PWD/picom.conf $HOME/.config/picom.conf
backup_or_link $PWD/gtkrc-2.0 $HOME/.gtkrc-2.0

backup_or_link_dir $PWD/conky $HOME/.config/conky
backup_or_link_dir $PWD/gtk-3.0 $HOME/.config/gtk-3.0
backup_or_link_dir $PWD/fontconfig $HOME/.config/fontconfig/conf.d
backup_or_link_dir $PWD/htop $HOME/.config/htop
backup_or_link_dir $PWD/i3 $HOME/.config/i3
backup_or_link_dir $PWD/powerline $HOME/.config/powerline
backup_or_link_dir $PWD/rofi $HOME/.config/rofi
backup_or_link_dir $PWD/deadd $HOME/.config/deadd

