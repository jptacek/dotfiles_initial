# Atom.io install repo add
sudo add-apt-repository ppa:webupd8team/atom


# Update packages
sudo apt-get update

# Node.JS setup
sudo apt-get install nodejs
sudo apt-get install npm

# Create a symbolic link for node
sudo ln -s /usr/bing/nodejs /usr/bin/node

# git
sudo apt-get install git

# Configure Global git
git config --global user.name "John Ptacek"
git config --global user.email "jptacek@gmail.com"

# Atom.io install
sudo apt-get install atom

# atom.io packages
apm install jshint
apm install react
apm install angularjs
apm install atom-beautify
apm install atom-typescript #type script editor
apm install linter #base linter
apm install editor-config #coding styles across editors
apm install file-icons #UX icons
apm install minimap

# Ruby install for SASS
sudo apt-get install ruby-full
sudo su -c "gem install sass"

# install NPM Packages that are used globally
sudo npm install -g docpad
sudo npm install -g gulp
sudo npm install -g angular-cli # Angular CLI tools
sudo npm install -g react-cli react # React CLI
sudo npm install -g azure-cli  #Anzure CLI tools
