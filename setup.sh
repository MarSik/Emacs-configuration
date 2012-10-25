#!/bin/sh
git submodule init
git submodule update --rebase

ln -sf $PWD/dot-emacs $HOME/.emacs
cat >>$HOME/.bashrc <<EOF

# Emacs specific aliases and functions
. "$HOME/.emacs.d/dot-bashrc"

EOF
