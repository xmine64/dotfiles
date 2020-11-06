#!/bin/sh

# QT/GTK theme
export QT_QPA_PLATFORMTHEME="gtk2"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

# Path
export PATH="$HOME/.cargo/bin:$HOME/.local/bin:$PATH"
export LD_LIBRARY_PATH="$HOME/.local/lib:$LD_LIBRARY_PATH"

# Default console apps
export PAGER=less
export EDITOR=nvim

