# show only the lines that are in common
function show-only-common {
    comm -12 <( sort $1 )  <( sort $2 )
}

# find all files with given extensions: find-extensions ext1 [ ext2 ... ]
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


# pick line and modify
function pick_line_and_modify
{
    VAL=$(cat $1)
    EXPORTED_RESULT=${2:-RESULT}
    LTE='\xe2\x89\xa4'
    ENUM=$(nl <(echo $VAL))
    echo $ENUM
    MAX_NUM=`echo -n $ENUM | tail -n1 | sed -r 's/^[[:space:]]+//' | sed -r 's/[[:space:]]+.*$//'`
    LINE=0
    while ; do
        echo -e "Pick 1 $LTE number $LTE $MAX_NUM to modify line"
        read LINE
        LINE=`echo -n $LINE | sed -r -e 's/^[ \t\n]+//' -e 's/[ \t\n]+$//'`
        NON_NUMERIC=`echo $LINE | grep '[^0-9]'`
        if [ -n "$LINE" -a -z "$NON_NUMERIC" ]; then
            if [ $LINE -ge 1 -a $LINE -le $MAX_NUM ]; then
                break
            fi
        fi
    done
    echo
    CHOICE=''
    while ; do
        echo 'Modify(m)/Delete(d)/No-Action(n)/Quit(q)?'
        read CHOICE
        CHOICE=`echo -n $CHOICE | tr '[:upper:]' '[:lower:]'`
        if [ -n "$CHOICE" ]; then
            if [ $CHOICE = d -o $CHOICE = m -o $CHOICE = n -o $CHOICE = q ]; then
                break
            fi
        fi
    done
    echo
    case "$CHOICE" in
        m)
            CONTENT=`echo $VAL | sed -n "${LINE}p"`
            echo "Please specify replacement for line $LINE: $CONTENT"
            read REPLACEMENT
            echo
            RESULT=$(echo -n -e "$VAL" | sed "${LINE}s#^.*#$REPLACEMENT#")
            ;;
        d)
            RESULT=$(echo -n -e "$VAL" | sed -e "${LINE}d")
            ;;
        n)
            RESULT=$VAL
            ;;
        q)
            RESULT=$VAL
            ;;
        *)
            RESULT=$VAL
            ;;
    esac
    echo $RESULT
    eval $EXPORTED_RESULT=\$RESULT
}


function modify_line_in_path
{
    PATH_VAR_NAME=$1
    PATH_VAR=`eval echo $"$PATH_VAR_NAME"`
    NL_PATH_VAR="${PATH_VAR//:/
}"
    pick_line_and_modify <(echo -n $NL_PATH_VAR) MODIFIED
    export $PATH_VAR_NAME=$( echo -n -e "$MODIFIED" | tr '\n' ':' )
    unset MODIFIED
}

function _br {
    f=$(mktemp)
    (
        set +e
        broot --outcmd "$f" "$@"
        code=$?
        if [ "$code" != 0 ]; then
            rm -f "$f"
            exit "$code"
        fi
    )
    code=$?
    if [ "$code" != 0 ]; then
        return "$code"
    fi
    d=$(cat "$f")
    rm -f "$f"
    eval "$d"
}

hash broot 2>/dev/null && alias br='_br'

aws-profile () {
    FZF_DEFAULT_COMMAND="grep -E '\[role match]' ~/.aws/credentials | sed -e 's/\[//' -e s'/]//'"
    if [ -n "$AWS_PROFILE" ]
    then
        FZF_DEFAULT_COMMAND="$FZF_DEFAULT_COMMAND | grep --color=always -E '$AWS_PROFILE|$'"
    fi
    PROFILE=$(FZF_DEFAULT_COMMAND="$FZF_DEFAULT_COMMAND" fzf --ansi --no-preview)
    [ -n "$PROFILE" ] && export AWS_PROFILE=$PROFILE  && export AWS_DEFAULT_PROFILE=$PROFILE  && echo Updated AWS profile to $PROFILE
}

add () {
    awk '{sum+=$1} END {print sum}' "$@"
}

