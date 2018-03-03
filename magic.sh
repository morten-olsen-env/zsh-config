INITIALPATH=$PWD
INSTALLPATH="./env-configs/zsh"
echo "Fetching repo"
mkdir -p $INSTALLPATH
git clone https://github.com/morten-olsen-env/zsh-config $INSTALLPATH

echo "Installing"
sh $INSTALLPATH/install.sh