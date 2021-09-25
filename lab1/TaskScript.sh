#!/bin/sh

testPath="${HOME}/test"
listPath="${HOME}/test/list"
linksPath="${HOME}/test/links"

#1
cd $HOME && mkdir test 2> /dev/null && cd test && touch list 2> /dev/null

#2
cd $HOME/test && ls -aFG > $listPath

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
if diff list_hlink list_slink 2> /dev/null; then
	echo "YES"
fi

#10
mv $listPath $testPath/list1

#11
if diff list_hlink list_slink 2> /dev/null; then
	echo "YES"
fi

#12

#13
listConfPath=$HOME/list_conf
sudo find /etc/ -iname "*.conf" > $listConfPath

#14
listdPath=$HOME/list_d
sudo find /etc/ -iname "*.d" > $listdPath

#15
listConfDPath=$HOME/list_conf_d
cat $listConfPath >> $listConfDPath && cat $listdPath >> $listConfDPath

#16
cd $testPath
mkdir .sub

#17
cp ~/list_conf_d ~/test/.sub

#18
rsync ~/list_conf_d ~/test/.sub

#19
ls -l ~/test

#20
man man > ~/man.txt

#21
split -b 1k  ~/man.txt

#22
mkdir ~/test/man.dir

#23
mv ~/x* ~/test/man.dir

#24
cat ~/test/man.dir/x* > ~/test/man.dir/man.txt

#25
if diff ~/man.txt ~/test/man.dir/man.txt; then
	echo "YES"
fi

#26
sed -i -e '1 s/^/string1\n/;' ~/man.txt
sed -i -e '1 s/^/string2\n/;' ~/man.txt
echo "string-2" >> ~/man.txt
echo "string-1" >> ~/man.txt

#27
diff -u ~/man.txt ~/test/man.dir/man.txt > ~/filesdiff.txt

#28
mv ~/filesdiff.txt ~/test/man.dir

#29
patch ~/test/man.dir/man.txt ~/test/man.dir/filesdiff.txt

#30
if diff ~/man.txt ~/test/man.dir/man.txt; then
	echo "YES"
fi

