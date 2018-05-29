#!/usr/bin/env bash

# install list:
# brew install tmux
# brew install tig
# brew install vim --with-lua --with-override=system-vi
# brew install ctags-exuberant
# brew link --overwrite ctags

# set -e
# set -x

dotfiles=(".zshrc" ".vimrc" ".gitconfig" ".gitmessage" ".tmux.conf")

create_symlinks() {
  for file in "${dotfiles[@]}"
  do
    ln -sf ${PWD}/${file} ${HOME}/${file}
    echo link ${PWD}/${file} ${HOME}/${file}
  done
}

remove_symlinks() {
  for file in "${dotfiles[@]}"
  do
    unlink ${HOME}/${file}
    echo unlink ${HOME}/${file}
  done
}

if [ "$1" = "i" ]; then
  create_symlinks
fi

if [ "$1" = "u" ]; then
  remove_symlinks
fi
