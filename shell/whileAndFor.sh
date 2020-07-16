#!/bin/bash

# while read peer line usually add a file 
# for .. in usually add some command

while read var1 var2
do
	echo $var1 " " $var2
done < whileAndFor.txt

for i in $(ls)
do
	echo $i
done
