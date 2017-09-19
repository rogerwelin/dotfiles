#!/bin/bash

echo ' 
 /$$$$$$$                        /$$                /$$                                                               
| $$__  $$                      | $$               | $$                                                               
| $$  \ $$  /$$$$$$   /$$$$$$  /$$$$$$   /$$$$$$$ /$$$$$$    /$$$$$$  /$$$$$$   /$$$$$$   /$$$$$$   /$$$$$$   /$$$$$$ 
| $$$$$$$  /$$__  $$ /$$__  $$|_  $$_/  /$$_____/|_  $$_/   /$$__  $$|____  $$ /$$__  $$ /$$__  $$ /$$__  $$ /$$__  $$
| $$__  $$| $$  \ $$| $$  \ $$  | $$   |  $$$$$$   | $$    | $$  \__/ /$$$$$$$| $$  \ $$| $$  \ $$| $$$$$$$$| $$  \__/
| $$  \ $$| $$  | $$| $$  | $$  | $$ /$$\____  $$  | $$ /$$| $$      /$$__  $$| $$  | $$| $$  | $$| $$_____/| $$      
| $$$$$$$/|  $$$$$$/|  $$$$$$/  |  $$$$//$$$$$$$/  |  $$$$/| $$     |  $$$$$$$| $$$$$$$/| $$$$$$$/|  $$$$$$$| $$      
|_______/  \______/  \______/    \___/ |_______/    \___/  |__/      \_______/| $$____/ | $$____/  \_______/|__/      
                                                                              | $$      | $$                          
                                                                              | $$      | $$                          
                                                                              |__/      |__/                          
'

logger () {
  RED='\033[0;31m'
  NC='\033[0m'
  echo -e ${RED}$(date -u)${NC} "\t" $1
  sleep 1
}

logger "Adding golang, docker, spotify, numix & atom ppa:s" && \ 
  sudo add-apt-repository ppa:gophers/archive -y && \
  sudo add-apt-repository ppa:numix/ppa -y && \
  sudo add-apt-repository ppa:webupd8team/atom -y && \
  sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 0DF731E45CE24F27EEEB1450EFDC8610341D9410 && \
  echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list && \
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && \
  sudo add-apt-repository "deb [arch=s390x] https://download.docker.com/linux/ubuntu trusty stable" -y && \
  sudo apt-get update && \
  logger "Installing spotify-client" && \
  sudo apt-get -y install spotify-client && \
  logger "Installing docker-ce" && \
  sudo apt-get -y install docker-ce && \
  logger "Installing golang-1.9" && \
  sudo apt-get -y install golang-1.9 && \
  logger "Installing numix themes" && \
  sudo apt-get install -y numix-icon-theme-circle numix-icon-theme && \
  logger "Installing conky" && \
  sudo apt-get install -y conky && \
  logger "Installing Atom editor" && \
  sudo apt-get -y install atom && \
  logger "Installing htop" && \
  sudo apt-get -y install htop && \
  logger "Installing mlocate" && \
  sudo apt-get -y install mlocate && \
  logger "Installing bash git prompt" && \
  mkdir -p /home/roger/env/bash-git && \
  git clone https://github.com/magicmonty/bash-git-prompt /home/roger/env/bash-git && \
  logger "Installing ruby bundler" && \
  sudo gem install bundler && \
  logger "Installing Vundle" && \
  mkdir -p ~/.vim/bundle/ && \
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && \
  logger "Installing nvm (node)" && \
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.4/install.sh | bash && \
  logger "Downloading and extracting Intellij" && \
  wget "https://download.jetbrains.com/idea/ideaIC-2017.2.4.tar.gz" -P /home/roger/Downloads/ && \
  cd /home/roger/Downloads && tar xvf ideaIC-2017.2.4.tar.gz && rm -f ideaIC-2017.2.4.tar.gz && \
  echo '
  /$$$$$$  /$$ /$$             /$$                               /$$ /$$ /$$
 /$$__  $$| $$| $$            | $$                              | $$| $$| $$
| $$  \ $$| $$| $$        /$$$$$$$  /$$$$$$  /$$$$$$$   /$$$$$$ | $$| $$| $$
| $$$$$$$$| $$| $$       /$$__  $$ /$$__  $$| $$__  $$ /$$__  $$| $$| $$| $$
| $$__  $$| $$| $$      | $$  | $$| $$  \ $$| $$  \ $$| $$$$$$$$|__/|__/|__/
| $$  | $$| $$| $$      | $$  | $$| $$  | $$| $$  | $$| $$_____/            
| $$  | $$| $$| $$      |  $$$$$$$|  $$$$$$/| $$  | $$|  $$$$$$$ /$$ /$$ /$$
|__/  |__/|__/|__/       \_______/ \______/ |__/  |__/ \_______/|__/|__/|__/

'




