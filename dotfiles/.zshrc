# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="af-magic"
# ZSH_THEME="kphoen"
# ZSH_THEME="sunrise" ++
# ZSH_THEME="gnzh" #  +
# ZSH_THEME="norm" #  +
# ZSH_THEME="nanotech" #  +
# ZSH_THEME="minimal" # 
ZSH_THEME="mrtazz" #  ++
# ZSH_THEME="dieter" # 

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)

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
    # your prompt stuff

    plugins=(git)

    source $ZSH/oh-my-zsh.sh

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
if [ -f ~/.sh/sh_aliases_zsh_only ]; then
    . ~/.sh/sh_aliases_zsh_only
fi

# convenience function
if [ -f ~/.sh/sh_convenience_functions.sh ]; then
    . ~/.sh/sh_convenience_functions.sh
fi

# set environment variables
if [ -f ~/.sh/common_exports.sh ]; then
    . ~/.sh/common_exports.sh
fi

if [[ -n "$DISPLAY" ]]; then
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

bindkey " " globalias
bindkey "^ " magic-space           # control-space to bypass completion
bindkey -M isearch " " magic-space # normal space during searches

# enable zmv
autoload zmv



