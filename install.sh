#!/bin/bash

eval "$(curl -sL https://raw.githubusercontent.com/madurmanov/install/master/install.sh)"

install_start


# Homebrew

if confirm "$DYWI homebrew" ; then
  install_alert "homebrew"
  if [ ! -f "`which brew`" ] ; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  else
    install_already "Homebrew"
  fi
fi


# Homebrew casks

if confirm "$DYWI homebrew casks" ; then
  IFS=$'\n' read -d '' -r -a BREW_CASKS < brew-casks.dat
  for CASK in ${BREW_CASKS[*]} ; do
    install_alert "brew cask $CASK"
    if brew cask ls --versions $CASK > /dev/null 2> /dev/null ; then
      install_already "Brew cask $CASK"
    else
      brew cask install $CASK
    fi
  done
fi


# Homebrew formulas

if confirm "$DYWI homebrew formulas" ; then
  IFS=$'\n' read -d '' -r -a BREW_FORMULAS < brew-formulas.dat
  for FORMULA in ${BREW_FORMULAS[*]} ; do
    install_alert "brew formula $FORMULA"
    if brew ls --versions $FORMULA > /dev/null ; then
      install_already "Brew formula $FORMULA"
    else
      brew install $FORMULA
    fi
  done
fi


# Fonts

if confirm "$DYWI fonts" ; then
  install fonts $HOME/Library/Fonts
fi


# Bash

echo "\033[1mIf you want use new version of bash follow these steps:\033[0m"
echo "1. Run \033[32m'vi /etc/shells'\033[0m and add \033[32m'/usr/local/bin/bash'\033[0m to the list;"
echo "2. Run \033[32m'chsh -s /usr/local/bin/bash [username]'\033[0m and restart your terminal."


install_complete
