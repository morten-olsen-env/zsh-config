#!/usr/bin/env bash

INSTALLPATH="~/env-configs/zsh"

if [ -d ~/env-configs/zsh ]; then
  read -p "zsh has already been checked out at the location, do you want to remove it? [y/N]" yn
  case $yn in
    [Yy]* );;
    * ) echo "exiting"; exit 1;;
  esac
fi

rm -rf $INSTALLPATH
echo "Fetching repo"
mkdir -p $INSTALLPATH
git clone https://github.com/morten-olsen-env/zsh-config $INSTALLPATH

echo "Installing"
sh $INSTALLPATH/install.sh
