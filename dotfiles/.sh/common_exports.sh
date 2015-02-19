# set local dir ot either $HOME/local or $HOME/cluster
LOCAL_NAME='$HOME/local'
HOSTNAME=`hostname`
if [ "${HOSTNAME/.int.janelia.org}" = "$HOSTNAME" ];
then
    LOCAL_NAME="$HOME/local"
else
    LOCAL_NAME="$HOME/cluster"
fi

export LOCAL=$LOCAL_NAME


# python local packages
export SITE_PACKAGES=$LOCAL/lib/python2.7/site-packages
export DIST_PACKAGES=$LOCAL/lib/python2.7/dist-packages


# cplex
export CPLEX_INCLUDE_DIR=$LOCAL/ILOG/cplex-current/cplex/include
export CPLEX_LIB_DIR=$LOCAL/ILOG/cplex-current/cplex/lib/x86-64_sles10_4.1/static_pic

export CONCERT_INCLUDE_DIR=$LOCAL/ILOG/cplex-current//concert/include
export CONCERT_LIB_DIR=$LOCAL/ILOG/cplex-current/concert/lib/x86-64_sles10_4.1/static_pic


# git
export GIT_REPO_DIR=$HOME/git


# env
export C_INCLUDE_PATH=$CPLEX_INCLUDE_DIR:$CONCERT_INCLUDE_DIR:$LOCAL/include:$C_INCLUDE_PATH
export CPLUS_INCLUDE_PATH=$CPLEX_INCLUDE_DIR:$CONCERT_INCLUDE_DIR:$LOCAL/include:$CPLUS_INCLUDE_PATH
export LIBRARY_PATH=$CPLEX_LIB_DIR:$CONCERT_LIB_DIR:$LOCAL/lib:$LIBRARY_PATH
export LD_LIBRARY_PATH=$LOCAL/lib:$SITE_PACKAGES:$LD_LIBRARY_PATH
export PATH=$GIT_REPO_DIR/scripts:$LOCAL/bin:$PATH
export PYTHONPATH=$DIST_PACKAGES:$SITE_PACKAGES:$PYTHONPATH
export EDITOR="emacsclient -c"
export ALTERNATE_EDITOR=""
export TERM=xterm-256color


# cuda - export only if present
CUDA_PARENT_DIR=/usr/local
CUDA_BASE_DIRS="$(find $CUDA_PARENT_DIR -maxdepth 1 -name 'cuda*' -type d)"
# check if CUDA_BASE_DIRS is not empty
if [[ -n "$CUDA_BASE_DIRS" ]]; then
   LATEST_CUDA_BASE_PATH="$(echo -e "$CUDA_BASE_DIRS" | sort -V  | tail -n1)"
   export PATH="$LATEST_CUDA_BASE_PATH/bin:$PATH"
   export LD_LIBRARY_PATH="$LATEST_CUDA_BASE_PATH/lib:$LATEST_CUDA_BASE_PATH/lib64:$LD_LIBRARY_PATH"
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
