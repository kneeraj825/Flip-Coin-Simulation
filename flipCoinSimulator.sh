#!/bin/bash -x

echo Welcome
#checking the coin flip is either heads or tails
ISHEAD=1
coinCheck=$(( RANDOM%2 ))
if (( $ISHEAD == $coinCheck ))
then
	echo "Heads"
else
	echo "Tails"
fi
