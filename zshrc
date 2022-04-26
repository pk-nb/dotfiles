#-------------------------
# Shell Config
#-------------------------
eval "$(/opt/homebrew/bin/brew shellenv)"

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
PURE_PROMPT_SYMBOL=▲
autoload -U promptinit; promptinit
prompt pure

# Initialize completions scripts on fpath (including homebrew completions in /etc)
# Lazy load the ~/.zcompdump check
# https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

autoload -Uz compinit
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
  compinit
else
  compinit -C
fi

# z beats cd most of the time. `brew install z`
zpath="$(brew --prefix)/etc/profile.d/z.sh"
[ -s $zpath ] && source $zpath

# Install zsh-completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

# Install zsh-autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# Install zsh-vi-mode
source /opt/homebrew/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
# If using zsh mode, history search has to be initialized after plugin loads lazily
zvm_after_init_commands+=("bindkey '^[[A' history-beginning-search-backward" "bindkey '^[[B' history-beginning-search-forward")


# Use history search
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

#--------------------------
# Path changes and tools
#-------------------------
# Init asdf for version management
. /opt/homebrew/opt/asdf/libexec/asdf.sh

#-------------------------
# Alias's
#-------------------------
alias ls='ls -FG'
alias ll='ls -lh'
alias ex='exa --icons'
alias el='exa -l --icons --git'
alias et='exa --tree --icons'
alias be='bundle exec'
alias dc='docker-compose'
alias dcr='dc run --rm'
alias dce='docker-compose exec'
alias rm='rm -i' # force safe interactive (prefer using trash)
alias gitclean='git checkout master && git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'

#-------------------------
# Highlighting
#-------------------------

# Must be last
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
