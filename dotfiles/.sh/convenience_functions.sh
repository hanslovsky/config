# show only the lines that are in common
function show-only-common {
    comm -12 <( sort $1 )  <( sort $2 )
}

# find all files with given extensions: find -extensions ext1 [ ext2 ... ]
function find-extensions {
    USAGE="$0 <dir> <extension> [<extension> ...]"
    if [[ "$#" -lt "2" ]]; then
        echo "Need at least two arguments!"
        echo "$USAGE"
        return 1
    fi
    ADDITIONAL_ARGS="${ADDITIONAL_ARGS:-}"
    directory=$1
    shift
    extensions=$(echo "$@" | sed 's/ /\|/g')
    COMMAND="find $directory -type f -regextype posix-extended -regex \".*\.($extensions)\" $ADDITIONAL_ARGS"
    sh -c "$COMMAND"
    return 0
}

# print environment of process: envof procid
function envof {
    sed 's/\x0/\n/g' /proc/${1}/environ;
}
