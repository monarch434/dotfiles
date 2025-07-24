export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="half-life"
# ZSH_THEME="rkj-repos"
# ZSH_THEME="bira"

plugins=(
    git
    zsh-autosuggestions
    zsh-history-substring-search
    zsh-syntax-highlighting
    brew
    aws
    kubectl
    macos
    kube-ps1
)

RPROMPT='$(kube_ps1)'

source $ZSH/oh-my-zsh.sh

export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR=nvim
export COLIMA_HOME="$XDG_CONFIG_HOME/colima"
export ANDROID_HOME="$HOME/ANDROID/sdk/cmdline-tools/bin"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

# zsh-completion
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
  fi

# fnm setup
eval "$(fnm env --use-on-cd)"

# bun completions
[ -s "/Users/alvinmaquena/.bun/_bun" ] && source "/Users/alvinmaquena/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# GO
export PATH="$HOME/go/bin:$PATH"

# fzf
#export FZF_DEFAULT_OPTS="--preview 'bat --color=always --style=numbers --line-range=:500 {}'"
export FZF_DEFAULT_COMMAND="find * -type f | fzf > selected"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# find & checkout branch with fzf
gch () {
    git checkout "$(git branch --all | fzf | tr -d '[:space:]')"
}

# decode JWT
jwt-decode () {
  local in=$1; if [ -z "$in" ]; then read in; fi
  jq -R 'split(".") | .[1] | @base64d | fromjson' <<< "$in"
}

fzf-zoxide-widget() {
    local dir
    dir=$(zoxide query -l | fzf +m) && cd "$dir"
    zle reset-prompt
}

zle -N fzf-zoxide-widget
bindkey '\ez' fzf-zoxide-widget

# Set default Kubernetes editor
export KUBE_EDITOR=nvim

# terragrunt autocompletion
complete -o nospace -C /opt/homebrew/bin/terragrunt terragrunt

# pnpm autocompletion
source ~/completion-for-pnpm.zsh

# stern completions
source <(stern --completion=zsh)

# initialise zoxide
eval "$(zoxide init --cmd cd zsh)"

# Aliases
alias ls="eza -hal"
alias lg="lazygit"
