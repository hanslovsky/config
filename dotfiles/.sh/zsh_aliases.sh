# global aliases, only work wit zsh

# no standard out
alias -g NO_OUT='1>/dev/null'

# no standard err
alias -g NO_ERR='2>/dev/null'

# no output at all
alias -g SILENCE='1>/dev/null 2>&1'

# copy to clipboard
alias -g NL_CLIPBOARD='| xclip -selection clipboard'

# copy to clipboard w/o trailing new line
alias -g CLIPBOARD='| xargs -d "\n" printf %s | xclip -selection clipboard'

# copy to clipboard
alias -g NLCP='| xclip -selection clipboard'

# copy to clipboard w/o trailing new line
alias -g CP='| xargs -d "\n" printf %s | xclip -selection clipboard'

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
