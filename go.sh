#!/bin/bash
# Bootstrap a new goddamn Mac

mkdir -p ~/Documents/Dev/Projects
mkdir ~/Documents/Dev/Environment
ln -s ~/Documents/Dev/Projects/quickstart/cheatsheets ~/Documents/cheatsheets
ln -s ~/Documents/Dev/Projects/quickstart/BashFu ~/Documents/Dev/Projects/BashFu 
mv bash_profile ~/.bash_profile
source ~/.bash_profile

# https://wincent.com/wiki/Git_quickstart
git config --global user.name "David McCann"
echo "Email?"
read email
git config --global user.email "$email"
git config --global color.ui auto

# shortcut aliases
git config --global alias.st status
git config --global alias.ci commit
git config --global alias.co checkout

# lata!
mv ../quickstart ~/Documents/Dev/Projects/
