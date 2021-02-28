#!/bin/bash

# Helpers
function log {
    echo -e '\033[0;32m'"$1"'\033[0m'
}

# Brew
log 'Update brew packages'
brew update && brew upgrade && brew cleanup

# Casks
# brew list --cask | grep -v 'font-' | xargs brew upgrade --cask

# Composer
log 'Update global composer packages'
composer global update

# Npm
log 'Update npm and global packages'
# npm install -g npm
# npm update -g
npm outdated -g --depth=0 | awk '{ print $1 }' | tail -n +2 | xargs npm -g install --force

# Valet
log 'Update valet'
valet install