# OSX
# brew install gawk
# brew install tmux
# brew install tig
# brew install vim --with-lua --with-override=system-vi --with-python
# brew install thefuck
# brew install bat # enhance cat command
# brew install prettyping # enhance ping command
# brew install fzf # replace Ctrl+R
# brew install diff-so-fancy # work with git
# brew install fd # enhance find command
# brew install ncdu # enhance du -sh
# brew install tldr # TL;DR replace man command

# zsh plugins:
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# tmux plugins manager
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

set -ex

dotfiles=(".zshrc" ".vimrc" ".gitconfig" ".gitmessage" ".tmux.conf" ".myclirc")

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
