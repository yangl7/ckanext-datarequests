#!/bin/sh -e
pyenv versions
~/.linuxbrew/bin/pyenv shell ckan-2.8.1
python setup.py nosetests
