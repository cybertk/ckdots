export PYENV_ROOT=$HOME/projects/pyenv
export PATH=$PYENV_ROOT/bin:$PATH

if command -v pyenv 1>/dev/null 2>&1;
then
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
fi
