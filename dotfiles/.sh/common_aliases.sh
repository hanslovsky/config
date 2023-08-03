# get bounding box of postscript
alias getbb='gs -dNOPAUSE -dBATCH -q -sDEVICE=bbox'

# emacs
alias ec='emacsclient -c -n'
alias et='emacsclient -t -s term'
alias e='emacsclient -n'
ecs() { ec "/sudo::$@"; }
ets() { et "/sudo::$@"; }
es() { e "/sudo::$@"; }

# copy terminal output to clipboard
alias termclip="xclip -sel clip"

# remove trailing newlines from clipboard content and store result in clipboard
alias clip_rm_nl='printf "%s" "$(xclip -o -selection clipboard)" | xclip -selection clipboard'

# pdflatex
alias pdflatex="pdflatex -shell-escape"

# conky orange
alias ckyorange="conky -c $HOME/.conky/conky_orange/conkyrc_orange"

# standard cmake
alias cmake_std="cmake -DCMAKE_INSTALL_PREFIX=$LOCAL"

# latexmk pdf
alias pdfmake="latexmk -pvc"

# make htop work properly in tmux (check if it helps with cmus)
alias htop='TERM=screen htop'

# works for cmus as well
alias cmus='TERM=screen cmus'

# pip install with --prefix=$LOCAL
alias pinstall='pip install --install-option="--prefix=$LOCAL"'

# perl-rename if it exists, 
hash perl-rename 2>/dev/null && alias rename='perl-rename'

# list unstage changes in git repo, sorted by modification time
# inspired by https://jayenashar.wordpress.com/2014/03/07/git-status-sorted-by-last-modified-timestamp/
#list-unstaged() { [ "$1" = "all" ] && MATCH="?M" || MATCH="??"; ls -lrtd $(git status --porcelain | grep "^.[$MATCH]" | sed "s/^.. //"); }

hash mvn >/dev/null 2>&1 && alias artifact-version="mvn -Dexec.executable='echo' -Dexec.args='\${project.version}' --non-recursive exec:exec -q"

# thanks to @ctrueden!
# https://github.com/imagej/imagej/blob/imagej-2.0.0-rc-61/pom.xml#L395-L626
# https://imagej.net/Uber-JAR
hash mvn >/dev/null 2>&1 && alias mvn-deps="mvn -Pdeps"

hash ag >/dev/null 2>&1 && alias ags='ag -s'

# find out which network device is used for internet
# https://unix.stackexchange.com/a/14967
# $ route
# Kernel IP routing table
# Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
# 192.168.1.0     *               255.255.255.0   U     1      0        0 eth0
# link-local      *               255.255.0.0     U     1000   0        0 eth0
# default         192.168.1.1     0.0.0.0         UG    0      0        0 eth0
# The Iface column in the line with destination default tells you which interface is used.
alias internet_interface="route | grep '^default' | grep -o '[^ ]*$'"

ghcl() {
    # clone from github via ssh
    git clone git@github.com:$1
}

ghra() {
    # add and fetch remote (ssh)
    NAME=$(basename `git rev-parse --show-toplevel`)
    git remote add -f $1 git@github.com:$2/$NAME
}

ghrr() {
    # git remove remote
    git remote remove $1
}

sum-file() {
    paste -sd+ $1 | bc
}

calc() {
    if [ "$#" -eq 0 ]; then
        bc -il $HOME/.bcrc
    else
        bc -l $HOME/.bcrc <<< "$@"
    fi
}

alias vpn-janelia='sudo openconnect -u hanslovskyp --juniper vpn.janelia.org'

hash python 2>/dev/null && pywhich() {
        [ -n "$1" ] && python -c "from __future__ import print_function; import $1; print($1)"
    }

ungrab-cursor() {
    ## sometimes JavaFX does not release cursor when hitting breakpoint
    ## https://unix.stackexchange.com/a/40472/277163
    setxkbmap -option grab:break_actions
    xdotool key XF86Ungrab
}

# Kubernetes
if hash kubectl 2>/dev/null; then
    source <(kubectl completion zsh)  # setup autocomplete in zsh into the current shell
fi

if hash kubecolor 2>/dev/null; then
    # TODO: auto-completion currently does not work for kubecolor
    #       https://github.com/dty1er/kubecolor/issues/78
    # source <(cat <(echo -e "#compdef kubecolor\ncompdef _kubectl kubecolor") <(kubectl completion zsh | tail -n+3))
    # compdef kubecolor=kubectl
    alias ktl=kubecolor
else
    alias ktl=kubectl
fi

alias ktx=kubectx

function fdiff() {
    diff -aruN "$1" "$2" | diff-so-fancy
}

hash git-fuzzy 2>/dev/null && alias fgit='git-fuzzy'

# define alias to copy and resize edited images:
alias copy-to-edited='copy-to-edited.sh | wc -l && FACTOR=50% resize.sh | wc -l && FACTOR=25% resize.sh | wc -l'
