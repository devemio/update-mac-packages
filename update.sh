#!/bin/bash

# Helpers
function log {
    echo -e '\033[0;32m'"$1"'\033[0m'
}

# Brew
log 'Update brew packages'
brew update && brew upgrade --cleanup
brew cask upgrade
brew cleanup
# brew prune

# Composer
log 'Update global composer packages'
composer global update

# Npm
log 'Update npm and global packages'
npm install -g npm
npm update -g
npm outdated -g --depth=0 | awk '{ print $1 }' | tail -n +2 | xargs npm -g install

# Valet
log 'Update valet'
valet install