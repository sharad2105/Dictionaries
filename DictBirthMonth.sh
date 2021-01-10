#!/bin/bash -x
count=0
declare -A birth
getBirthYear ()
{
	echo $((RANDOM%2+92))
}
getBirthMonth ()
{
	echo $((RANDOM%12+1))
}

storeInDict ()
{
	birthMonth=$1
	birthYear=$2
	
	value="$birthMonth-$birthYear"

	birth[$birthMonth]="${birth[$birthMonth]} $value"
}
printBirthMonth ( )
{
	for (( i=1; i<=12; i++ ))
	do
		echo ${birth[$i]}
	done
}

birthMonthMain ( )
{
	while [ $count -ne 50 ]
	do
		birthYear=$(getBirthYear)
		birthMonth=$(getBirthMonth)
		storeInDict $birthMonth $birthYear
	((count++))
	done
 printBirthMonth
}
birthMonthMain
