#!/bin/bash

# Update brew
brew update && brew upgrade --cleanup && brew cleanup
brew cask upgrade && brew cask cleanup
# brew prune

# Update global composer
composer global update

# Update npm and global packages
npm install -g npm
npm outdated -g --depth=0 | awk '{ print $1 }' | tail -n +2 | xargs npm -g install

# Update valet
valet install