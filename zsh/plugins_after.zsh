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
