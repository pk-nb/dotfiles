# Accept xcode license if necessary (after xcode and command line tools install)
sudo xcodebuild -license accept

# Install submodules
git submodule update --init --recursive

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Run brew install scripts
./brew.sh
./brew-cask.sh

# Install dotfiles
./dotfile-install

# Prompt for restart
echo "Lots of config and programs have been added--restart your machine!"
