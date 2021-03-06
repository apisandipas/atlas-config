#!/usr/bin/env zsh
#█████
#░░███
#█████████ █████ ░███████  ████████ ██████
#░█░░░░███ ███░░  ░███░░███░░███░░█████░░███
#░   ███░ ░░█████ ░███ ░███ ░███ ░░░███ ░░░
#███░   █░░░░███░███ ░███ ░███   ░███  ███
#██    ███████████████ ████ ██████████  ░░██████
#░░    ░░░░░░░░░░░░░░░ ░░░░ ░░░░░░░░░░    ░░░░░░


source ~/.profile

export DOTS_DIR=~/.dotfiles

source $DOTS_DIR/zsh/lib/utils.zsh
source $DOTS_DIR/zsh/lib/functions.zsh
source $DOTS_DIR/zsh/lib/globals.zsh
source $DOTS_DIR/zsh/lib/globals.zsh
source $DOTS_DIR/zsh/lib/keybinds.zsh
source $DOTS_DIR/zsh/lib/aliases.zsh

# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"

## History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
[ "$HISTSIZE" -lt 50000 ] && HISTSIZE=50000
[ "$SAVEHIST" -lt 10000 ] && SAVEHIST=10000

## History command configuration
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data

# load Node Version Manager
#source $HOME/.nvm/nvm.sh

# load the starship prompt
#eval "$(starship init zsh)"

# load z-jump script
eval "$(zoxide init zsh)"

~/.bin/colortest
# colorscript -r

export PATH="$HOME/.bin/:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"


