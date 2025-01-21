#!/bin/bash

eval "$(curl -sL https://raw.githubusercontent.com/madurmanov/musical-install/master/musical-install.sh)"

mi_start


# Homebrew

if mi_confirm "Do you want install homebrew" ; then
  mi_step "Install homebrew"
  if [ ! -f "`which brew`" ] ; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  else
    mi_step "Homebrew already installed"
  fi
fi


# Homebrew casks

if mi_confirm "Do you want install homebrew casks" ; then
  IFS=$'\n' read -d '' -r -a BREW_CASKS < casks.dat
  for CASK in ${BREW_CASKS[*]} ; do
    mi_step "Install brew cask $CASK"
    if brew cask ls --versions $CASK > /dev/null 2> /dev/null ; then
      mi_step "Brew cask $CASK already installed"
    else
      brew install --cask $CASK
    fi
  done
fi


# Homebrew formulas

if mi_confirm "Do you want install homebrew formulas" ; then
  IFS=$'\n' read -d '' -r -a BREW_FORMULAS < formulas.dat
  for FORMULA in ${BREW_FORMULAS[*]} ; do
    mi_step "Install brew formula $FORMULA"
    if brew ls --versions $FORMULA > /dev/null ; then
      mi_step "Brew formula $FORMULA already installed"
    else
      brew install $FORMULA
    fi
  done
fi


mi_complete
