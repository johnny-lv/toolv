# - Update apt-get
sudo apt-get update
sudo apt-get upgrade

installZSH();
installGit();


## Install zsh
function installZSH() {
  echo "## Start installing zsh..."
  sudo apt-get install zsh
  wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh 
  # - Set zsh as default shell
  chsh -s /bin/zsh
  echo "## Installed successfully."
}

## Install git
function installGit() {
  echo "## Start installing git..."
  sudo apt-get install git
  echo "## Installed successfully."
}
