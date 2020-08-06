
#!/bin/bash -x
echo "Welcome to Tic Tac Toe Game"
declare -a board
flag=1
player=1
computer=0

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



#Selecting from  'O' or 'X' by the player and computer
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

winningCheck() {
		symbol=$1
		winner=$2
		if [[ ${board[0]} == $symbol && ${board[1]} == $symbol && ${board[2]} == $symbol ]]
		then
			echo "==================$winner is winner================="
			exit
		elif [[ ${board[3]} == $symbol && ${board[4]} == $symbol && ${board[5]} == $symbol ]]
		then
			echo "==================$winner is winner================="
			exit
		elif [[ ${board[6]} == $symbol && ${board[7]} == $symbol && ${board[8]} == $symbol ]]
		then
			echo "==================$winner is winner================="
			exit
		elif [[ ${board[0]} == $symbol && ${board[3]} == $symbol && ${board[6]} == $symbol ]]
		then
			echo "==================$winner is winner================="
			exit
		elif [[ ${board[1]} == $symbol && ${board[4]} == $symbol && ${board[7]} == $symbol ]]
		then
			echo "==================$winner is winner================="
			exit
		elif [[ ${board[2]} == $symbol && ${board[5]} == $symbol && ${board[8]} == $symbol ]]
		then
			echo "==================$winner is winner================="
			exit
		elif [[ ${board[0]} == $symbol && ${board[4]} == $symbol && ${board[8]} == $symbol ]]
		then
			echo "==================$winner is winner================="
			exit
		elif [[ ${board[2]} == $symbol && ${board[4]} == $symbol && ${board[6]} == $symbol ]]
		then
			echo "==================$winner is winner================="
			exit
		fi
}


# check if match ties
matchTie()
{
	for (( positionCount = 0; positionCount <=8; positionCount++ ))
	do
		if [ ${board[$positionCount]}="." ]
		then
			echo "Match is not tie"
			break
		elif (( $positionCount == 8))
		then
			echo "-------Match Tie-------"
			exit
		fi
	done
}

# player choice and position function
function playerPlay()
{
	echo "---------Player Chance----------"
	win="player"
	printBoard
	read -p "Enter position from (1 to 8) where you want to put symbol: " playerPosition
	if [ -z "${board[$playerPosition]}" ]
	then
		if (( $playerPosition >= 0 && $playerPosition <= 8 ))
		then
			board[$playerPosition]=$playerSymbol
			printBoard
			winningCheck $playerSymbol $win
			matchTie
		else
			echo "Invalid player position"
			playerPlay
		fi
	else
		echo "Position already occupied"
		playerPlay
	fi
}

# computer choice and position function
function computerPlay()
{
	echo "---------Computer Turn-------"
	win2="Computer"
	computerPosition=$(( RANDOM % 8 ))
	if [ -z "${board[$computerPosition]}" ]
	then
		board[$computerPosition]=$computerSymbol
		printBoard
		winningCheck $computerSymbol $win2
		matchTie
	else
		computerPlay
	fi
}

gameStart()
{
	if [ $flip -eq $player ]
	then
		playerPlay
		echo "-------------"
		computerPlay
	else
		computerPlay
		echo "-------------"
		playerPlay
	fi
}

#----------MAIN ------------
symbolAssigning
echo "Computer choses = $computerSymbol"
echo "Player choses = $playerSymbol"
gameStart
