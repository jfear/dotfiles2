# Use colors in coreutils utilities output
alias ls='ls --color=auto'
alias grep='grep --color'

# ls aliases
alias ll='ls -lh'
alias lll='ls -lh --time-style full-iso'
alias la='ls -1'
alias lle='ls -lhSr *.e.*'
alias llo='ls -lhSr *.o.*'
alias lt='ls -T -L'

# Abbreviations
alias l='clear'
alias s='cd ../'
alias e='exit'
alias sshhosts="grep -w -i -E 'Host|HostName' ~/.ssh/config | sed 's/Host //' | sed 's/HostName //'"

# Shell Tools
alias less="less -S"
alias dirs='dirs -v'
alias htopu='htop -u fearjm'

# rust replacements
[[ -f ~/.local/bin/exa ]] && alias ls="exa"
[[ -f ~/.local/bin/bat ]] && alias cat="bat"
[[ -f ~/.local/bin/dust ]] && alias du="dust"

# vim
if hash nvim 2>/dev/null; then
  alias vi='nvim'
  alias vim='nvim'
fi

# vim : ft=sh
