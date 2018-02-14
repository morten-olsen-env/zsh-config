#!/bin/bash

mkdir -p $HOME/.android
curl https://dl.google.com/android/repository/sdk-tools-darwin-3859397.zip -o $HOME/.android/android.zip
unzip $HOME/.android/android.zip -d $HOME/.android/
rm -f $HOME/.android/android.zip
mkdir -p $HOME/.android/licenses
echo "\nd56f5187479451eabf01fb78af6dfcb131a6481e" > $HOME/.android/licenses/android-sdk-license