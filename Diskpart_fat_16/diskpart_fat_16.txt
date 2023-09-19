@echo off

:Z
(echo list disk) | diskpart
(echo "select a disk")
set /p input= 
(echo "You are going to format disk %input% to fat 16 4GB size if you've made a mistake press 'n' now" [y:n])
set /p choice1= 
if %choice1% == Y goto A
if %choice1% == y goto A
if %choice1% == N goto C
if %choice1% == n goto C 
if %choice1% != y goto D
	
:A
(echo "Are you sure? This will erase all data on disk %input%. This is your last chance to go make a backup!" [y:n])
set /p choice2=
if %choice2% == Y goto B
if %choice2% == y goto B
if %choice2% == N goto C
if %choice2% == n goto C
if %choice2% != y goto D

:B
(echo select disk %input% 
echo clean 
echo create part primary size=4000
echo format fs=fat quick) | diskpart
(echo "Congratulations you have just formatted your drive!")
pause

:C
(echo Terminating...)
pause
(echo exit) | dispart 


:D
(echo "That was an invalid input!")

(echo "Do you want to continue?" [y:n])
set /p choice3=
if %choice3% == Y goto Z
if %choice3% == y goto Z
if %choice3% == N goto C
if %choice3% == n goto C
if %choice3% != y goto D



# "This file will format your drive into a fat 16 file system compatible drive, it will set the primary partition size to 4gb and erase all data on the drive."

# The file comes with an instruction set that is written in the CMD line within the diskpart tool. The script asks for user input such as selecting a drive NUMBER, not letter, after the "list disk" command is run behind the scenes. Any invalid inputs may lead to the script crashing." 

# "The script requires administrative mode to run properly."

# "Currently :D only exists to match a != y statement, however it does not function properly at the moment, currently it exits the script if you give a value other than (Y,y,N,n). I may update this in the future but I left it in for anyone who wants to redirect invalid inputs back to the start of the script without quitting the script and re-running it.