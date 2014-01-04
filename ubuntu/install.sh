#!/bin/bash

# - Install Misc
installMisc() {
    echo "Start installing Misc tools..." 
    sudo apt-get install curl
    sudo apt-get install openssh-server
    sudo apt-get install vim
    echo "Misc tools installed successfully!" 
}

# - Install zsh
installZsh() {
    echo "Start installing zsh..." 
    sudo apt-get install zsh
    # - Enhance
    wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh 
    # - Set zsh as default shell
    chsh -s /bin/zsh
    echo "zsh installed successfully!" 
}

# - Install git
installGit() {
    echo "Start installing git..." 
    sudo apt-get install git-core
    echo "Git installed successfully!" 
}


# - Update apt-get
sudo apt-get update
sudo apt-get upgrade

read -p "Ready to install?" RESP
if ["$RESP" = "y"]; then
    echo ">>>>>>>>>>>>Now begin!"
    #installGit
    #installZsh
    #installMisc
    #installNode
else
    echo "Abort installation!"
fi
