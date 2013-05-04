#!/bin/sh
git submodule init
git submodule update --rebase

pushd auto-complete
git submodule init
git submodule update --rebase
popd

# I use my own flymake version
# sudo rm -f /usr/share/emacs/24.*/lisp/progmodes/flymake.el*

# Setup Python environment
sudo easy_install jedi epc

# Seetup xml flymake
yum install xmlstarlet

# Setup java environment
# install eclipse and m2e plugin
git clone git://github.com/ervandew/eclim.git
pushd eclim
ant clean deploy -Declipse.home=/usr/lib64/eclipse
popd

cat >~/.eclimrc <<EOF
# workspace dir
osgi.instance.area.default=@user.home/Work/

# increase heap size
-Xmx256M

# increase perm gen size
-XX:PermSize=64m
-XX:MaxPermSize=128m
EOF


ln -sf $PWD/dot-emacs $HOME/.emacs
cat >>$HOME/.bashrc <<EOF

# Emacs specific aliases and functions
. "$HOME/.emacs.d/dot-bashrc"

EOF
