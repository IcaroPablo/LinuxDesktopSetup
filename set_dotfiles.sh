#!/bin/bash

# create backups of the existing dotfiles in system (defined at dotfiles_list below)
# takes $HOME as first positional argument

HOME=$1
echo "\$HOME defined as $HOME"
echo ""

dotfiles_list=(
$HOME/.xinitrc
$HOME/.bashrc
$HOME/.zshrc
$HOME/.vimrc
$HOME/.xprofile
$HOME/.config/nvim/init.vim
$HOME/.config/mimeapps.list
$HOME/.config/picom/picom.conf
/etc/pacman.conf
/etc/pacman.d/mirrorlist
)

for dotfile in ${dotfiles_list[@]}; do

	# get dotfile name from dotfiles_list and create a new backup name
	echo "backing up $dotfile"
	bkpname="$(echo $dotfile)-bkp-$(printf '%(%Y-%m-%d_%H-%M-%S)T')"

	# change dotfile name and move it to dotfiles_backup folder
	echo "storing $bkpname in $(pwd)/dotfiles_backup"
	mv $dotfile $bkpname
	cp $bkpname $(pwd)/dotfiles_backup

	#getting dotfile name
	dotfile_name="$(echo $dotfile | sed 's/\// /g' | awk '{print $NF}')"

	#getting dotfile location
	dotfile_location="$(echo $dotfile | sed 's%/[^/]*$%/%')"

    # link saved version of the dotfile to the correct location
    echo "creating link fot $dotfile_name at $dotfile_location"
	ln -s $(pwd)/dotfiles/$dotfile_name $dotfile_location
    echo ""

done
