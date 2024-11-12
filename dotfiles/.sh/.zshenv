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
