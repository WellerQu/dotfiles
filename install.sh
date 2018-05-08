#!/usr/bin/env bash

set -e
set -x

dotfiles=(".zshrc" ".vimrc" ".gitconfig")

create_symlinks() {
  for file in "${dotfiles[@]}"
  do
    ln -sf ${PWD}/${file} ${HOME}/${file}
    echo ${PWD}/${file} ${HOME}/${file}
  done
}

remove_symlinks() {
  for file in "${dotfiles[@]}"
  do
    unlink ${HOME}/${file}
    echo ${HOME}/${file}
  done
}

if [ "$1" = "i" ]; then
  create_symlinks
fi

if [ "$1" = "u" ]; then
  remove_symlinks
fi
