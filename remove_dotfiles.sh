#!/bin/bash

OLD_CWD="$PWD"
ROOT_DIR="$(git rev-parse --show-toplevel)"
BACKUP_SUFFIX="${BACKUP_SUFFIX:-}"


cd "$ROOT_DIR/dotfiles"

find . -type f -exec rm -f "$HOME/"{}"$BACKUP_SUFFIX" \;

cd "$OLD_CWD"
