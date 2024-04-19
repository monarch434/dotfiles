export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# brew shell completion
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

# fnm setup
eval "$(fnm env --use-on-cd)"

source $ZSH/oh-my-zsh.sh

# Leave at the end of the file
eval "$(starship init zsh)"

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
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit
complete -C '/usr/local/bin/aws_completer' aws

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# find & checkout branch with fzf
gch () {
    git checkout "$(git branch --all | fzf | tr -d '[:space:]')"
}

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terragrunt terragrunt

# initialise zoxide
eval "$(zoxide init --cmd cd zsh)"
