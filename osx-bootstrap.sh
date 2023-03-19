#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install ripgrep fd jq htop iamlive ipcalc kind lolcat neovim shellcheck sqlite wget sqlite terraform terraformer tree git figlet bat awscli

brew tap homebrew/cask-fonts
brew install font-hack-nerd-font
