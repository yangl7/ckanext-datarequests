#!/bin/sh -e

export PATH=/var/lib/jenkins/.pyenv/shims:/var/lib/jenkins/.linuxbrew/bin:/usr/bin:/bin:/usr/sbin:/sbin
python setup.py nosetests
