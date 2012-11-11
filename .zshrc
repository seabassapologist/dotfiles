# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/matt/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

purple=%{$'\e[0;35m'%}
blue=%{$'\e[0;34m'%}
green=%{$'\e[0;32m'%}
yellow=%{$'\e[1;33m'%}
red=%{$'\e[0;31m'%}
white=%{$'\e[1;37m'%}
normal=%{$'\e[0m'%}

#Prompt
PROMPT="${blue}%~${normal} ${green}> "

#Aliases
alias ls='ls --color=auto'
alias gnex='jmtpfs ~/nexus'
alias ugnex='sudo umount ~/nexus'
alias backup-gnex='rsync -rP ~/nexus/ ~/nexus-backup'
alias mplayer="mplayer -vo vappi"
alias doctorwho="cd ~/Videos/'Doctor Who'/"
alias mkdwm="makepkg -if --skipinteg"

cd ~
