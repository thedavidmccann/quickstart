#!/bin/bash
# Bootstrap a new goddamn Mac
mkdir -p ~/.bash_profile.d
mkdir -p ~/Documents/Dev/Projects
mv ../quickstart ~/Documents/Dev/Projects

mkdir -p ~/Documents/Dev/Environment
ln -s ~/Documents/Dev/Projects/quickstart/cheatsheets ~/Documents/cheatsheets
ln -s ~/Documents/Dev/Projects/quickstart/BashFu ~/Documents/Dev/Projects/BashFu 

# dotfiles
ln -sf ~/Documents/Dev/Projects/quickstart/bash_profile ~/.bash_profile
ln -sf ~/Documents/Dev/Projects/quickstart/vimrc ~/.vimrc
ln -sf ~/Documents/Dev/Projects/quickstart/gitconfig ~/.gitconfig
ln -sf ~/Documents/Dev/Projects/quickstart/gitignore ~/.gitignore
ln -sf ~/Documents/Dev/Projects/quickstart/tigrc ~/.tigrc
cp .git-completion.bash ~/
source ~/.bash_profile

echo "Email?"
read email
git config --global user.email "$email"

