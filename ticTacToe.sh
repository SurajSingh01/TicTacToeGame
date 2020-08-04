
#!/bin/bash -x
echo "Welcome to Tic Tac Toe Game"

declare -a board
# Initialization of variables
count=0
function reset()
{
	board=(. . . . . . . . .)
	player=1
	gameStatus=1
	echo "--------------------"
	echo "Game is being Reset"
	echo "--------------------"
}

function printBoard()
{
	for place in {1..9}
	do
		board[ (( count++ )) ]=$place
	done
	echo "${board[0]} | ${board[1]} | ${board[2]}"
	echo "----------"
	echo "${board[3]} | ${board[4]} | ${board[5]}"
	echo "----------"
	echo "${board[6]} | ${board[7]} | ${board[8]}"
}

reset
echo "The board is :"
printBoard

flip=$(( RANDOM % 2 ))
if [ $flip -eq 1 ]
then
	printf "It is your turn \nEnter your choice "
	read choice
	echo "Your choice is $choice"
else
	echo "It is computer turn"
	option=$(( RANDOM % 2 ))
	if [ $option -eq 1 ]
	then
		echo "Computer choses X"
	else
		echo "Computer choses O"
	fi
fi

