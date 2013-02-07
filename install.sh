#!/bin/bash

set -e

repoDir=$(pwd)
targets=(".sh" ".bashrc" ".conky" ".emacs" ".emacs-themes" ".fonts")
cd $HOME
echo "removing existing config files..."
for t in ${targets[@]}; do
    rm -rf $t
    echo "  $t"
done

echo "linking new config files"
cd $repoDir
for t in ${targets[@]}; do
    ln -s "$repoDir/$t" "$HOME/$t"
    echo "  $HOME/$t -> $t"
done