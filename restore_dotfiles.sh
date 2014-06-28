#!/bin/bash



OLD_CWD="$PWD"
ROOT_DIR="$(git rev-parse --show-toplevel)"
BACKUP_SUFFIX="${BACKUP_SUFFIX:-}"


cd "$ROOT_DIR/dotfiles"

find . -type f -exec mv "$HOME/"{}"$BACKUP_SUFFIX" "$HOME/"{} \;

cd "$OLD_CWD"
