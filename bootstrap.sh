#!/usr/bin/env bash

# installed following this tutorial:
## https://gorails.com/setup/ubuntu/14.04

# install ruby dependencies
sudo apt-get update
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties -y

# install rbenv
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
# apply changes to shell environment
# MAY NOT NEED TO DO THIS
exec $SHELL

# install ruby-build
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

# install ruby
rbenv install 2.1.3
rbenv global 2.1.3

# instruct rubygems NOT to install documentation for each package locally
echo "gem: --no-ri --no-rdoc" > ~/.gemrc

# Rails depends on nodejs for features such as the Asset Pipeline
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install nodejs -y

# install rails
gem install rails
rbenv rehash

# install postgresql
sudo apt-get update
sudo apt-get install postgresql -y

# install developer tools
## bundler, Rspec, bower, ...
