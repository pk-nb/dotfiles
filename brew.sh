#!/bin/bash

# Install command-line tools using Homebrew

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Zsh
brew install zsh zsh-completion zsh-autosuggestions zsh-syntax-highlighting zsh-vi-mode pure

# Install more recent versions of some OS X tools
brew install nano grep openssh

# Install trash cli tool
brew install trash

# Modern shell tools
# https://jvns.ca/blog/2022/04/12/a-list-of-new-ish--command-line-tools/
#
# z - jump around folders
# https://github.com/rupa/z
#
# ripgrep - fast grep search and folder searcher (respects gitignore too)
# https://github.com/BurntSushi/ripgrep
#
# exa - ls replacement with tree/grid/icon/git support
# https://the.exa.website/features/git
#
# httpie
# https://httpie.io/docs/cli
#
# asdf - version switcher for node/ruby/python, etc
# https://asdf-vm.com
#
# ldns (drill)
# https://www.nlnetlabs.nl/projects/ldns/about/
#
# bat - cat replacement with nice syntax highlighting/color/git
# https://github.com/sharkdp/bat#installation
#
# dog - DNS lookup tool (easy to use)
# https://github.com/ogham/dog
# 
# git-delta - nice diff display for git diff/blame etc. See gitconfig and `delta --help`.
#
# fd - find replacement
# pgcli - autocompleting postgres client
# https://www.pgcli.com
brew install z jq ripgrep exa httpie fzf asdf ldns dog fd duf dust bat git-delta pgcli tldr sd hexyl choose jless jo jc

# Remove outdated versions from the cellar
brew cleanup
