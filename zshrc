export PATH=$PATH:/Users/rogerwelin/go/bin

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-syntax-highlighting zsh-autosuggestions web-search)
source $ZSH/oh-my-zsh.sh

# handy tf aliases
alias tfinit='terraform init -backend-config'
alias tflock='terraform providers lock -platform=darwin_arm64 -platform=linux_amd64'

# ripgrep 
alias rg="rg --no-ignore-vcs"

# psgq pager settings for psql
export PSQL_PAGER='pspg -X -b -s 17'

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# k8s autocomplete
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

# krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# vim mode zsh
bindkey -v
