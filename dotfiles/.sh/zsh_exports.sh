IFS=. read major minor patch <<<"${ZSH_VERSION##*-}"
export ZSH_VERSION_MAJOR=${major}
export ZSH_VERSION_MINOR=${minor}
export ZSH_VERSION_PATCH=${patch}

if [ "${ZSH_VERSION_MAJOR}" -ge "5" -a "${ZSH_VERSION_MINOR}" -ge "1" ]; then
    export ZSH_PROMPT_COLORS=(10 149 149 8 2 10)
fi

# opam configuration (for OCaml)
[[ ! -r /home/zottel/.opam/opam-init/init.zsh ]] || source /home/zottel/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

