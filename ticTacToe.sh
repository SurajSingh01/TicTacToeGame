
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

function winningCheck()
{
	symbol=$1
	winner=$2
	winningPosition
	if [[ ${board[$1] == $symbol && ${board[$2] == symbol && ${board[$3]== $symbol ]]
	then
		echo "-----------Winner is $winner -------------"
		exit
	fi

#These are the winnig position
function winningPosition ()
{
	winningCheck 0 1 2
	winningCheck 3 4 5
	winningCheck 6 7 8
	winningCheck 0 3 6
	winningCheck 1 4 7
	winningCheck 2 5 8
	winningCheck 0 4 8
	winningCheck 2 4 5
}

function playerPlay()
{
	echo "---------Player Chance----------"
	win="player"
	printBoard
	echo "Enter position where you want to put symbol: "
	read -p playerPosition
	if [ ${board[$playerPosition]} ="." ]
	then
		if [ $playerPosition >=0 -a $playerPosition <=8 ]
		then
			board[$playerPosition]=$playerSymbol
			printBoard
			winningCheck $playerSymbol $win
	#		matchTie
		else
			echo "Invalid player position"
		fi
	else
		echo "Position already occupied"
	fi
}

function computerPlay()
{
	echo "--------Compter play---------"
	win2="Computer"
	computerPosition=$(( RANDOM % 8 ))
	if [[ ${board[$computerPosition]} ="." ]]
	then
		board[$computerPosition]=$computerSymbol
		printBoard
		winningCheck $systemSymbol $win2
	#else
	else
		computerPlay
	fi
}

gameStart() 
{
	if [$flip -eq $player]
	then
		playerPlay
		echo "-------------------"
		computerPlay
	else
		computerPlay
		echo "-------------------"
		playerPlay
	fi
}
gameStart
