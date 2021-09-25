#!/bin/sh

testPath="${HOME}/test"
listPath="${HOME}/test/list"
linksPath="${HOME}/test/links"

#1
cd $HOME && mkdir test 2> /dev/null && cd test && touch list 2> /dev/null
#2
cd $HOME/Desktop/test && ls -aFG > $listPath
#3
ls -d /etc/* | wc -l >> $listPath
sudo find /etc/ -name ".*" | wc -l >> $listPath
#4
mkdir $testPath/links 2> /dev/null
#5
cd $testPath/links
ln $listPath list_hlink 2> /dev/null
#6
ln -s $listPath list_slink 2> /dev/null
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
#12
#13
listConfPath=$HOME/list_conf
sudo find /etc/ -iname "*.conf" > $listConfPath
#14
listdPath=$HOME/list_d
sudo find /etc/ -d -iname "*.d" > $listdPath
#15
listConfDPath=$HOME/list_conf_d
cat $listConfPath >> $listConfDPath && cat $listdPath >> $listConfDPath
