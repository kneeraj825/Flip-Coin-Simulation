!/bin/bash -x

#constant
ISFLIP=0
DOUBLET=2

# dictionar to store doublet combination of flip coin
declare -A doubletFlip
#taking user input for number of coin flips
read -p "Enter the Number of Coin Flip : " numberOfCoinFlip

#storing combine value in dictionary
function coinFlip()
{
	local NUMBER_OF_COIN=$1
	for(( flip=0; flip<$numberOfCoinFlip; flip++ ))
	do
		for(( coin=0; coin<$NUMBER_OF_COIN; coin++ ))
		do
			randomFlip=$(( RANDOM % 2 ))
			if (($randomFlip == $ISFLIP ))
			then
				echo "H"
				coinSide+=H
			else
				echo "T"
				coinSide+=T
			fi
		done
				((doubletFlip[$coinSide]++))
				coinSide=""
	done
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
coinFlip $DOUBLET
echo ${!doubletFlip[@]}
#echo ${doubletFlip[@]}
result1=$(calculatePercentage $numberOfCoinFlip)
#echo "percentage:$result1"



