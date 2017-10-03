#-------------------------
# Shell Config
#-------------------------

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

# load previous history for search / up / down
fc -RI

# Key mode (zle)
# http://zsh.sourceforge.net/Guide/zshguide04.html

# bindkey -v # Run in vim mode (press escape)
bindkey -e # use default (emacs) mode. We specify as it assumes we want vim mode with $EDITOR=vim

# Setup colors
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Pure Initialization (installed with npm install -g pure-prompt)
autoload -U promptinit; promptinit
PURE_PROMPT_SYMBOL=$
prompt pure

# z beats cd most of the time. `brew install z`
zpath="$(brew --prefix)/etc/profile.d/z.sh"
[ -s $zpath ] && source $zpath

# Install completions and autosuggest
fpath=(/usr/local/share/zsh-completions $fpath)
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# Use history search
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

#--------------------------
# Path changes and tools
#-------------------------
eval "$(direnv hook zsh)"
eval "$(rbenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# Run nvm use on cd (respect nvmrc files)
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# Include binaries for qt5.5 (capybara-webkit)
export PATH="$(brew --prefix qt@5.5)/bin:$PATH"

#-------------------------
# Alias's
#-------------------------
alias ls='ls -FG'
alias ll='ls -lh'
alias be='bundle exec'
alias dc='docker-compose'
alias rm='rm -i' # force safe interactive (prefer using trash)

#-------------------------
# Highlighting
#-------------------------

# Must be last
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
