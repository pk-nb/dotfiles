# Accept xcode license if necessary (after xcode and command line tools install)

sudo xcodebuild -license accept

# Install Homebrew

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Run brew install scripts

./brew.sh
./brew-cask.sh

# Set zsh as default shell for user
sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh

# Install dotfiles
./dotfile-install


