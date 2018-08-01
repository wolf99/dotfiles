#!/usr/bin/env bash

# get current dir (so run this script from anywhere)
export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}")" && pwd)"

#Update dotiles itself first
git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master

# bunch of symlinks
ln -sfv "$DOTFILES/.bash_profile" ~
ln -sfv "$DOTFILES/.inputrc" ~
ln -sfv "$DOTFILES/.bash_aliases" ~
ln -sfv "$DOTFILES/.gitconfig" ~
ln -sfv "$DOTFILES/.nanorc" ~
ln -sfv "$DOTFILES/.vimrc" ~

