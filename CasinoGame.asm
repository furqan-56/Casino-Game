;
;	Project by:		
;				Alia Waqas_______[221367]
;				Furkan Rasheed___[221427]
;				Qazi Tehmas______[221445]
;
;	Instructor:
;				Ms. Romana Maroof
;
;	Course:
;				Computer Organization & Assembly Language (LAB)		
;

INCLUDE Irvine32.inc


.DATA
	
	; Display welcome messages and prompts
	welcome				db "	========== WELCOME TO CASINO WORLD ==========", 0
	msgName				db " What's your Name : ", 0
	msgStartBal			db " Enter the starting balance to play game: Rs. ", 0

	; Variables for user input
	username			dd ?
	startBal			dd ?

	;	MAIN MENU
	MM_msg1				db " Before you continue to 'The Casino', would you like to play the bonus game for a special reward?", 0
	MM_msg2				db " 1. Continue to Casino", 0
	MM_msg3				db " 2. Play the Bonus Game", 0
	MM_msg4				db " Enter your choice: ", 0
	

	; BONUS GAME
	BG_Welcome			db "	========== WELCOME TO BONUS GAME ==========", 0
	
	; BONUS GAME RULES
	BG_Rules			db " Bonus Game Rules", 0
	BG_Rule1			db " 1. Think of a number", 0
	BG_Rule2			db " 2. The game will provide you some instructions", 0
	BG_Rule3			db " 3. Follow the instructions to complete the game", 0
	BG_Rule4			db " 4. You will get a reward of Rs. 1000 at the end", 0
	BG_Rule5			db " (Press Enter after each step)", 0
	BG_Ready			db " Are you ready? Press Enter to begin.",0

	; BONUS GAME STEPS
	BG_Step1			db "   -> Think of a number. Don't tell it to me.", 0
	BG_Step2			db "   -> Double it. Just hit enter when you got it.", 0
	BG_Step3			db "   -> Add 6 to your new number.", 0
	BG_Step4			db "   -> Half the total sum.", 0
	BG_Step5			db "   -> Subtract the number you started with.", 0
	BG_Step6			db "   -> Comgratulations! Your answer is 3.", 0
	BG_Reward			db " Your total amount has increased by Rs. 1000", 0
	BG_Amount			db " Your new total amount is: Rs. ", 0

	; CASINO GAME RULES
	Rules				db "	========== CASINO NUMBER GUESSING RULES! ========== ", 0
	Rules1				db "       1.  Choose a number between 1 to 10 ", 0
	Rules2				db "       2.  Winner gets 5 times of the money bet ", 0
	Rules3				db "       3.  Wrong bet, and you lose the amount you bet ", 0

	; CASINO GAME MESSAGES
	balanceMsg			db " Your current balance is Rs ", 0
	bettingAmountMsg	db " Please enter your betting amount: Rs. ", 0
	GuessNum			db " Guess any betting number between 1 & 10 : ", 0
	Check0to10			db " ->Number should be between 1 to 10<-", 0
	Lost				db " Oops, better luck next time !! You lost Rs. ", 0
	WinNumMsg			db " The winning number was : ", 0
	Won					db " You are in luck!! You have won Rs.", 0
	choiceMsg			db " Do you want to continue Playing? (1 for yes & 0 for no)", 0
	endgame				db " Thanks for playing the game. Your balance is Rs. ", 0
	goodbye				db " GoodBye, ", 0

	; Variables for game logic
	bettingAmount		dd ?
	RandNum				dd ?
	CompRange			dd 0
	choice				dd 1
	


.CODE
main PROC

	call Crlf
	mov edx, OFFSET welcome
	call Writestring
	call Crlf
	call Crlf

	mov edx, OFFSET msgName
	call Writestring

	; Input username
	mov edx, offset username			; address of input string
	mov ecx, 20							; Max Characters to read
	call readstring

	; input Starting Balance from user 
	mov edx, OFFSET msgStartBal
	call Writestring
	call readInt
	mov startBal, eax

	call crlf
	call WaitMsg
	

MainMenu:
	call clrscr

	; Display Menu items
	call crlf
	mov edx, offset MM_msg1
	call WriteString
	call crlf
	call crlf
	mov edx, offset MM_msg2
	call WriteString
	call crlf
	mov edx, offset MM_msg3
	call WriteString
	call crlf
	call crlf
	mov edx, offset MM_msg4
	call WriteString

	; Take user input
	call ReadInt
	mov choice, eax
	
	; Process user input
	cmp choice, 1

	je CasinoGame			; Jump to casino game by user input


