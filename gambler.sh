#!/bin/bash -x
echo "welcome to gambler"

STAKE=100
BET=1

function bet(){
result=$((RANDOM%2))
if [ $result -eq 1 ]
then
	cash+=$BET
	echo "win"
else
	cash-=$BET
	echo "loss"
fi
}
bet
