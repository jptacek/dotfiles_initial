# Atom.io install repo add
sudo add-apt-repository ppa:webupd8team/atom


# Update packages
sudo apt-get update

# Node.JS setup
sudo apt-get install nodejs
sudo apt-get install npm

# Set permissions
#   http://www.competa.com/blog/how-to-run-npm-without-sudo/
#   

# git
sudo apt-get install git

# Configure Global git
git config --global user.name "John Ptacek"
git config --global user.email "jptacek@gmail.com"


# AWS CLI Setup
#    http://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb-cli3-install-linux.html
#
curl -O https://bootstrap.pypa.io/get-pip.py
python3 get-pip.py --user
pip install awsebcli --upgrade --user

# Azure CLI Setup
curl -L https://aka.ms/InstallAzureCLi | bash

#SSH setup
sudo apt-get install openssh-server
sudo ufw allow 22 #Change default port from 22

# Install fortune
sudo apt-get install fortune

# Install Go 
#  https://golang.org/doc/install

# Ruby install for SASS
sudo apt-get install ruby-full
sudo su -c "gem install sass"

# install NPM Packages that are used globally
npm install -g docpad
npm install -g gulp
npm install -g react-cli react # React CLI
npm install -g azure-cli  #Anzure CLI tools
