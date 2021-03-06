#!/bin/bash -e 
set -x
#======================================================================================
# Author  : Zain
# AS ALLWAYS, KNOW WHAT YOU ARE DOING.
#======================================================================================
# checking you have everything you need
sudo pacman -S base-devel git wget yajl --noconfirm

#dependencies for yaourt
#Installing yaourt

TMP_DIR=$(mktemp -d)
cd "$TMP_DIR"

install_aur() {
	# usage: install_aur tar.gz url
	targz="$(basename "$1")"
	curl -O "$1"
	tar xvf "$targz"
	pushd "${targz%.*.*}"
	makepkg -si --noconfirm
}

install_aur https://aur.archlinux.org/cgit/aur.git/snapshot/package-query.tar.gz
install_aur https://aur.archlinux.org/cgit/aur.git/snapshot/yaourt.tar.gz

echo "################################################################"
echo "###################    yaourt installed     ####################"
echo "################################################################"

