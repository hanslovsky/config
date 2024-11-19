# good fonts: source-code-pro roboto
# get them at ttf-google-fonts-git

export ZPLUG_HOME=$HOME/.zplug

source $ZPLUG_HOME/init.zsh

# syntax highlighting, e.g. keywords like for
zplug "zsh-users/zsh-syntax-highlighting", from:github, defer:3

# completions that may not be available in plain zsh, e.g. archlinux-java
zplug "zsh-users/zsh-completions"

# suggest a command based on what is typed so far.
# E.g.
#   $ echo 123
#   $ e
# will suggest echo 123
zplug "zsh-users/zsh-autosuggestions"

# print a calendar of contributions similar to what is on github.com
zplug "k4rthik/git-cal", as:command

zplug "lib/history",   from:oh-my-zsh

zplug "lib/completion", from:oh-my-zsh

# fuzzy matchers
# definitely manage this with .zshrc
zplug "zsh-users/zaw"
# trigger zaw: C-x ;
bindkey '^R' zaw-history

# enhanced cd command; replace cd with ecd to use
zplug "b4b4r07/enhancd", use:init.sh
export ENHANCD_FILTER=sk:fzy:fzf
export ENHANCD_COMMAND=ecd
export ENHANCD_HYPHEN_NUM=30

# emoji completion, use ^s to start
# needs fzy and jq (both available on arch repos)
# should also install emojify (available on aur): https://github.com/mrowa44/emojify
zplug "b4b4r07/emoji-cli" # , as:command, if:"(( $+commands[jq] ))"
# TODO come up with better shortcut
export EMOJI_CLI_KEYBIND='^x^e'
export EMOJI_CLI_USE_EMOJI=1

# themes

zplug "fribmendes/geometry"

if [ "${ZSH_VERSION_MAJOR}" -ge "5" -a "${ZSH_VERSION_MINOR}" -ge "1" ]; then
    export GEOMETRY_PROMPT_PLUGINS=(exec_time jobs virtualenv git)
fi
export GEOMETRY_COLOR_ROOT="red"
export GEOMETRY_COLOR_VIRTUALENV="green"
export GEOMETRY_COLOR_CONDA="red"
export GEOMETRY_VIRTUALENV_CONDA_SEPARATOR="~~"

zplug load


# prompts
# enable the use of tramp with zsh
# cannot have too fancy stuff!
if [[ $TERM == "dumb" ]]; then	# in emacs
    PS1='%(?..[%?])%!:%~%# '
    # for tramp to not hang, need the following. cf:
    # http://www.emacswiki.org/emacs/TrampMode
    unsetopt zle
    unsetopt prompt_cr
    unsetopt prompt_subst
    # unfunction precmd
    # unfunction preexec
else
    # enable autocompletion for special directories
    zstyle -e ':completion:*' special-dirs '[[ $PREFIX = (../)#(|.|..) ]] && reply=(..)'

    # Customize to your needs...

    # special directory completion
    zstyle -e ':completion:*' special-dirs '[[ $PREFIX = (../)#(|.|..) ]] && reply=(..)'

    # additional aliases
fi

if [ -f ~/.sh/common_aliases.sh ]; then
    . ~/.sh/common_aliases.sh
fi

# global aliases
if [ -f ~/.sh/zsh_aliases.sh ]; then
    . ~/.sh/zsh_aliases.sh
fi

if [[ -n "$DISPLAY" && -n "" ]]; then
    CURR_DIR=$(pwd)
    cd ~/.sh/greet_dir
    fn=$(ls -1 | shuf -n1)
    n_chars=$(sed 's/\\n/\n/g' $fn | head -n1 | sed 's/\\e\[.\{0,12\}m//g' | sed 's/\\033.*//g' | wc -m)
    let "n_chars=n_chars-1"
    if [[ "$n_chars" -le "$COLUMNS" ]]; then
        let "margin = (COLUMNS - n_chars)/2"
        echo -e "$(cat $fn)" | sed "s/^/$(printf ' %.0s' {1..$margin})/g"
    fi
    cd $CURR_DIR
    unset CURR_DIR
fi

# from http://blog.patshead.com/2012/11/automatically-expaning-zsh-global-aliases---simplified.html
globalias() {
   if [[ $LBUFFER =~ ' [A-Z0-9_]+$' ]]; then # =~ allows for regexp
     zle _expand_alias
     zle expand-word
   fi
   zle self-insert
}

zle -N globalias

bindkey " " globalias              # anything after space can be global alias
bindkey "^ " magic-space           # control-space to bypass completion
bindkey -M isearch " " magic-space # normal space during searches

# enable zmv
autoload -U zmv

# opam configuration
[[ ! -r /home/zottel/.opam/opam-init/init.zsh ]] || source /home/zottel/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# direnv
hash direnv && eval "$(direnv hook zsh)"

zprof > "$ZSH_STARTUP_PROFILE_FILE"

