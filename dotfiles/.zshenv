zmodload zsh/zprof

IFS=. read major minor patch <<<"${ZSH_VERSION##*-}"
export ZSH_VERSION_MAJOR=${major}
export ZSH_VERSION_MINOR=${minor}
export ZSH_VERSION_PATCH=${patch}

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

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

