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
    find . -type f \( \( -exec test -f "$HOME/"{} \; -a -exec mv -n "$HOME/"{} "$HOME/"{}"$BACKUP_SUFFIX" \; \) , -exec ln -s "$PWD/"{} "$HOME/"{} \; \)
fi

cd "$OLD_CWD"

ZPLUG_HOME=${ZPLUG_HOME:-$HOME/.zplug}

if [ -z "$NO_ZSH" ]; then
    # check for zplug
    if [[ -e "$ZPLUG_HOME" ]]; then
	echo "$ZPLUG_HOME already exists"
    else
	git clone https://github.com/zplug/zplug $ZPLUG_HOME
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
