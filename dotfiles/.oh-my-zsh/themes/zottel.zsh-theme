# Git-centric variation of the "fishy" theme.
# See screenshot at http://ompldr.org/vOHcwZg
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg_bold[green]%}A"   
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg_bold[yellow]%}M"  
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg_bold[red]%}D"   
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg_bold[yellow]%}>"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[red]%}#" 
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[yellow]%}?"

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=" "
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}☠" # Skull
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}✘" # Heavy Ballot
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✔" # Heavy Check Mark

local user_color='green'
test $UID -eq 0 && user_color='red'

PR_RESET="%{$reset_colors%}"

git_colored_prompt() {
  

  STAT=$(git_prompt_status)
  
  if [ -z $STAT ]; then
    BRANCH_COLOR="%{$fg_bold[green]%}"
  else
    BRANCH_COLOR="%{$fg_bold[red]%}"
  fi
  # echo -n "${STAT}%{$reset_color%} "
  echo -n "$BRANCH_COLOR$(git_prompt_info)%{$reset_color%}"
}

# http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
# %(x.true-text.false-text) # test character x, left parense preceded or followed by n (defaults to 0)
# '%(n?.exit==n.exit!=n)' # do action on exit code n
PROMPT='%(?..%{$fg_bold[red]%}exit %?
%{$reset_color%})'\
'%{$fg_bold[$user_color]%}%D %* %{$reset_color%}'\
'%{$fg_bold[blue]%}%n@%M:%{$reset_color%}'\
'%{$fg_bold[$user_color]%}%~%{$reset_color%}'\
'%(!. #. %{$fg_bold[grey]%}>%{$reset_color%}%{$fg[$user_color]%}>%{$fg_bold[$user_color]%}>) '\
'%{$reset_colors%}%{$fg[white]%}'

RPROMPT='$(git_colored_prompt)%{$fg[white]%}'

PROMPT2='%{$fg[red]%}\ %{$reset_color%}%{$fg_bold[white]%}'
