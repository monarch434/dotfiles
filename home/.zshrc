# Aliases
alias k=kubectl

# activate autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# activate zsh-syntax-highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Ensure unique results when going back in zsh history
export HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1

# activate zsh-history-substring-search
source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# brew shell completion
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

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
export FZF_DEFAULT_OPTS="--preview 'bat --color=always {}'"
export FZF_DEFAULT_COMMAND="find * -type f | fzf > selected"

# Completion script required for aws completion
autoload -U +X bashcompinit && bashcompinit
autoload -Uz compinit && compinit
complete -C '/usr/local/bin/aws_completer' aws

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# find & checkout branch with fzf
gch () {
    git checkout "$(git branch --all | fzf | tr -d '[:space:]')"
}

# kubectl autocompleteion
source <(kubectl completion zsh)
export KUBE_EDITOR=nvim

complete -o nospace -C /opt/homebrew/bin/terragrunt terragrunt

# initialise zoxide
eval "$(zoxide init --cmd cd zsh)"

# Leave at the end of the file
eval "$(starship init zsh)"
