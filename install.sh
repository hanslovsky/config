#!/bin/bash

set -e

repoDir=$(pwd)
cd $HOME
echo "removing existing config files"
rm -rfv .bash .bashrc .conky .emacs .emacs.d .emacs-themes

echo "linking new config files"
cd $repoDir
ln -s $repoDir/.bash $HOME/.bash
ln -s $repoDir/.bashrc $HOME/.bashrc
ln -s $repoDir/.conky $HOME/.conky
ln -s $repoDir/.emacs $HOME/.emacs
ln -s $repoDir/.emacs.d $HOME/.emacs.d
ln -s $repoDir/.emacs-themes/ $HOME/.emacs-themes