INITDIR=$PWD
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ -f $HOME/.zshrc ] || [ -d $HOME/.zsh ]; then
  read -p "a zsh config is already installed, do you wish to override it? [y/N]" yn
  case $yn in
    [Yy]* );;
    * ) echo "exiting"; exit 1;;
  esac
fi

CHECK_ZSH_INSTALLED=$(grep /zsh$ /etc/shells | wc -l)
if [ ! $CHECK_ZSH_INSTALLED -ge 1 ]; then
   printf "Zsh is not installed! Please install zsh first!\n"
   exit 2
fi
unset CHECK_ZSH_INSTALLED

echo 'installing'
rm -f $HOME/.zshrc
rm -f -R $HOME/.zsh
if [ ! -f $HOME/.zshrc ] && [ ! -d $HOME/.zsh ]; then
  ln -s $DIR/zshrc $HOME/.zshrc
  ln -s $DIR/ $HOME/.zsh
  if [ -f $HOME/.zshrc ] && [ -d $HOME/.zsh ]; then
    echo "zsh config installed"
    echo "setting up modules"
    cd $DIR
    git submodule init
    git submodule update
    git submodule update --init --recursive
    cd $INITDIR
    chsh -s $(grep /zsh$ /etc/shells | tail -1)
    exit 0
  else
    echo "could not install the new config"
    exit 2
  fi
else
  echo 'could not remove previous zsh configuration'
  exit 2
fi
