#!/bin/bash

# Install command-line tools using Homebrew

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# GNU core utilities (those that come with OS X are outdated)
brew install coreutils
brew install moreutils
# GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
brew install findutils
# GNU `sed`, overwriting the built-in `sed`
brew install gnu-sed --with-default-names

# Zsh
brew install zsh
brew install zsh-completion
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting

# Install more recent versions of some OS X tools
# brew install vim --with-override-system-vi
brew install nano
brew install grep
brew install openssh
brew install screen

# z hopping around folders
brew install z

# Install other useful binaries
brew install tmux
brew install direnv
brew install jq # handy json tool for piping, parsing, etc
brew install the_silver_searcher # installs ag command
brew install fzf # fuzzy file search
brew install git
brew install imagemagick --with-webp
brew install tree
brew install ffmpeg --with-libvpx
brew install terminal-notifier
brew install cmake

# Language / dev support
# brew install rbenv # zsh hook is in place--you will need to install a ruby
brew install nginx
# brew install qt@5.5 # capybara-webkit (remove when not working on rails apps)

# Install common tools
brew install heroku

# Install common dependencies
brew install node # This installs `npm` too using the recommended installation method
brew install postgres
brew install postgis
# brew install yarn # installing with npm

# manage node and ruby versions with these shimming tools
brew install rbenv
brew install nodenv

# Remove outdated versions from the cellar
brew cleanup
