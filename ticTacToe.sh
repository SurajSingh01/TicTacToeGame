
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
			printBoard
			exit
		elif [[ ${board[3]} == $symbol && ${board[4]} == $symbol && ${board[5]} == $symbol ]]
		then
			echo "==================$winner is winner================="
			printBoard
			exit
		elif [[ ${board[6]} == $symbol && ${board[7]} == $symbol && ${board[8]} == $symbol ]]
		then
			echo "==================$winner is winner================="
			printBoard
			exit
		elif [[ ${board[0]} == $symbol && ${board[3]} == $symbol && ${board[6]} == $symbol ]]
		then
			echo "==================$winner is winner================="
			printBoard
			exit
		elif [[ ${board[1]} == $symbol && ${board[4]} == $symbol && ${board[7]} == $symbol ]]
		then
			echo "==================$winner is winner================="
			printBoard
			exit
		elif [[ ${board[2]} == $symbol && ${board[5]} == $symbol && ${board[8]} == $symbol ]]
		then
			echo "==================$winner is winner================="
			printBoard
			exit
		elif [[ ${board[0]} == $symbol && ${board[4]} == $symbol && ${board[8]} == $symbol ]]
		then
			echo "==================$winner is winner================="
			printBoard
			exit
		elif [[ ${board[2]} == $symbol && ${board[4]} == $symbol && ${board[6]} == $symbol ]]
		then
			echo "==================$winner is winner================="
			printBoard
			exit
		fi
}


# check if match ties
matchTie()
{
	for (( positionCount = 0; positionCount <=8; positionCount++ ))
	do
		if [ -z "${board[$positionCount]}" ]
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
	for (( cellNumber = 1; cellNumber < 10; cellNumber++ ))
	do
		if [ -z "${board[$cellNumber]}" ]
		then
			board[$cellNumber]="$computerSymbol"
			echo "computer win check"
			player="computer"
			winnigCheck $computerSymbol $player
			board[$cellNumber]=""

			if (( $cellNumber == 8 ))
			then
				echo "there is no cell for winning playing randon cell"
				opponentBlocking
			fi
		fi
	done
}

# function for blacking opponent place where he can win the game
opponentBlocking() {
	flag=1
	echo "===============opponent Blocking====================="
	for (( cellBlock = 1; cellBlock < 9; cellBlock++ ))
	do
		if [ -z "${board[$cellBlock]}" ]
		then
			board[$cellBlock]="$playerSymbol"
			winningCheckForOpp "$playerSymbol"
			board[$cellBlock]=""
		fi
	done
	if [ $flag -eq 1 ]
	then
		cornerApproach
	fi
}

# function for corner Approach for system
cornerApproach()
{
	echo "-------corner blocking---------"
	if [ -z "${board[0]}" ]
	then
		board[0]="$computerSymbol"
	elif [ -z "${board[2]}" ]
	then
		board[2]="$computerSymbol"
	elif [ -z "${board[6]}" ]
   then
      board[6]="$computerSymbol"
	elif [ -z "${board[8]}" ]
   then
      board[8]="$computerSymbol"
	else
		echo "-------NO corner block found-----"
		centerApproach
	fi
}

centerApproach()
{
	echo "--------Center blocking--------"
	if [ -z "{$board[5]}"
	then
		board[4]="computerPlay"
	else
		echo "---------No center to block--------"
		computerPlay
	fi
}

exitingFromOppBlockingLoop()
{
	board[$cellBlock]="computerSymbol"
	flag=2
	cellBlock=9
}


#//fuction to analysing player winning cells for blocking
winningCheckForOpp() {

   symbol2=$1
   if [[ ${board[1]} == $symbol2 && ${board[2]} == $symbol2 && ${board[3]} == $symbol2 ]]
   then
		exitingFromOppBlockingLoop
	elif [[ ${board[4]} == $symbol2 && ${board[5]} == $symbol2 && ${board[6]} == $symbol2 ]]
   then
		exitingFromOppBlockingLoop
	elif [[ ${board[7]} == $symbol2 && ${board[8]} == $symbol2 && ${board[9]} == $symbol2 ]]
   then
		exitingFromOppBlockingLoop
	elif [[ ${board[1]} == $symbol2 && ${board[4]} == $symbol2 && ${board[7]} == $symbol2 ]]
   then
		exitingFromOppBlockingLoop
	elif [[ ${board[2]} == $symbol2 && ${board[5]} == $symbol2 && ${board[8]} == $symbol2 ]]
   then
		exitingFromOppBlockingLoop
	elif [[ ${board[3]} == $symbol2 && ${board[6]} == $symbol2 && ${board[9]} == $symbol2 ]]
   then
		exitingFromOppBlockingLoop
	elif [[ ${board[1]} == $symbol2 && ${board[5]} == $symbol2 && ${board[9]} == $symbol2 ]]
   then
		exitingFromOppBlockingLoop
	elif [[ ${board[3]} == $symbol2 && ${board[5]} == $symbol2 && ${board[7]} == $symbol2 ]]
   then
		exitingFromOppBlockingLoop
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
