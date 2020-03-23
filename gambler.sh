#!/bin/bash -x
echo "welcome to gambler"
declare -A record
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
	echo "$amountWon"
else
	((cash-=$BET))
	((amountLoss+=$BET))
	echo "$amountLoss"
fi
}
function playing(){
for  (( i=1; i<=20; i++ ))
do
	cash=$STAKE
	while [[ $cash -ne $LOSS && $cash -ne $WIN ]]
	do
		bet
	done
done

}
playing 
echo "amount won : $amountWon"
echo "amount lost : $amountLoss"
