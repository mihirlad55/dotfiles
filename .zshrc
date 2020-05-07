# Environment Variables
export PATH=$PATH:/opt/gcc-arm-none-eabi-8-2019-q3-update/bin
export LANG=en_US.UTF-8
export ZSH="$HOME/.oh-my-zsh"
export LPASS_CLIPBOARD_COMMAND="xclip -selection clipboard -in -l 2"
export EDITOR=nvim

# oh-my-zsh
#ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git)
source $ZSH/oh-my-zsh.sh


# Antigen
source ~/.antigen/antigen.zsh

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

vi-append-x-selection () { RBUFFER=$(xclip -selection clipboard -o < /dev/null)$RBUFFER; }
vi-yank-x-selection () { print -rn -- $CUTBUFFER | xclip -selection clipboard -i; }
zle -N vi-append-x-selection
bindkey -a '^X' vi-append-x-selection
zle -N vi-yank-x-selection
bindkey -a '^Y' vi-yank-x-selection


#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#export PROMPT=$'%{\e[0;31m%}%n %{\e[0;36m%}%~ %% '
export EDITOR=nvim

# Aliases

alias p="sudo pacman"
alias SS="sudo systemctl"
alias se="sudoedit"
alias g="git"
alias o="xdg-open"
alias vifm="$HOME/.vifm/scripts/vifmrun"
alias srm="trash-put"

# Always output termdown to /tmp/termdown for polybar
alias termdown="termdown -o '/tmp/termdown'"

# Adding color
alias grep="grep --color=auto"
alias ccat="highlight --out-format=ansi"

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi
