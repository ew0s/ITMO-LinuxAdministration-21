#!/bin/sh

testPath="${HOME}/test"
listPath="${HOME}/test/list"

#1
cd $HOME && mkdir test && cd test && touch list
#2
cd $HOME/Desktop/test && ls -aFG > $listPath
#3
ls -d /etc/* | wc -l >> $listPath
find /etc -name ".*" | wc -l >> $listPath
#4
mkdir $testPath/links
#5
cd $testPath/links
ln $listPath list_hlink
#6
ln -s $listPath list_slink
#7
ls -li list_hlink
ls -li $listPath
ls -li list_slink

