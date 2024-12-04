#!/bin/bash

SYSTEM_PACKAGES=$(jq -r ".packages.system[]" config.json)
YUBI_PACKAGES=$(jq -r ".packages.yubikey[]" config.json)
LANG_PACKAGES=$(jq -r ".packages.languages[]" config.json)
for pkg in $SYSTEM_PACKAGES
do
sudo pacman -S --noconfirm $pkg	
done

for pkg in $YUBI_PACKAGES
do
sudo pacman -S --noconfirm $pkg	
done

for pkg in $LANG_PACKAGES
do
sudo pacman -S --noconfirm $pkg	
done

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
