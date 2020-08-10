# Created by newuser for 5.6.2

. /usr/lib/python3.8/site-packages/powerline/bindings/zsh/powerline.zsh

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

# Powerline Shell
function powerline_precmd() {
    PS1="$(powerline-shell --shell zsh $?)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi

# Antigen Bundle
source $HOME/.config/antigen.zsh
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle agkozak/zsh-z
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
export NEO4J_HOME=/usr/share/java/neo4j
export TERM="xterm-256color"
export CHAOS_KEY="cd986ddcdce930dd8b0f274fce0bd602f9e2cf17ad4c5063de7f79d033cd761f"

# Wordlists
export DIRS_SMALL="/usr/share/seclists/Discovery/Web-Content/raft-small-directories-lowercase.txt"
export DIRS_MEDIUM="/usr/share/seclists/Discovery/Web-Content/raft-medium-directories-lowercase.txt"
export DIRS_LARGE="/usr/share/seclists/Discovery/Web-Content/raft-large-directories-lowercase.txt"
export FILES_SMALL="/usr/share/seclists/Discovery/Web-Content/raft-small-files-lowercase.txt"
export FILES_MEDIUM="/usr/share/seclists/Discovery/Web-Content/raft-medium-files-lowercase.txt"
export FILES_LARGE="/usr/share/seclists/Discovery/Web-Content/raft-large-files-lowercase.txt"
export BIG="/usr/share/seclists/Discovery/Web-Content/big.txt"
export ROCKYOU="/usr/share/seclists/Passwords/Leaked-Databases/rockyou.txt"

#TMOUT=1

# TRAPALRM() {
#	__vte_prompt_command
#}

##############################################################################
# History Configuration
##############################################################################
HISTSIZE=5000               #How many lines of history to keep in memory
HISTFILE=$HOME/.zsh_history     #Where to save history to disk
SAVEHIST=5000               #Number of history entries to save to disk
#HISTDUP=erase               #Erase duplicates in the history file
setopt    appendhistory     #Append history to the history file (no overwriting)
setopt    sharehistory      #Share history across terminals
setopt incappendhistory #Immediately append to the history file, not just when a term is killed

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
