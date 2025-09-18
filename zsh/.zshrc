ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$( dirname $ZINIT_HOME )"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit light zsh-users/zsh-completions
zinit light olets/zsh-abbr
zmodload zsh/mapfile

zstyle ":completion:*" matcher-list "m:{a-z}={A-Za-z}"
zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"
zstyle ":completion:*" menu no
zstyle ":completion:*" fzf-preview "ls --color $realpath"

source ~/.config/zsh/zoxide.zsh
source ~/.config/zsh/catppuccin.zsh
# source ~/.config/zsh/custom_functions.zsh

alias c="clear"
alias ls="eza --grid --icons=auto"
alias l="eza --grid --oneline --icons=auto -la"
alias tree="eza --tree --icons=auto"

export MANPAGER="nvim +Man!"

fastfetch

eval "$(starship init zsh)"
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
