#-------------------------
# Shell Config
#-------------------------

# Set editor
export EDITOR=vim

# Set history and size
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
HISTIGNORE="exit:ls:bg:fg:history:clear"

# Show history
case $HIST_STAMPS in
  "mm/dd/yyyy") alias history='fc -fl 1' ;;
  "dd.mm.yyyy") alias history='fc -El 1' ;;
  "yyyy-mm-dd") alias history='fc -il 1' ;;
  *) alias history='fc -l 1' ;;
esac

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data

# load previous history for search / up / down
# fc -RI

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

# Initialize completions scripts on fpath (including homebrew completions in /etc)
# Lazy load the ~/.zcompdump check
autoload -Uz compinit
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
  compinit
else
  compinit -C
fi

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

# nvm (using fast init method from https://github.com/creationix/nvm/issues/539#issuecomment-245791291)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" --no-use # This setups nvm to be lazy-loaded

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

# Alias node, npm, and yarn to access node lazily. We reset the alias on cd to ensure we always use
# the right nvm version when in a new folder (respecting the nvmrc if possible).
alias node='unalias node ; unalias npm ; unalias yarn ; export NVM_LOADED_FOR_PATH=1 ; load-nvmrc ; node $@';
alias npm='unalias node ; unalias npm ; unalias yarn ; export NVM_LOADED_FOR_PATH=1 ; load-nvmrc ; npm $@';
alias yarn='unalias node ; unalias npm ; unalias yarn ; export NVM_LOADED_FOR_PATH=1 ; load-nvmrc ; yarn $@';

unset_nvm() {
  if [[ "$NVM_LOADED_FOR_PATH" -eq 1 ]]; then
    export NVM_LOADED_FOR_PATH=0
    alias node='unalias node ; unalias npm ; unalias yarn ; export NVM_LOADED_FOR_PATH=1 ; load-nvmrc ; node $@';
    alias npm='unalias node ; unalias npm ; unalias yarn ; export NVM_LOADED_FOR_PATH=1 ; load-nvmrc ; npm $@';
    alias yarn='unalias node ; unalias npm ; unalias yarn ; export NVM_LOADED_FOR_PATH=1 ; load-nvmrc ; yarn $@';
  fi
}

add-zsh-hook chpwd unset_nvm

# Include binaries for qt5.5 (capybara-webkit)
# export PATH="$(brew --prefix qt@5.5)/bin:$PATH"

#-------------------------
# Alias's
#-------------------------
alias ls='ls -FG'
alias ll='ls -lh'
alias be='bundle exec'
alias dc='docker-compose'
alias rm='rm -i' # force safe interactive (prefer using trash)
# alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'

#-------------------------
# Highlighting
#-------------------------

# Must be last
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
