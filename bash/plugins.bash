# Add FZF if it is installed
if [ -f ~/.fzf.bash ]; then
    path_prepend "$HOME/.fzf/bin"
    source ~/.fzf.bash
fi

# Load direnv
_direnv_hook() {
  local previous_exit_status=$?;
  trap -- '' SIGINT;
  eval "$("/home/fearjm/.local/bin/direnv" export bash)";
  trap - SIGINT;
  return $previous_exit_status;
};
if ! [[ "${PROMPT_COMMAND:-}" =~ _direnv_hook ]]; then
  PROMPT_COMMAND="_direnv_hook${PROMPT_COMMAND:+;$PROMPT_COMMAND}"
fi
