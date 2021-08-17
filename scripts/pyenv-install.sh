#!/usr/bin/bash


git clone https://github.com/pyenv/pyenv.git ~/.pyenv &&
cd ~/.pyenv && src/configure && make -C src &&
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.profile &&
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.profile &&
echo 'eval "$(pyenv init --path)"' >> ~/.profile
