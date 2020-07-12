# Add FZF if it is installed
if [ -f ~/.fzf.bash ]; then
    path_prepend "$HOME/.fzf/bin"
    source ~/.fzf.bash
fi
