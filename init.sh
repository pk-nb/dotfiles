# Accept xcode license if necessary (after xcode and command line tools install)
sudo xcodebuild -license accept

# Install submodules
git submodule update --init --recursive

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Run brew install scripts

./brew.sh
./brew-cask.sh

# Install npm globals
./npm.sh

# Set zsh as default shell for user
sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh

# Install dotfiles
./dotfile-install

# Install vim plug (https://github.com/junegunn/vim-plug)
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Configure italics via terminfo override (https://sookocheff.com/post/vim/italics/, man tic)
./italics.sh

# Configure osx
./macos.sh

# Prompt for restart
echo "Lots of config and programs have been added--restart your machine!"
