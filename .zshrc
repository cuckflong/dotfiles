if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="/home/clong/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=()

source $ZSH/oh-my-zsh.sh

# User configuration

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Alias
alias ls='ls --color=auto'
alias gdb="gdb -q"
alias sudo="sudo -E"
alias burpu="java -javaagent:/opt/BurpUnlimited/BurpUnlimited.jar -agentpath:/opt/BurpUnlimited/lib/libfaketime64.so -jar /opt/BurpUnlimited/BurpUnlimited.jar"
alias docker="sudo grc docker"
alias updatedb="sudo updatedb"
alias wireshark="sudo wireshark"
alias ping="grc ping"
alias nmap="grc nmap"
alias ps="grc ps"
alias netstat="grc netstat"
alias diff="grc diff"
alias grep="grep --color=auto"
alias ifconfig="grc ifconfig"
alias iwconfig="grc iwconfig"
alias dig="grc dig"
alias whois="grc whois"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Syntax Highlighing
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]='fg=blue,bold,underline'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=magenta,bold'

# Antigen Bundle
source $HOME/.config/antigen.zsh
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen apply

# Termite Directory
if [[ $TERM == xterm-termite ]]; then
  . /etc/profile.d/vte.sh
  __vte_osc7
fi

setopt PROMPT_SUBST

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select
setopt +o menucomplete

export GOPATH="${HOME}/go"
export PATH="${GOPATH}/bin:$PATH"
export NEO4J_HOME="/usr/share/java/neo4j"
export TERM="xterm-256color"
export CHAOS_KEY="$(cat ${HOME}/.chaos_key)"

# Wordlists
export DIRS_SMALL="/usr/share/seclists/Discovery/Web-Content/raft-small-directories-lowercase.txt"
export DIRS_MEDIUM="/usr/share/seclists/Discovery/Web-Content/raft-medium-directories-lowercase.txt"
export DIRS_LARGE="/usr/share/seclists/Discovery/Web-Content/raft-large-directories-lowercase.txt"
export FILES_SMALL="/usr/share/seclists/Discovery/Web-Content/raft-small-files-lowercase.txt"
export FILES_MEDIUM="/usr/share/seclists/Discovery/Web-Content/raft-medium-files-lowercase.txt"
export FILES_LARGE="/usr/share/seclists/Discovery/Web-Content/raft-large-files-lowercase.txt"
export BIG="/usr/share/seclists/Discovery/Web-Content/big.txt"
export ROCKYOU="/usr/share/seclists/Passwords/Leaked-Databases/rockyou.txt"

##############################################################################
# History Configuration
##############################################################################
HISTSIZE=5000               #How many lines of history to keep in memory
HISTFILE=$HOME/.zsh_history     #Where to save history to disk
SAVEHIST=5000               #Number of history entries to save to disk
setopt    appendhistory     #Append history to the history file (no overwriting)
unsetopt share_history
setopt incappendhistory #Immediately append to the history file, not just when a term is killed

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
