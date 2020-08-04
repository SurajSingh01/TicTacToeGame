
#!/bin/bash -x
echo "Welcome to Tic Tac Toe Game"
declare -a board
flag=1
player=1
system=0

#Reset the board
function reset()
{
	board=(. . . . . . . . .)
	player=1
	gameStatus=1
	echo "--------------------"
	echo "Game is being Reset"
	echo "--------------------"
}

#print the board
function printBoard()
{

	echo "${board[0]} | ${board[1]} | ${board[2]}"
	echo "---------"
	echo "${board[3]} | ${board[4]} | ${board[5]}"
	echo "---------"
	echo "${board[6]} | ${board[7]} | ${board[8]}"
}


reset
#echo "The board is :"
#printBoard

#Selecting from  'Ó' or 'X' by the player and computer
function symbolAssigning()
{
	flip=$(( RANDOM % 2 ))
	if [ $flip -eq 1 ]
	then
		printf "It is your turn \nEnter your choice from ( O / X )"
		read playerSymbol
		if [ "$playerSymbol" == "O" ]
		then
			computerSymbol="X"
		else
			computerSymbol="O"
		fi
	else
		echo "It is computer turn"
		option=$(( RANDOM % 2 ))
		if [ $option -eq 1 ]
		then
			computerSymbol="X"
			playerSymbol="O"
		else
			computerSymbol="O"
			playerSymbol="X"
	fi
fi
}
symbolAssigning
echo "Computer choses = $computerSymbol"
echo "Player choses = $playerSymbol"

#Assign the symbol at required position
while (( flag >= 1 ))
do
	if [ $flip -eq $player ]
	then
		printBoard
		echo "please enter position (from 0 to 8) where u want to put symbol: "
		read playerPosition
		board[$playerPosition]=$playerSymbol
		printBoard
	else
		computerPosition=$(( RANDOM % 9 + 1 ))
		board[$computerPosition]=$computerSymbol
		printBoard
	fi
	flag=0
done
