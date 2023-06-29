# Path to your oh-my-zsh configuration.
# ZSH=$HOME/.oh-my-zsh

# a lot of stuff in here: https://github.com/b4b4r07/dotfiles/blob/master/.zsh/zplug.zsh

# login1 crashes when starting zsh, thus go back to this commit there: 734ce7d

# good fonts: source-code-pro roboto
# get them at ttf-google-fonts-git

export ZPLUG_HOME=$HOME/.zplug

source $ZPLUG_HOME/init.zsh

zplug "mafredri/zsh-async", from:github, defer:0

zplug "zsh-users/zsh-history-substring-search", defer:3

zplug "zsh-users/zsh-completions"

zplug "zsh-users/zsh-autosuggestions"

# from https://github.com/zsh-users/zsh-syntax-highlighting/issues/286#issuecomment-271486864
if [[ $ZSH_EVAL_CONTEXT == 'file' ]]; then
    zplug "zsh-users/zsh-syntax-highlighting", from:github, defer:3
fi

zplug "k4rthik/git-cal", as:command

zplug "plugins/git",   from:oh-my-zsh

zplug "lib/functions",   from:oh-my-zsh

zplug "lib/theme-and-appearance",   from:oh-my-zsh

zplug "lib/directories",   from:oh-my-zsh

zplug "lib/history",   from:oh-my-zsh

zplug "plugins/emoji-clock",   from:oh-my-zsh

zplug "lib/completion", from:oh-my-zsh

# fuzzy matchers
# definitely manage this with .zshrc
zplug "zsh-users/zaw"

zplug "jhawthorn/fzy", as:command, rename-to:fzy, hook-build:"make && sudo make install"

# enhanced cd command
zplug "b4b4r07/enhancd", use:init.sh
export ENHANCD_FILTER=fzy
export ENHANCD_COMMAND=ecd

# emoji completion, use ^s to start
# needs fzy and jq (both available on arch repos)
# should also install emojify (available on aur): https://github.com/mrowa44/emojify
zplug "b4b4r07/emoji-cli" # , as:command, if:"(( $+commands[jq] ))"
# TODO come up with better shortcut
export EMOJI_CLI_KEYBIND='^x^e'
export EMOJI_CLI_USE_EMOJI=1

# zplug "peco/peco", as:command, from:gh-r


# themes

zplug "fribmendes/geometry"

# community plugins
zplug "jedahan/geometry-hydrate"
zplug "desyncr/geometry-pretty-git"
# requires Ctrl - D at startup
# virtualenv plugin fails with
# basename: missing operand
# https://github.com/fribmendes/geometry/tree/master/plugins

IFS=. read major minor patch <<<"${ZSH_VERSION##*-}"
export ZSH_VERSION_MAJOR=${major}
export ZSH_VERSION_MINOR=${minor}
export ZSH_VERSION_PATCH=${patch}

if [ "${ZSH_VERSION_MAJOR}" -ge "5" -a "${ZSH_VERSION_MINOR}" -ge "1" ]; then
    export GEOMETRY_PROMPT_PLUGINS=(exec_time jobs virtualenv git pretty-git hydrate)
fi
export GEOMETRY_COLOR_ROOT="red"
export GEOMETRY_COLOR_VIRTUALENV="green"
export GEOMETRY_COLOR_CONDA="red"
export GEOMETRY_VIRTUALENV_CONDA_SEPARATOR="~~"

# zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

# if ! zplug check; then
#     zplug install
# fi

zplug load



# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="af-magic"
# ZSH_THEME="kphoen" # ++
# ZSH_THEME="sunrise" # ++
# ZSH_THEME="gnzh" #  +
# ZSH_THEME="norm" #  +
# ZSH_THEME="nanotech" #  +
# ZSH_THEME="minimal" # 
# ZSH_THEME="mrtazz" #  ++
# ZSH_THEME="dieter" # ++
# ZSH_THEME="bureau" # ++
# ZSH_THEME="kolo" # +
# ZSH_THEME="miloshadzic" # +
# ZSH_THEME="sunaku" # ++
# ZSH_THEME="amuse" # ++
# ZSH_THEME="zottel" # +++
# ZSH_THEME="geometry/geometry"

# themes to test:
# xxf
# cordial
# gitster
# haribo
# lambda-mod
# Node
# Spaceship
# Nodeys
# geometry
# Bunnyruni
# lambda pure

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

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

# convenience function
if [ -f ~/.sh/convenience_functions.sh ]; then
    . ~/.sh/convenience_functions.sh
fi

# set environment variables
if [ -f ~/.sh/common_exports.sh ]; then
    . ~/.sh/common_exports.sh
fi

# set environment variables
if [ -f ~/.sh/zsh_exports.sh ]; then
    . ~/.sh/zsh_exports.sh
fi

if [ -f ~/.sh/source_custom.sh ]; then
    . ~/.sh/source_custom.sh
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

bindkey " " globalias
bindkey "^ " magic-space           # control-space to bypass completion
bindkey -M isearch " " magic-space # normal space during searches

# enable zmv
autoload -U zmv

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/zottel/mambaforge/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/zottel/mambaforge/etc/profile.d/conda.sh" ]; then
        . "/home/zottel/mambaforge/etc/profile.d/conda.sh"
    else
        export PATH="/home/zottel/mambaforge/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/home/zottel/mambaforge/etc/profile.d/mamba.sh" ]; then
    . "/home/zottel/mambaforge/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

# opam configuration
[[ ! -r /home/zottel/.opam/opam-init/init.zsh ]] || source /home/zottel/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
