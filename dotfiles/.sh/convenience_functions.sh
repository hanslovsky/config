function show-only-common {
    comm -12 <( sort $1 )  <( sort $2 )
}

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
