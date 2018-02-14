#/!bin/sh
FINGERPRINT=8B9DF6F4E233D7CC5003AC49726A325560E4198D

if [ -f $HOME/.netrc ]; then
  if gpg -e -r $FINGERPRINT $HOME/.netrc ; then
    rm -f $HOME/.netrc
    chmod 600 $HOME/.netrc
  else
    echo "Could not encrypt the .netrc"
  fi
else
  echo "No .netrc exists"
fi

if [ -f $HOME/.zsh/bin/git-credential-netrc ]; then
  echo "Setting up git credentials"
  git config --global credential.helper "$HOME/.zsh/bin/git-credential-netrc"
  git config --global user.signingkey $FINGERPRINT
  git config --global commit.gpgsign true
else
  echo "Git credentials does not exist"
fi