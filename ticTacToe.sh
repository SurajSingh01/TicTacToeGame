
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

reset

flip=$(( RANDOM % 2 ))
if [ $flip -eq 1 ]
then
	echo "It is your turn"
else
	echo "It is computer turn"
fi

