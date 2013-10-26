# Python
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=/usr/local:$PATH
# /Library/Frameworks/Python.framework/Versions/2.7/bin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH
export PATH=$HOME/.cabal/bin:$PATH

# Python Configuration
export PYTHONSTARTUP=$HOME/.pythonrc.py # Mighty python config

# Virtualenv configuration
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv

export VIRTUALENV_DISTRIBUTE=1 # Enable --distribute by default
export WORKON_HOME=~/.virtualenvs # Virtualenvs projects
mkdir -p $WORKON_HOME 
[ `which virtualenvwrapper.sh` ] && . virtualenvwrapper.sh
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python # Use homebrewed python
