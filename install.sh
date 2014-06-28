#!/bin/bash

# set -e

OLD_CWD="$PWD"
ROOT_DIR="$(git rev-parse --show-toplevel)"
BACKUP_SUFFIX="${BACKUP_SUFFIX:-}"
NO_ZSH="${NO_ZSH:-}"


cd "$ROOT_DIR/dotfiles"

# create directories if neccessary
find . ! -path . -type d -exec mkdir -p "$HOME/"{} \;

# rm existing config files and link to those in the repository
if [ -z "$BACKUP_SUFFIX" ]; then
    find . -type f -exec rm -f "$HOME/"{} \; -exec ln -s "$PWD/"{} "$HOME/"{} \;
else
    find . -type f -exec test -f "$HOME/"{} \; -exec mv -n "$HOME/"{} "$HOME/"{}"$BACKUP_SUFFIX" \; -exec ln -s "$PWD/"{} "$HOME/"{} \;
fi

cd "$OLD_CWD"

if [ -z "$NO_ZSH" ]; then
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
fi
