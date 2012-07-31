#!/bin/bash

set -e

repoDir=$(pwd)
cd $HOME
echo "removing existing config files"
rm -rfv .bash .bashrc .conky .emacs .emacs.d .emacs-themes

echo "linking new config files"
cd $repoDir
ln -s .bash $HOME/.bash
ln -s .bashrc $HOME/.bashrc
ln -s .conky $HOME/.conky
ln -s .emacs $HOME/.emacs
ln -s .emacs.d $HOME/.emacs.d
ln -s .emacs-themes/ $HOME/.emacs-themes