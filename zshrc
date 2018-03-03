export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export INITPATH=$PWD
export CWD="$(readlink $HOME/.zsh)"
export PATH=$HOME/.local/bin:$HOME/.zsh/bin:$PATH
export EDITOR='vim'
export KEYTIMEOUT=1

# ZSH
export ZSH=$HOME/.zsh/oh-my-zsh
ZSH_CUSTOM=$HOME/.zsh/custom
ZSH_THEME="lambda-gitster/lambda-gitster"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Node
export NVM_DIR="$(echo $CWD)nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Travis
[ -f /Users/morten/.travis/travis.sh ] && source /Users/morten/.travis/travis.sh

# Android
export ANDROID_HOME=$(echo $CWD)android
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
if [ -d $(echo $CWD)android/tools ]; then
else
  echo "Installing Android"
  # TODO: Change for non darwin, to use linux version
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

# GO
export GOROOT=$(echo $CWD)go
export PATH=$PATH:$GOROOT/bin
if [ -d $(echo $CWD)go/bin ]; then
else
  echo "Installing GO"
  # TODO: Change for non darwin, to use linux version
  curl https://dl.google.com/go/go1.10.darwin-amd64.tar.gz -o $(echo $CWD)go.tar.gz
  cd $CWD
  tar -xf $(echo $CWD)go.tar.gz
  rm $(echo $CWD)go.tar.gz
  cd $INITPATH
fi

# Ruby
export rvm_path="$(echo $CWD)rvm"
if [ -d $(echo $CWD)rvm ]; then
else
  echo "Installing RVM"
  curl -sSL https://get.rvm.io | bash -s -- --ignore-dotfiles
fi
source "$(echo $CWD)rvm/scripts/rvm"

# Python
export PYENV_ROOT="$(echo $CWD)pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
