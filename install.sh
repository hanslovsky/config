#!/bin/bash

set -e

repoDir=$(pwd)
targets=(".sh"
    ".bashrc"
    ".zshrc"
    ".conky"
    ".emacs"
    ".emacs-themes"
    ".fonts"
    ".gitconfig"
    ".gitignore"
    ".i3"
    ".xsessionrc"
    ".tmux.conf"
    "$(ls .emacs.d | while read x; do echo .emacs.d/$x; done)"
    "$(ls .ipython | while read x; do echo .ipython/$x; done)"
    ".latexmkrc"
    "$(ls texmf/tex/latex | while read x; do echo texmf/tex/latex/$x; done)")
cd $HOME

if ! [[ -d ".emacs.d" ]]; then
    echo "Need to create ~/.emacs.d"
    mkdir -p .emacs.d
fi

if ! [[ -d ".ipython" ]]; then
    echo "Need to create ~/.ipython"
    mkdir -p .ipython
fi

if ! [[ -d "~/texmf/tex/latex" ]]; then
    echo "Need to create ~/texmf/tex/latex"
    mkdir -p texmf/tex/latex
fi

echo "removing existing config files..."
for t in ${targets[@]}; do
    rm -rf $t
    echo "  $t"
done


echo "linking new config files"
cd $repoDir
for t in ${targets[@]}; do
    ln -s "$repoDir/$t" "$HOME/$t"
    echo "  $HOME/$t -> $repoDir/$t"
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

