#!/bin/bash -x

echo Welcome
#checking the coin flip is either heads or tails
read -p "Enter the number you want to flip the coin:" number
#declareing a dictionary to store the count
declare -A coin
ISHEAD=1
heads=0
tails=0
for (( count=0; count<number; count++))
do
	coinCheck=$(( RANDOM%2 ))
	if (( $ISHEAD == $coinCheck ))
	then
		echo "Heads"
		coin[$count]=H
		((heads++))
	else
		echo "Tails"
		coin[$count]=T
		((tails++))
fi
done
echo "heads-$heads"
echo "tails-$tails"
echo ${coin[@]}
#calculating the percentage of heads and tails
percentageOfHeads=`echo "scale=4;$heads/$number*100" | bc`"%"
echo "pecentage of heads is: $percentageOfHeads"
percentageOfTails=`echo "scale=4;$tails/$number*100" | bc`"%"
echo "pecentage of tails is: $percentageOfTails"
