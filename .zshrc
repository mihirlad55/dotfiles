# Environment Variables
export PATH=$PATH
export LANG=en_US.UTF-8
export ZSH="/home/mihirlad55/.oh-my-zsh"

# oh-my-zsh
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git)
source $ZSH/oh-my-zsh.sh


# Antigen
source ~/.submodules/antigen/antigen.zsh

antigen use oh-my-zsh
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme romkatv/powerlevel10k

antigen apply

# Use .purepower config
source ~/.purepower

# Source Fuzzy Finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Setup thefuck
eval $(thefuck --alias)

# vi mode
bindkey -v

#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#export PROMPT=$'%{\e[0;31m%}%n %{\e[0;36m%}%~ %% '
export EDITOR=nvim

# Aliases

alias p="sudo pacman"
alias SS="sudo systemctl"
alias se="sudoedit"
alias g="git"
alias o="xdg-open"

# Adding color
alias grep="grep --color=auto"
alias ccat="highlight --out-format=ansi"
