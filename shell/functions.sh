# Path manipulation
path_remove() {
    PATH=$(echo -n "$PATH" | awk -v RS=: -v ORS=: "\$0 != \"$1\"" | sed 's/:$//')
}

path_append() {
    path_remove "$1"
    PATH="${PATH:+"$PATH:"}$1"
}

path_prepend() {
    path_remove "$1"
    PATH="$1${PATH:+":$PATH"}"
}

# SSH Tunnels
nihProxy(){
  if [[ $1 == 'start' ]]; then
    ssh -D 8127 -M -S proxy-ctrl-socket -f -C -q -N portal
  elif [[ $1 == 'stop' ]]; then
    ssh -S proxy-ctrl-socket -O exit portal
  fi
}

# Conda helpers
workon() {
    if [ -n "$1" ]; then
        conda activate $1
    else
        conda env list
    fi
}
