#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install ripgrep \
  fd \
  jq \
  htop \
  iamlive \
  ipcalc \
  kind \
  lolcat \
  neovim \
  shellcheck \
  sqlite \
  wget \
  sqlite \
  terraform \
  terraformer \
  tree \
  git \
  figlet \
  bat \
  krew \
  awscli \
  libpq

echo 'export PATH="/opt/homebrew/opt/libpq/bin:$PATH"' >> ~/.zshrc

bres install pspg

brew tap homebrew/cask-fonts
brew install font-hack-nerd-font

# zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
