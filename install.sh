#!/bin/bash
SCRIPT_BASE="$( cd -P "$( dirname "$0" )" && pwd )"

if [[ ! -f ~/.envvars.rc ]]; then
    echo "export DOTFILESDIR=${SCRIPT_BASE}" > ~/.envvars.rc
fi


brew install $(cat ./homebrew/brew)

if [[ "$(basename ${SHELL})" != "zsh" ]]; then
  ZSH=$(which zsh)
  chsh -s ${ZSH}
  sudo chsh -s ${ZSH}
fi

SYMLINKS=( vim/vimrc tmux/tmux.conf zsh/zshrc git/.gitconfig)
for SYMLINK in ${SYMLINKS}; do
    CURRENT=${SCRIPT_BASE}/${SYMLINK}
    BASENAME=$(basename ${CURRENT})
    ln -sf ${CURRENT} ~/.${BASENAME}
done

echo ln -sf ${SCRIPT_BASE}/bin ~/bin

# Initialize vim

vim -c 'qa!'
