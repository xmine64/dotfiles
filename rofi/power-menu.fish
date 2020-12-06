#!/usr/bin/fish

# Power Menu for Rofi
# By @the_madamin (github.com/mmdmine)

if set -q ROFI_RETV
else
  echo 'Run "rofi -modi power:./power-menu.fish -show power" to show the menu'
  exit 1
end

function rofi_msg
  echo -en "\0message\x1f$argv[1]\n"
  echo -en "OK\0icon\x1fstate-ok\n"
end

function rofi_row
  echo -en "$argv[1]\0icon\x1f$argv[2]\n"
end

if test $ROFI_RETV -eq 0
  rofi_row "Lock Screen" "system-lock-screen"
  rofi_row "Shutdown" "system-shutdown"
  rofi_row "Reboot" "system-reboot"
  rofi_row "Suspend" "system-suspend"
  rofi_row "Hibernate" "system-suspend-hibernate"
  rofi_row "Exit i3" "system-log-out"
  rofi_row "Switch User" "system-switch-user"
else if test $ROFI_RETV -eq 1
  switch $argv[1]
    case OK
      exit 0
    case "Exit i3"
      i3-msg -t run_command exit
    case "Shutdown"
      poweroff
    case "Reboot"
      reboot
    case "Suspend"
      dm-tool lock
      systemctl suspend
    case "Lock Screen"
      dm-tool lock
    case "Switch User"
      dm-tool switch-to-greeter
    case '*'
      rofi_msg "Error: Unsupported action '$argv[1]'."
  end
else
  # unsupported action
end
