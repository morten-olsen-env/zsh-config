export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export PATH=$HOME/.local/bin:$PATH
export ZSH=$HOME/.zsh/oh-my-zsh
export ANDROID_HOME=$HOME/.android
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$HOME/.zsh/bin
ZSH_CUSTOM=$HOME/.zsh/custom
ZSH_THEME="lambda-gitster/lambda-gitster"
plugins=(git)

source $ZSH/oh-my-zsh.sh
export EDITOR='vim'
export KEYTIMEOUT=1

export NVM_DIR="$(readlink $HOME/.zsh)nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
