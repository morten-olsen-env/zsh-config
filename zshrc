export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export CWD="$(readlink $HOME/.zsh)"
export PATH=$HOME/.local/bin:$PATH
export rvm_path="$(readlink $HOME/.zsh)rvm"
export ZSH=$HOME/.zsh/oh-my-zsh
export ANDROID_HOME=$(echo $CWD)android
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
# export PATH="$PATH:$CWD/rvm/bin"

export PYENV_ROOT="$(echo $CWD)pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# added by travis gem
[ -f /Users/morten/.travis/travis.sh ] && source /Users/morten/.travis/travis.sh

if [ -d $(echo $CWD)android ]; then
else
  echo "Installing Android"
  curl https://dl.google.com/android/repository/sdk-tools-darwin-3859397.zip -o android.zip
  mkdir -p $(echo $CWD)android
  mv android.zip $(echo $CWD)android
  pushd $(echo $CWD)android
  unzip android.zip
  rm android.zip
  popd
fi

if [ -f $(echo $CWD)android/licenses/android-sdk-license ]; then
else
  mkdir -p $(echo $CWD)android/licenses
  echo "\nd56f5187479451eabf01fb78af6dfcb131a6481e" > $(echo $CWD)android/licenses/android-sdk-license
fi

if [ -d $(echo $CWD)rvm ]; then
else
  echo "Installing RVM"
  curl -sSL https://get.rvm.io | bash -s -- --ignore-dotfiles
fi
source "$(echo $CWD)rvm/scripts/rvm"
eval "$(pyenv init -)"
