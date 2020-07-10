# Use colors in coreutils utilities output
alias ls='ls --color=auto'
alias grep='grep --color'

# ls aliases
alias ll='ls -lh'
alias la='ls -1'
alias lle='ls -lhSr *.e.*'
alias llo='ls -lhSr *.o.*'

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

# Git
alias gs='git status'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gd='git diff'
alias go='git checkout'
alias gps='git push'
alias gpl='git pull'
alias gl='git log'
alias gh='git log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'
alias glol='git log --graph --decorate --pretty=oneline --abbrev-commit --all'
alias gl2='git log --pretty=format:"%h %s [%an]" --graph'

# Slurm
if [ ! -z "$LMOD_sys" ]; then
  alias sme='sjobs --no-column-limit -u fearjm'
  alias wsme='watch -n 120 "sjobs --no-column-limit -u fearjm"'
  alias si='sinteractive --mem=12g --cpus-per-task=4 --time=12:00:00 --gres=lscratch:20'

  alias ms='module spider'
  alias ml='module load'
  alias mi='module show'
fi


# vim
if hash nvim 2>/dev/null; then
  alias vi='nvim'
  alias vim='nvim'
fi

# vim : ft=sh
