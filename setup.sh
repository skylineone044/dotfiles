#!/bin/bash
#
BOLD_GREEN='\033[1;32m'
CLEAR_COLOR='\033[0m' # No Color

PRINT_COLORED="printf \"$BOLD_GREEN\"%s\"$CLEAR_COLOR\"\\\\n"

./apply_system_configs.sh
./install_apps.sh
./link_configs.sh
./set_desktop_theme.sh

$PRINT_COLORED "All done$CLEAR_COLOR"
