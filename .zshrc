# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/matt/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit

setopt COMPLETE_ALIASES

# Aliases
alias ls='ls --color=auto'
alias ll='ls -l'
alias grep='grep --color=auto'

PROMPT='[%d]
-> '

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[command]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[alias]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=red'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[path]='white'

precmd () { print -Pn "\e]0;$TITLE\a" }
title() { export TITLE="$*" }

man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}


# functions
bt_recycle() {
	sudo systemctl restart bluetooth.service
	echo "Restarting bluetooth.service..."
	sleep 1
}

screen_recycle() {
	swaymsg output DP-3 mode 3440x1440@120.000Hz
	sleep 1
	swaymsg output DP-3 mode 3440x1440@144.000Hz
}
