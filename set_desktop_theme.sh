#!/bin/bash

$PRINT_COLORED "Downloading KDE themes..."

cd $HOME
mkdir Projects
cd Projects/
git clone https://gitlab.com/skylineone044/stardust.git
cd stardust
chmod +x *.sh
bash setup.sh

$PRINT_COLORED "Settings desktop configs..."
kwriteconfig5 --file kwinrc --group ModifierOnlyShortcuts --key Meta "org.kde.krunner,/App,,toggleDisplay"

$PRINT_COLORED "Themes Done."

