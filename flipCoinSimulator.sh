#!/bin/bash -x

#constant
ISFLIP=0
TRIPLET=3

# dictionary to store triplet combination of flip coin
declare -A tripletFlip
#taking user input for number of coin flips
read -p "Enter the Number of Coin Flip : " numberOfCoinFlip

#storing the combine value in dictionary
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
            coinSide+=H
         else
            coinSide+=T
         fi
      done
            ((tripletFlip[$coinSide]++))
            coinSide=""
   done
}

#calculating percentage 
function calculatePercentage()
{
  # local NUMBER_OF_COIN=$1
   for countOfIndex in ${!tripletFlip[@]}
   do
      tripletFlip[$countOfIndex]=`echo "scale=2; ${tripletFlip[$countOfIndex]}/$numberOfCoinFlip*100" | bc`
   done
      echo ${tripletFlip[@]}
}
coinFlip $TRIPLET
echo ${!tripletFlip[@]}
echo ${tripletFlip[@]}
result=$(calculatePercentage $numberOfCoinFlip)


