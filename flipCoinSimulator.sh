#!/bin/bash -x

#constant
ISFLIP=0
SINGLET=1
DOUBLET=2
TRIPLET=3

#dictionar to store doublet combination of flip coin
declare -A doubletFlip
#taking user input for number of coin flips
read -p "Enter the Number of Coin Flip : " numberOfFlip
#storing combine value in dictionary
function coinFlip()
{
	numberOfCoinFlip=$1
	local NUMBER_OF_COIN=$2
	for(( flip=0; flip<$numberOfCoinFlip; flip++ ))
	do
		for(( coin=0; coin<$NUMBER_OF_COIN; coin++ ))
		do
			randomFlip=$(( RANDOM % 2 ))
			if (($randomFlip == $ISFLIP ))
			then
				coinSide+=H
			else
				coinSide+=T
			fi
		done
		((doubletFlip[$coinSide]++))
		coinSide=""
    done
}
function sorting() {
	for k in ${!doubletFlip[@]}
	do
		echo $k '-' ${doubletFlip[$k]}
	done |
	sort -rn -k3
}

#calculating percentage 
function calculatePercentage()
{
	local NUMBER_OF_COIN=$1
	for countOfIndex in ${!doubletFlip[@]}
	do
		doubletFlip[$countOfIndex]=`echo "scale=2; ${doubletFlip[$countOfIndex]}/$numberOfCoinFlip*100" | bc`
	done
	echo ${doubletFlip[@]}
}
coinFlip $numberOfFlip $SINGLET
coinFlip $numberOfFlip $DOUBLET
coinFlip $numberOfFlip $TRIPLET
echo ${!doubletFlip[@]}
echo ${doubletFlip[@]}
result1=$(calculatePercentage $numberOfCoinFlip)
echo "percentage:$result1"
echo "$(sorting)"
echo "Winner is:-  $(sorting | head -1)"

