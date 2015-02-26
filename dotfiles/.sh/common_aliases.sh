# get bounding box of postscript
alias getbb='gs -dNOPAUSE -dBATCH -q -sDEVICE=bbox'

# emacs
alias emacs='emacs -fn monofur' # this needs to go here because emacs fucks up oxygen font
alias ec='emacsclient -c -n'
alias et='emacsclient -t -s term'
alias e='emacsclient -n'
ecs() { ec "/sudo::$@"; }
ets() { et "/sudo::$@"; }
es() { e "/sudo::$@"; }

# copy terminal output to clipboard
alias termclip="xclip -sel clip"

# pdflatex
alias pdflatex="pdflatex -shell-escape"

# conky orange
alias ckyorange="conky -c $HOME/.conky/conky_orange/conkyrc_orange"

# standard cmake
alias cmake_std="cmake -DCMAKE_INSTALL_PREFIX=$HOME/local"

# latexmk pdf
alias pdfmake="latexmk -pvc"

# make htop work properly in tmux (check if it helps with cmus)
alias htop='TERM=screen htop'

# works for cmus as well
alias cmus='TERM=screen cmus'
