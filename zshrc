#---------------------
# Shell Config
#---------------------

# Set editor
export EDITOR=vim

# Set history and size
export HISTFILE=$HOME/.zsh_history
export SAVEHIST=100000
export HISTIGNORE="exit:ls:bg:fg:history:clear"
export HISTTIMEFORMAT="%F %T"

setopt hist_ignore_dups             # ignore duplication command history list
setopt hist_verify                  # expand history onto the current line instead of executing it
setopt extended_history             # save beginning time and elapsed time before commands in history
setopt append_history               # append to the end of the history file
setopt inc_append_history           # always be saving history (not just when the shell exits)

# Run in vim mode (press escape)
bindkey -v

# z beats cd most of the time. `brew install z`
zpath="$(brew --prefix)/etc/profile.d/z.sh"
[ -s $zpath ] && source $zpath

# Install completions and autosuggest
fpath=(/usr/local/share/zsh-completions $fpath)
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

#---------------------
# Alias's
#---------------------
alias ls='ls -FG'
alias ll='ls -lh'
alias be='bundle exec'
alias dc='docker-compose'
