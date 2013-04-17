#!/bin/sh
EMACS=$(which emacs)

git submodule init
git submodule update --rebase

pushd cedet-bzr/trunk
make EMACS="$EMACS"
CEDET=$(pwd)
popd

pushd ecb
make EMACS="$EMACS" CEDET="$CEDET"
popd

# Setup Python environment
sudo easy_install jedi epc
sudo easy_install rope ropemode ropemacs

git clone git://github.com/pinard/Pymacs.git
pushd Pymacs
sudo make install
sudo cp pymacs.el /usr/share/emacs/site-lisp/pymacs.el
popd

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
