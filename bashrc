# Functions
source ~/.shell/functions.sh

# Allow local customizations in the ~/.shell_local_before file
[ -f ~/.shell_local_before ] && source ~/.shell_local_before

# Allow local customizations in the ~/.bashrc_local_before file
[ -f ~/.bashrc_local_before ] && source ~/.bashrc_local_before

# Settings
source ~/.bash/settings.bash

# Bootstrap
source ~/.shell/bootstrap.sh

# External settings
source ~/.shell/external.sh

# Aliases
source ~/.shell/aliases.sh

# Plugins
source ~/.bash/plugins.bash

# Custom prompt
source ~/.bash/prompt.bash

# Allow local customizations in the ~/.shell_local_after file
[ -f ~/.shell_local_after ] && source ~/.shell_local_after

# Allow local customizations in the ~/.bashrc_local_after file
[ -f ~/.bashrc_local_after ] && source ~/.bashrc_local_after

