#!/bin/bash -x
echo "welcome to gambler"

STAKE=100
BET=1
PERCENT=50
WIN=150
LOSS=50
read -p "enter cash" cash
function bet(){
result=$((RANDOM%2))
if [ $result -eq 1 ]
then
	$((cash+=$BET))
	echo $cash
else
	$((cash-=$BET))
	echo $cash
fi
}
bet
function playing(){
while [[ $cash -gt $LOSS && $cash -lt $WIN ]]
do
	bet
done
}
