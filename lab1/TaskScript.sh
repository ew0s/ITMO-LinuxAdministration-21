#!/bin/sh

listPath="${HOME}/test/list"

#1
cd $HOME && mkdir test && cd test && touch list
#2
cd $HOME/Desktop/test && ls -aFG > $listPath
#3
ls -d /etc/* | wc -l >> $listPath
find /etc -name ".*" | wc -l >> $listPath

