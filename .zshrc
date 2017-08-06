# Created by newuser for 5.3.1
# Enable history
umask 022
setopt APPEND_HISTORY
export SAVEHIST=10000
export HISTFILE=$HOME/.zsh_history
# VCS
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '%B%F{cyan}!%f%b'
zstyle ':vcs_info:*' stagedstr '%B%F{magenta}+%f%b'
zstyle ':vcs_info:*' formats '%u%c(%{%F{yellow}%}%b%{%f%})'
function precmd() {
    vcs_info
}
# Completion
autoload -U compinit
compinit
autoload -U promptinit
promptinit
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
# Case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
autoload -U history-search-end
# Menu selection
zstyle ':completion:*' menu select
# Reload hashes for command completion after install
zstyle ':completion:*' rehash true
# Prompt
if [[ $UID == 0 || $EUID == 0 ]]; then
    PROMPT='[%B%{%F{red}%}%n%{%f%}@%m%b]:%~ %# '
else
    PROMPT='[%B%{%F{blue}%}%n%{%f%}@%m%b]:%~ %# '
fi
setopt prompt_subst
RPROMPT='${vcs_info_msg_0_} %T'
# Backward kill
autoload -U select-word-style
select-word-style bash

# Load aliases
source $HOME/.zsh/zaliases
# Exports
export EDITOR=vim
export GOPATH=$HOME/code/go
export PATH=$PATH:/sbin:$GOPATH/bin

# Fix arrow keys
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# History search
autoload up-line-or-beginning-search
autoload down-line-or-beginning-search

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
[[ -n "${key[Up]}" ]] && bindkey "${key[Up]}" up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey "${key[Down]}" down-line-or-beginning-search
