# Italics must be added to term info. If we install to ~/.terminfo, we can override the defaults to allow.

mkdir $HOME/.terminfo
tic -o $HOME/.terminfo ./terminfo/tmux.terminfo
tic -o $HOME/.terminfo ./terminfo/tmux-256color.terminfo
tic -o $HOME/.terminfo ./terminfo/xterm-256color.terminfo
