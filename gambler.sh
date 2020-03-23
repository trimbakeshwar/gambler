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
function bet(){
result=$((RANDOM%2))
if [ $result -eq 1 ]
then
	((cash+=$BET))
	((amountWon+=$BET))

else
	((cash-=$BET))
	((amountLoss+=$BET))
fi
}
function playing(){
max=0
min=0
LukestDay=0
badDay=0
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
if [ $max -lt ${recordWon[$i]} ]
then
   max=${recordWon[$i]}
   LukestDay=$i
fi
if [ $min -lt ${recordLoss[$i]} ]
then
   min=${recordLoss[$i]}
   badDay=$i
fi
done
}

while true
do
	read -p  "press 1 For continue 0 For exit" choice
	if [[ $choice == 1 ]]
	then
		playing
	fi
		echo "won ${!recordWon[@]}	${recordWon[@]}"
		echo "loss ${!recordLoss[@]} ${recordLoss[@]}"
		echo "max amount win $max"
		echo "max amount win on the day $LukestDay"
		echo "max amount loss $min"
		echo "max amount loss on the day $badDay"
if [[ $choice == 0 ]]
	then
		break
	fi
done
