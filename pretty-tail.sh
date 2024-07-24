#!/bin/zsh
tail -f $1 | sed 's/\\n/\n/g'
