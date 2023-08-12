# fzf options
export FZF_DEFAULT_COMMAND='rg --hidden -l ""'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse'

export EDITOR=nvim
# vim-mode
bindkey -v

# restore ctrl-r for history-search behavior
bindkey ^R history-incremental-search-backward 

# restore delete key behavior
bindkey "^?" backward-delete-char

# source aliases
source "${ZDOTDIR}/aliases.zsh"

# load functions
fpath=("${ZDOTDIR}/zsh_functions" "${fpath[@]}");
# autoload all files in that directory so they are available to use.
# unfunction all functions first, since autoload doesn't "reload"
for f in $fpath[1]/*(.:t); do
  unfunction "${f}" 2>/dev/null
done
autoload -U $fpath[1]/*(.:t)

# set prompt
# `setopt prompt_subst` enables parameter expansion, command substitution, and arithmetic expansion in the prompt string.
# This means that any shell commands or variables included in the prompt string will be evaluated and expanded when the prompt is displayed,
# rather than when the prompt is set.
# Single quotes are needed to ensure that the prompt isn't evaluted when it's set.
setopt prompt_subst 
NEWLINE=$'\n'
PROMPT='%B%F{cyan}%~%F{reset_color}%b%F{yellow}$(is_git_dirty)%F{reset_color}${NEWLINE}> '

# !! should not execute the last command, only print it to the edit buffer
setopt hist_verify

# source fzf options
source $ZDOTDIR/.fzf.zsh

# set psql password file location
export PGPASSFILE="${XDG_CONFIG_HOME}/.pgpass"

# export GOROOT
export GOROOT=$(go env GOROOT)

if [[ `arch` == "arm64" ]]; then
  # work laptop
  source "${ZDOTDIR}/.zshrc_work"
fi
