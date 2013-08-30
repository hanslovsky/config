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
plugins=(git)

source $ZSH/oh-my-zsh.sh

# enable autocompletion for special directories
zstyle -e ':completion:*' special-dirs '[[ $PREFIX = (../)#(|.|..) ]] && reply=(..)'

# Customize to your needs...

# special directory completion
zstyle -e ':completion:*' special-dirs '[[ $PREFIX = (../)#(|.|..) ]] && reply=(..)'

# additional aliases
if [ -f ~/.sh/sh_aliases ]; then
    . ~/.sh/sh_aliases
fi

# set environment variables
if [ -f ~/.sh/sh_exports ]; then
    . ~/.sh/sh_exports
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
