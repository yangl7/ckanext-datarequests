#!/bin/sh -e
eval "$(~/.linuxbrew/bin/pyenv init -)"
~/.linuxbrew/bin/pyenv shell ckan-2.8.1
python setup.py nosetests
