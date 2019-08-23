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
      echo "$argv[2] backed up."
      mv $argv[2] $argv[2].bak
    end
    ln -s $argv[1] $argv[2]
  else
    echo "can not install $argv[1]"
  end
end

exist_or_create ~/.config
exist_or_create ~/.config/i3
exist_or_create ~/.config/i3status

backup_or_link $PWD/profile.sh ~/.profile
# unstable
#backup_or_link $PWD/xinitrc.fish ~/.xinitrc
backup_or_link $PWD/compton.conf ~/.config/compton.conf
backup_or_link $PWD/conky.conf ~/.config/conkyrc
backup_or_link $PWD/i3.conf ~/.config/i3/config
backup_or_link $PWD/i3status.conf ~/.config/i3status/config
backup_or_link $PWD/tmux.conf ~/.tmux.conf
backup_or_link $PWD/tmux.local.conf ~/.tmux.conf.local
