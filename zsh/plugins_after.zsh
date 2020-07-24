source ~/.zsh/plugins/conda-zsh-completion/conda-zsh-completion.plugin.zsh
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/plugins/zsh-completions/zsh-completions.plugin.zsh
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Load FZF
if [ -f ~/.fzf.zsh ]; then
    path_prepend "$HOME/.fzf/bin"
    source ~/.fzf.zsh
fi

# Load Autojump
if [ -f ~/.local/etc/profile.d/autojump.sh ]; then
    source ~/.local/etc/profile.d/autojump.sh
    autoload -U compinit && compinit -u
fi

# Load direnv
_direnv_hook() {
  trap -- '' SIGINT;
  eval "$("$HOME/.local/bin/direnv" export zsh)";
  trap - SIGINT;
}
typeset -ag precmd_functions;
if [[ -z ${precmd_functions[(r)_direnv_hook]} ]]; then
  precmd_functions=( _direnv_hook ${precmd_functions[@]} )
fi
typeset -ag chpwd_functions;
if [[ -z ${chpwd_functions[(r)_direnv_hook]} ]]; then
  chpwd_functions=( _direnv_hook ${chpwd_functions[@]} )
fi
