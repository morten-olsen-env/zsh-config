INITIALPATH=$PWD
INSTALLPATH="./env-configs/zsh"
mkdir -p $INSTALLPATH
git clone https://github.com/morten-olsen-env/zsh-config $INSTALLPATH
sh $INSTALLPATH/install.sh