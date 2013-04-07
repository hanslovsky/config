#!/bin/bash

set -e

repoDir=$(pwd)
targets=(".sh" ".bashrc" ".zshrc" ".conky" ".emacs" ".emacs-themes" ".fonts" ".gitconfig" ".gitignore" ".i3" ".xsessionrc")
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

# check for oh-my-zsh
if [[ -d "$HOME/git/oh-my-zsh" ]]; then
    if [[ -e "$HOME/.oh-my-zsh" ]]; then
	echo "~/.oh-my-zsh already exists"
    else
	echo "linking oh-my-zsh"
	ln -s "$HOME/git/oh-my-zsh" "$HOME/.oh-my-zsh"
    fi
else
    echo "$HOME/git/oh-my-zsh does not exist"
    echo "  type \"git clone git://github.com/robbyrussell/oh-my-zsh.git\" to get it"
fi

# set standard shell
std_shell="$(which zsh)"
if [ -n "$std_shell" ]; then
    if [ -z "$(cat /etc/passwd | grep $USER | grep zsh)" ]; then
        echo "setting standard shell to $std_shell"
        chsh -s $std_shell
    fi
fi

