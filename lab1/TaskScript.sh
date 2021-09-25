#!/bin/sh

testPath="${HOME}/test/list"

#1
cd $HOME && mkdir test && cd test && touch list
#2
cd $HOME/Desktop/test && ls -aFG > $testPath
#3
