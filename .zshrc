HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory extendedglob no_share_history prompt_subst
unsetopt autocd beep
bindkey -e

autoload -Uz compinit
compinit

# VCS (git, svn)
autoload -Uz vcs_info
precmd() {
    vcs_info
}

# Auto rehash
zstyle ':completion:*' rehash true
# Completion
eval $(dircolors -b)
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

zstyle ':completion:*:rm:*' ignore-line yes
zstyle ':completion:*:mv:*' ignore-line yes
zstyle ':completion:*:cp:*' ignore-line yes
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin

## VCS info
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:git*' formats "%m%u%c %F{cyan}%r%f (%F{yellow}%b%f)"
zstyle ':vcs_info:git*' actionformats "%m%u%c %F{cyan}%r%f (%F{yellow}%a%f)"
zstyle ':vcs_info:git*' unstagedstr '%F{yellow}✗%f'
zstyle ':vcs_info:git*' stagedstr '%F{green}✚%f'
zstyle ':vcs_info:git*' check-for-changes true
zstyle ':vcs_info:git*' check-for-staged-changes true

# Backward kill like bash
autoload -U select-word-style
select-word-style bash

# Shift-TAB to select backwards from completion menu
bindkey '^[[Z' reverse-menu-complete

# Command history with arrow keys
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# Ctrl + Arrows to navigate
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
# Home and End
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
# Delete key
bindkey  "^[[3~"  delete-char
bindkey  "^[3;5~" delete-char

# Prompt
PROMPT='%F{blue}%B%#%b%f %F{white}%B%~%b%f '
RPROMPT='%B${vcs_info_msg_0_}%b'

# Aliases
source $HOME/.zsh/zaliases
# Environment variables
export EDITOR=vim
export GOPATH=$HOME/code/golang/
export PATH=$PATH:$GOPATH/bin:$HOME/.cargo/bin:$HOME/.local/bin:$HOME/.gem/ruby/2.5.0/bin
export WORKON_HOME=$HOME/.virtualenvs
