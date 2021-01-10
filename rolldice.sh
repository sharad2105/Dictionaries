#!/bin/bash -x
declare -A dice
for (( i=0; i<=dice; i++))
do

	dice[$i]=$(($RANDOM%6+1))
	echo "$dice"
done
echo ${dice[@]}
echo ${!dice[@]}
