#!/bin/bash
#
BOLD_GREEN='\033[1;32m'
CLEAR_COLOR='\033[0m' # No Color
# alias echo=echo -e "$BOLD_GREEN"

./install_apps.sh
./link_configs.sh
./set_desktop_theme.sh

echo "All done$CLEAR_COLOR"
