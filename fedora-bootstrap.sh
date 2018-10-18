#!/bin/bash
set -e


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

function installing() {
 logger "Installing $1" && \
   sudo dnf install -y $1
}

logger "Adding golang, docker, spotify, vscode repos"
sudo dnf config-manager --add-repo=http://negativo17.org/repos/fedora-spotify.repo && \
  sudo dnf config-manager --add-repo=https://download.docker.com/linux/fedora/docker-ce.repo && \
  sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc && \
  sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo' && \
  sudo wget "https://mirror.go-repo.io/fedora/go-repo.repo" -O /etc/yum.repos.d/go-repo.repo


PACKAGES="golang.x86_64 code.x86_64 spotify-client.x86_64 docker-ce.x86_64
          htop.x86_64 mlocate.x86_64 neovim.x86_64 ctags.x86_64 wireshark.x86_64
          unzip.x86_64 strace.x86_64 ruby.x86_64 rubygem-bundler.noarch python2-pip.noarch
          conky.x86_64 git.x86_64 neovim.x86_64 atom.x86_64 jq.x86_64 java-1.8.0-openjdk.x86_64
          screenfetch.noarch gnome-tweaks.noarch git.x86_64"


logger "Installing latest & greatest..."

for i in $PACKAGES; do installing $i; done

logger "Installing bash git prompt" && \
  mkdir -p ~/env/bash-git && \
  git clone https://github.com/magicmonty/bash-git-prompt ~/env/bash-git && \
  logger "Installing Vundle" && \
  mkdir -p ~/.vim/bundle/ && \
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && \
  logger "Installing nvm (node)" && \
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash && \
  logger "Installing awscli" && \
  pip install --user awscli && \
  logger "Getting terraform" && \
  wget "https://releases.hashicorp.com/terraform/0.11.8/terraform_0.11.8_linux_amd64.zip" -O /tmp/terraform.zip && \
  sudo unzip /tmp/terraform.zip -d /usr/local/sbin/terraform && chmod +x /usr/local/sbin/terraform && \
  logger "Getting packer" && \
  wget "https://releases.hashicorp.com/packer/1.3.1/packer_1.3.1_linux_amd64.zip" -O /tmp/packer.zip && \
  sudo unzip /tmp/packer.zip -d /usr/local/sbin/ && chmod +x /usr/local/sbin/packer && \
  logger "Getting rustup" && \
  curl https://sh.rustup.rs -sSf | sh


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
