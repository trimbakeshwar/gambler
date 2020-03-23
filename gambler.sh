#!/bin/bash -x
echo "welcome to gambler"
declare -A recordWon
STAKE=100
BET=10
PERCENT=50
WIN=150
LOSS=50
day=2
cash=$STAKE
max=0
min=0
LukestDay=0
badDay=0
function bet(){
result=$((RANDOM%2))
if [ $result -eq 1 ]
then
	((cash+=$BET))
	((amountWon+=$BET))
#	echo "$amountWon"
else
	((cash-=$BET))
	((amountLoss+=$BET))
#	echo "$amountLoss"
fi
}
function playing(){
for  (( i=1; i<=20; i++ ))
do	
	amountWon=0
	amountLoss=0
	cash=$STAKE
	while [[ $cash -ne $LOSS && $cash -ne $WIN ]]
	do
		bet
	done

recordWon[$i]=$amountWon
recordLoss[$i]=$amountLoss
done
}
playing 

echo "won ${!recordWon[@]}	${recordWon[@]}"
echo "loss ${!recordLoss[@]} ${recordLoss[@]}"
