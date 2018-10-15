#!/bin/sh -e
pyenv versions
whoami
sudo su -s /bin/bash jenkins 
~/.linuxbrew/bin/pyenv shell ckan-2.8.1
python setup.py nosetests