BonusGame:
	
	;					Bonus Game logic works on the following mathematical equation
	;								[ ( 2x + 6 ) / 2 ] - x = 3

	call clrscr
	call Crlf
	mov edx, OFFSET BG_Welcome
	call WriteString
	call CRLF
	call CRLF

	;	PRINT BONUS GAME RULES
	mov edx, OFFSET BG_Rules
	call WriteString
	call CRLF

	mov edx, OFFSET BG_Rule1
	call WriteString
	call CRLF
	mov edx, OFFSET BG_Rule2
	call WriteString
	call CRLF
	mov edx, OFFSET BG_Rule3
	call WriteString
	call CRLF
	mov edx, OFFSET BG_Rule4
	call WriteString
	call CRLF
	mov edx, OFFSET BG_Rule5
	call WriteString
	call Crlf
	call Crlf
	
	mov edx, OFFSET BG_Ready
	call WriteString
	call ReadString
	call Crlf

	;	PRINT BONUS GAME STEPS
	mov edx, OFFSET BG_Step1
	call WriteString
	call ReadString
	mov edx, OFFSET BG_Step2
	call WriteString
	call ReadString
	mov edx, OFFSET BG_Step3
	call WriteString
	call ReadString
	mov edx, OFFSET BG_Step4
	call WriteString
	call ReadString
	mov edx, OFFSET BG_Step5
	call WriteString
	call ReadString
	call CRLF
	mov edx, OFFSET BG_Step6
	call WriteString
	call ReadString
	call crlf

	mov edx, OFFSET BG_Reward
	call WriteString
	call crlf

	;  Increment the total amount after playing Bonus Game
	add startBal, 1000

	mov edx, OFFSET BG_Amount
	call WriteString
	mov eax, startBal
	call WriteInt

	call crlf
	call WaitMsg


CasinoGame:

	call clrscr

	.WHILE choice != 0 && startBal > 0

		call Randomize
		mov eax, 10
		call RandomRange		; Create a random number from 0 - 9
		inc eax					; Increment the rancdom value to 1 - 10
		mov CompRange, eax
		call crlf

		; Print Casino rules
		mov edx, OFFSET Rules
		call Writestring
		call Crlf
		call Crlf
		mov edx, OFFSET Rules1
		call Writestring
		call Crlf
		mov edx, OFFSET Rules2
		call Writestring
		call Crlf
		mov edx, OFFSET Rules3
		call Writestring
		call Crlf
		call Crlf

		; Print amount 
		mov edx, OFFSET balanceMsg
		call Writestring
		mov eax, startBal
		call Writeint
		call crlf

		; Print betting amount message
		call Crlf
		mov edx, OFFSET bettingAmountMsg
		call Writestring
		call readInt
		mov bettingAmount, eax

		;------------------ to check random value
		;mov eax, CompRange				
		;call WriteInt
		;call crlf
		;------------------

		mov edx, OFFSET GuessNum
		call Writestring
		call readInt
		mov RandNum, eax
		call crlf

		; Check if the input is out of range, restart the game
		.IF RandNum < 1 || RandNum > 10

			mov edx, offset Check0to10
			call WriteString
			call crlf
			call crlf
			call WaitMsg
			jmp CasinoGame

		.ENDIF
		;	---------------------------->

		; Check if the input is in range
		.IF RandNum > 0 && RandNum < 11 
			mov eax, CompRange				; Move the random value in eax

				; Check if random value is equal to entered number
			.IF RandNum == eax					
				
				; Print the Winning number
				mov edx, OFFSET WinNumMsg
				call Writestring
				mov eax, CompRange
				call WriteInt
				call crlf
				call crlf

				; Print the won message
				mov edx, OFFSET Won
				call Writestring
				mov eax, bettingAmount
				mov ebx, 5
				mul ebx
				mov bettingAmount, eax
				call Writeint

				; add the won amount to starting balance
				mov eax, bettingAmount
				add startBal, eax
				call crlf
				call crlf

				;  If random value is not equal to entered number
			.ELSE
				; Print the Winning number
				mov edx, OFFSET WinNumMsg
				call Writestring
				mov eax, CompRange
				call WriteInt
				call crlf
				call crlf

				; Print the lost message
				mov edx, OFFSET Lost
				call Writestring

				; Remove the betting amount from starting balance
				mov eax,bettingAmount
				push eax
				sub startBal, eax
				pop eax
				call Writeint
				call crlf
				call crlf
				
			.ENDIF

		.ENDIF

			;  Ask user to play again
		mov edx, OFFSET choiceMsg
		call Writestring
		call readInt
		mov choice, eax
		call clrscr

	.ENDW

	; Print end game message and username
	mov edx, OFFSET endgame
	call Writestring
	mov eax, startBal
	call writeint
	call crlf
	mov edx, OFFSET goodbye
	call Writestring
	mov edx, OFFSET username
	call Writestring
	call crlf


INVOKE Exitprocess, 0
main ENDP
END main