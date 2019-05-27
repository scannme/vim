#!/bin/sh

sudo -s cp vimrc ~/.vimrc
sudo -s cp ctags /usr/bin/
sudo -s cp cscope /usr/bin/
sudo -s cp cscope-indexer /usr/bin/
mkdir ~/.vim
sudo -s cp doc/ ~/.vim/ -R
sudo -s cp plugin/ ~/.vim/ -R

