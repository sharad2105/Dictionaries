#!/bin/bash 

declare -A dict
dict[1]=0
dict[2]=0
dict[3]=0
dict[4]=0
dict[5]=0
dict[6]=0

min=11
max=-1
secondMin=0

getDieNumber ( )
{
	value=$(( RANDOM%6+1 ))
	#echo "Random Result is" $value
	storeInDict $value
}

storeInDict ( )
{
	key=$1
	dict[$key]=$(( ${dict[$key]} + 1 ))
}

getMaxMin ( )
{
	for (( i=1; i<=${#dict[@]}; i++ ))
	do
		if [ ${dict[$i]} -lt $min ]
			then
				secondMin=$min
				min=${dict[$i]}
		elif [[ ${dict[$i]} -lt $secondMin &&  ${dict[$i]} -ne $min ]]
			then
				secondMin=${dict[$i]}
		fi
		
		if [ ${dict[$i]} -gt $max ]
		then
			max=${dict[$i]}
		fi
	done
}

rollDieMain ()
{
	while [[ ${dict[1]} -ne 10 && ${dict[2]} -ne 10 && ${dict[3]} -ne 10 && ${dict[4]} -ne 10 && ${dict[5]} -ne 10 && ${dict[6]} -ne 10 ]]
	do
		getDieNumber
	done
	getMaxMin

}

rollDieMain
echo "All key in dictionary: " ${!dict[@]}
echo "All elements in dictionary :" ${dict[@]}
echo "Minimum value: " $min
echo "Second Minimum value :" $secondMin
echo "Maximum value :" $max
