export ZSH=$HOME/.zsh/oh-my-zsh
ZSH_CUSTOM=$HOME/.zsh/custom
ZSH_THEME="lambda-gitster/lambda-gitster"
plugins=(git)

source $ZSH/oh-my-zsh.sh
export EDITOR='vim'
bindkey -v
export KEYTIMEOUT=1

export NVM_DIR="$(readlink $HOME/.zsh)nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
