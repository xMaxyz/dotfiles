# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
unsetopt autocd beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/max/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias la='ls -a --color=auto'
alias cls='clear'
alias ll='ls -la --color=auto'
alias hyprconf='vim $HOME/.dotfiles/hypr/hyprland.lua'
alias n='nano'
alias v='vim'
alias pacinfo='cat $HOME/.local/info/pacman'
alias gitlog='git log --oneline'

typeset -U path PATH
path=(~/.local/bin $path)
export PATH
PROMPT='[%n@%m %1~]%# '

eval "$(thefuck --alias)"

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
