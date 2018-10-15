#!/bin/sh -e

~/.linuxbrew/bin/pyenv shell ckan-2.8.1
python setup.py nosetests
