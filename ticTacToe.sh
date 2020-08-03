
#!/bin/bash -x
echo "Welcome to Tic Tac Toe Game"

function reset()
{
	Array=(. . . . . . . . .)
	player=1
	gameStatus=1
	echo "--------------------"
	echo "Game is being Reset"
	echo "--------------------"
}

function board()
{
	echo "  0 1 2"
	echo "0 ${Array[0]} ${Array[1]} ${Array[2]}"
	echo "0 ${Array[0]} ${Array[1]} ${Array[2]}"
	echo "0 ${Array[0]} ${Array[1]} ${Array[2]}"
}

reset
echo "The board is :"
board

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

