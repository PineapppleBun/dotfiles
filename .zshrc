export PATH=/opt/homebrew/bin:$PATH
PS1='paulvulf@MBPM3 $ '

## fzf for history
alias history='cat ~/.bash_history | fzf | zsh'

## Git
 # Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)


## ALIASES ##
alias l='gls --color --group-directories-first'
alias ls='gls -l --color --group-directories-first'
alias ll='gls -al --color --group-directories-first'
alias la='gls -al --color --group-directories-first'
alias vi='nvim'
alias vim='nvim'

## PYTHON ##
 ## 3.9 ##

 PATH=/Users/$(whoami)/Library/Python/3.9/bin:$PATH

# Find and set branch name var if in git repository.
# Enabling and setting git info var to be used in prompt config.
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
# This line obtains information from the vcs.
zstyle ':vcs_info:git*' formats "- (%b) "
precmd() {
    vcs_info
}
function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo '- ('$branch')'
  fi
}

COLOR_DEF=$'%f'
COLOR_DTE=$'%F{246}'
COLOR_USR=$'%F{202}'
COLOR_DIR=$'%F{45}'
COLOR_GIT=$'%F{88}'
setopt PROMPT_SUBST
PROMPT="${COLOR_USR}%n@${COLOR_DIR}%~  ${COLOR_DEF}$ "
RPROMPT="${COLOR_GIT}${vcs_info_msg_0_}${COLOR_DTE}[%w %*]${COLOR_DEF}"
autoload -Uz compinit && compinit
