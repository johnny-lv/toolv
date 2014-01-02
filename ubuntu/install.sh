#!/bin/sh
# - Update apt-get
#sudo apt-get update
#sudo apt-get upgrade


## Install zsh
installZsh() {
  echo "## Start installing zsh..."
  sudo apt-get install zsh
  wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh 
  # - Set zsh as default shell
  chsh -s /bin/zsh
  echo "## Installed successfully."
}

## Install git
installGit() {
  echo "## Start installing git..."
  sudo apt-get install git
  echo "## Installed successfully."
}


installZsh
installGit
