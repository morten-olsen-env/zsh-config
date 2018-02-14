if [ -f ~/.zshrc ] || [ -d ~/.zsh ]; then
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

if [ ! -d ~/.zsh ]; then
  ./install-android.sh
fi

echo 'installing'
rm -f ~/.zshrc
rm -f -R ~/.zsh
if [ ! -f ~/.zshrc ] && [ ! -d ~/.zsh ]; then
  ln -s $(pwd)/zshrc ~/.zshrc
  ln -s $(pwd)/ ~/.zsh
  if [ -f ~/.zshrc ] && [ -d ~/.zsh ]; then
    echo "zsh config installed"
    echo "setting up modules"
    git submodule init
    git submodule update
    git submodule update --init --recursive
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
