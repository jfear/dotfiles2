ATTRIBUTE_BOLD='\[\e[1m\]'
ATTRIBUTE_RESET='\[\e[0m\]'
COLOR_DEFAULT='\[\e[39m\]'
COLOR_RED='\[\e[31m\]'
COLOR_GREEN='\[\e[32m\]'
COLOR_YELLOW='\[\e[33m\]'
COLOR_BLUE='\[\e[34m\]'
COLOR_MAGENTA='\[\e[35m\]'
COLOR_CYAN='\[\e[36m\]'
FINGER=$'\xe2\x98\x9b'

machine_name() {
    if [[ -f $HOME/.name ]]; then
        cat $HOME/.name
    else
        hostname
    fi
}

GIT_PS1_SHOWCOLORHINTS=true
PROMPT_DIRTRIM=3

CURRENT_HOST="${COLOR_MAGENTA}\\u${COLOR_DEFAULT}${COLOR_CYAN}@\$(machine_name)${COLOR_DEFAULT}"
CURRENT_LOC="${COLOR_BLUE}\w${COLOR_DEFAULT}"
CHECK_LAST_COMMAND="\$(if [ \$? -ne 0 ]; then echo \"${COLOR_RED}!${COLOR_DEFAULT} \"; fi)"
PROMPT_COMMAND='__git_ps1 "\n${CONDA_PROMPT_MODIFIER}${CURRENT_HOST} ${CURRENT_LOC}" "\n${CHECK_LAST_COMMAND} ${FINGER} " " [%s]"'
