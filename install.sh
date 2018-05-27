#!/bin/bash
SCRIPT_BASE="$( cd -P "$( dirname "$0" )" && pwd )"

brew install $(cat ./homebrew/brew)

# TODO: check if not in zsh already in ${SHELL}

ZSH=$(which zsh)
chsh -s ${ZSH}
sudo chsh -s ${ZSH}

SYMLINKS=( vim/vimrc tmux/tmux.conf zsh/zshrc git/.gitconfig)
for SYMLINK in ${SYMLINKS}; do
    CURRENT=${SCRIPT_BASE}/${SYMLINK}
    BASENAME=$(basename ${CURRENT})
    echo "ln -sf ${CURRENT} ~/.${BASENAME}"
done

# Initialize vim

vim -c 'qa!'
