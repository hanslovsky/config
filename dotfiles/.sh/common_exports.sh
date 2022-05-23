remove_duplicates()
{
    SEPARATOR=$1
    PATH_VAR=$2
    echo -n $PATH_VAR | tr $SEPARATOR '\n' | awk '!a[$0]++' | perl -pe 'chomp if eof' | tr '\n' $SEPARATOR
}

fix_path()
{
    remove_duplicates : $@
}


# set local dir ot either $HOME/.local
LOCAL_NAME="$HOME/.local"
export LOCAL=$LOCAL_NAME

# git
export GIT_REPO_DIR=$HOME/git

# node
export NODE_MODULES=$LOCAL/node_modules
export NODE_MODULES_BIN=${NODE_MODULES}/.bin

# rust
export CARGO_HOME=$HOME/.cargo


# env
export C_INCLUDE_PATH=`fix_path $LOCAL/include:$C_INCLUDE_PATH`
export CPLUS_INCLUDE_PATH=`fix_path $LOCAL/include:$CPLUS_INCLUDE_PATH`
export LIBRARY_PATH=`fix_path $LOCAL/lib:$LIBRARY_PATH`
export LD_LIBRARY_PATH=`fix_path $LOCAL/lib:$SITE_PACKAGES:$LD_LIBRARY_PATH`
export PATH=`fix_path $CARGO_HOME/bin:$GIT_REPO_DIR/scripts:$LOCAL/bin:$NODE_MODULES_BIN:$PATH`

export EDITOR="emacsclient -c"
export ALTERNATE_EDITOR=""
export TERM=xterm-256color


# cuda - export only if present
CUDA_PARENT_DIR=/usr/local
CUDA_BASE_DIRS="$(find $CUDA_PARENT_DIR -maxdepth 1 -name 'cuda*' -type d)"
# check if CUDA_BASE_DIRS is not empty
if [[ -n "$CUDA_BASE_DIRS" ]]; then
   LATEST_CUDA_BASE_PATH="$(echo -e "$CUDA_BASE_DIRS" | sort -V  | tail -n1)"
   export PATH=`fix_path $LATEST_CUDA_BASE_PATH/bin:$PATH`
   export LD_LIBRARY_PATH=`fix_path $LATEST_CUDA_BASE_PATH/lib:$LATEST_CUDA_BASE_PATH/lib64:$LD_LIBRARY_PATH`
fi


# less (see man less for more details)
export LESS='-RS#3NM~g'
# -R:  output ANSI color escape sequences in raw form
# -S:  Toggle Chop long lines (defulat: fold)
# -#N: specify the horizontal scrolling step size to N
# -N:  show line numbers
# -M:  verbose prompt
# -~:  display lines after EOF as blank lines rather than tilde
# -g:  highlight only the particular string which was found by last search


# qtselector information
export QT_SELECT=4

# eclipse
export ECLIPSE_HOME=$HOME/.eclipse

# added by travis gem
[ -f "$HOME/.travis/travis.sh" ] && source "$HOME/.travis/travis.sh"

# conda
[ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ] && source "$HOME/miniconda3/etc/profile.d/conda.sh"

# pyjnius jar if present
[ -f "$HOME/Dropbox/misc/pyjnius/pyjnius.jar" ] && export PYJNIUS_JAR="$HOME/Dropbox/misc/pyjnius/pyjnius.jar"

function _nth_parent() {
    directory="$1"
    for iteration in {1..$2}; do
        directory="$(dirname $directory)"
    done
    echo $directory
}

# java (only if not set already)
if [ -z "${JAVA_HOME}" ]; then
    # on arch JAVA_HOME is not set. Instead use default jvm location
    DEFAULT_JVM=/usr/lib/jvm/default
    if [ -L "${DEFAULT_JVM}" -a -d "${DEFAULT_JVM}" ]; then
        export JAVA_HOME="${DEFAULT_JVM}"
    else
        hash java 2>/dev/null && hash realpath 2>/dev/null && export JAVA_HOME="$(_nth_parent $(realpath $(which java)) 3)"
    fi
fi

hash brave 2>/dev/null && export BROWSER=brave
