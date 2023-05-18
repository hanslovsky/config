# global aliases, only work wit zsh

# no standard out
alias -g NO_OUT='1>/dev/null'

# no standard err
alias -g NO_ERR='2>/dev/null'

# no output at all
alias -g SILENCE='1>/dev/null 2>&1'

if [ "$(uname -o 2>/dev/null)" = "Darwin" -o "$(uname -s)" = "Darwin"]; then
    copy_command=pbcopy
elif [ "$XDG_SESSION_TYPE" = wayland ]; then
    if hash wl-copy 2>/dev/null; then
        copy_command=wl-copy
    else
        echo "Will not set global copy aliases: No wl-copy installed"
    fi
elif [ "$XDG_SESSION_TYPE" = x11 ]; then
    if hash xclip 2> /dev/null; then
        copy_command="xclip -selection clipboard"
    else
        echo "Will not set global copy aliases: No xclip installed"
    fi
fi

if [ -n "$copy_command" ]; then

    # copy to clipboard
    alias -g NL_CLIPBOARD="| $copy_command"

    # copy to clipboard w/o trailing new line
    alias -g CLIPBOARD='| xargs -d "\n" printf %s | '"$copy_command"

    # copy to clipboard
    alias -g NLCP="| $copy_command"

    # copy to clipboard w/o trailing new line
    alias -g CP='| xargs -d "\n" printf %s | '"$copy_command"
else
    echo "No copy command available. Please install xclip (X11) or wl-clipboard (wayland)"
fi

# PATH, single line for each entry
alias -g NLPATH='${PATH//:/
}'

# LD_LIBARARY_PATH, as above
alias -g NLLDPATH='${LD_LIBRARY_PATH//:/
}'

# LIBRARY_PATH, as above
alias -g NLLPATH='${LIBRARY_PATH//:/
}'

# PYTHON_PATH, as above
alias -g NLPPATH='${PYTHONPATH//:/
}'

# word count
alias -g WC='| wc -l'

# grep -E
alias -g G='| grep -E'

# grep -e
alias -g EGREP='| grep -E'

# grep -i
alias -g IGREP='| grep -iE'

# lower/upper case
alias -g LOWER='| awk "{ print tolower(\$0) }"'
alias -g UPPER='| awk "{ print toupper(\$0) }"'


# suffix alias
# C / C++
alias -s cxx=ec
alias -s cpp=ec
alias -s c=ec
alias -s hxx=ec
alias -s hpp=ec
alias -s h=ec

# python
# alias -s py=ec

# shell
# alias -s sh=ec
