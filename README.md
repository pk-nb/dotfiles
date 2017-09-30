# Dotfiles

Steps to reinstall from a old machine. Inspired by http://www.anishathalye.com/2014/08/03/managing-your-dotfiles/.

1. Restore Home folder
    * Restore libraries (iTunes, Photos, Messages)
    * Messages can be restored by replacing ~/Library/Messages and restarting
    * Copy non-symlinked dotfiles (.ssh, .z, etc)
1. Install XCode from Mac App Store (everything needs, including git)
    * Install any additional mac apps you need
1. Clone this repository / use from backup
1. Run ./init.sh
    * This installs homebrew
    * Installs all apps specified in brew.sh and brew-cask.sh
    * Adds some OSX and terminal preferences
        * You will want to adjust font and make sure the terminal reports as xterm 256 colors
    * Symlinks all dotfiles from this app (using the [dotfiles submodule](https://github.com/anishathalye/dotbot))
1. Open the apps, sign in, reconfigure, etc. Organize the dock and launchpad
1. Restore some configs from GUI apps (better touch tool, trailer, spectacle)
1. To install missing apps, update apps, and update symlinks, run ./update.sh
