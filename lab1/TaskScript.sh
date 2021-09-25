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
#8
wc -l < $listPath >> list_hlink
#9
difference=$(diff list_hlink list_slink 2> /dev/null)
if [[ "$?" = "0" ]]; then
    if [[ $difference = "" ]]; then
        echo "YES"
    fi
fi
#10
mv $listPath $testPath/list1
#11
difference=$(diff list_hlink list_slink 2> /dev/null)
if [[ "$?" = "0" ]]; then
    if [[ $difference = "" ]]; then
        echo "YES"
    fi
fi
