
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

winnigCheck() {
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
		if [ -z "${board[$count]}" ]
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
	echo ""---------Computer Turn-------"
	win2="Computer"
	computerPosition=$(( RANDOM % 8 ))
	if [ -z "${board[$computerPosition]}" ]
	then
		board[$computerPosition]=$computerSymbol
		printBoard
		winnigCheck $computerSymbol $win2
		matchTie
	else
		computerPlay
	fi
}

systemPlay() {
	for (( cellNumber=1;cellNumber<10;cellNumber++ ))
	do
		if [ -z "${board[$cellNumber]}" ]
		then
			board[$cellNumber]="$systemSymbol"
			echo "system win check"
			player="system"
			winnigCheck $systemSymbol $player
			board[$cellNumber]=""

			if (( $cellNumber == 9 ))
			then
				echo "there is no cell for winning playing randon cell"
				systemRandomPlay
			fi
		fi
	done
}

#//function for blacking opponent place where he can win the game
opponentBlocking() {
	echo "===============opponent Blocking====================="
	for (( cellBlock = 1; cellBlock < 10; cellBlock++ ))
	do
		if [ -z "${board[$cellBlock]}" ]
		then
			board[$cellBlock]="$playerSymbol"
			echo "checking for player winning condition if nay then blocking"
			winningCheckForOpp "$playerSymbol"
			board[$cellBlock]=""

			if [ $cellBlock -eq 9 ]
			then
				echo "=========Did not find any cell for blacking======="

				computerPlay
			fi
		fi
	done
}

#//fuction to analysing player winning cells for blocking
winningCheckForOpp() {

        symbol2=$1
        if [[ ${board[1]} == $symbol2 && ${board[2]} == $symbol2 && ${board[3]} == $symbol2 ]]
        then
                board[$cellBlock]="$systemSymbol"
		cellBlock=10
	elif [[ ${board[4]} == $symbol2 && ${board[5]} == $symbol2 && ${board[6]} == $symbol2 ]]
        then
                board[$cellBlock]="$systemSymbol"
                cellBlock=10
	elif [[ ${board[7]} == $symbol2 && ${board[8]} == $symbol2 && ${board[9]} == $symbol2 ]]
        then
                board[$cellBlock]="$systemSymbol"
                cellBlock=10
	elif [[ ${board[1]} == $symbol2 && ${board[4]} == $symbol2 && ${board[7]} == $symbol2 ]]
        then
                board[$cellBlock]="$systemSymbol"
                cellBlock=10
	elif [[ ${board[2]} == $symbol2 && ${board[5]} == $symbol2 && ${board[8]} == $symbol2 ]]
        then
                board[$cellBlock]="$systemSymbol"
                cellBlock=10
	elif [[ ${board[3]} == $symbol2 && ${board[6]} == $symbol2 && ${board[9]} == $symbol2 ]]
        then
                board[$cellBlock]="$systemSymbol"
                cellBlock=10
	elif [[ ${board[1]} == $symbol2 && ${board[5]} == $symbol2 && ${board[9]} == $symbol2 ]]
        then
                board[$cellBlock]="$systemSymbol"
                cellBlock=10
	elif [[ ${board[3]} == $symbol2 && ${board[5]} == $symbol2 && ${board[7]} == $symbol2 ]]
        then
                board[$cellBlock]="$systemSymbol"
                cellBlock=10
	fi
}

gameStart()
{
	if [ $flip -eq $player ]
	then
		playerPlay
		echo "-------------"
		systemPlay
	else
		systemPlay
		echo "-------------"
		playerPlay
	fi
}

#-----------MAIN ------------
symbolAssigning
echo "Computer choses = $computerSymbol"
echo "Player choses = $playerSymbol"
gameStart
