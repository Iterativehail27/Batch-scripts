@echo off

:Z
cls
(echo list disk) | diskpart
(echo "select a disk")
set Testval=0
set /p input=
set /a Testval="%input%"*1
if %Testval%==%input% goto F
if NOT %Testval%==%input% cls && goto D
if %ERRORLEVEL% NEQ 0 cls && goto D

:F
(echo "You are going to format disk %input% to fat 16 4GB size if you've made a mistake press 'n' now" [y:n])
set /p choice1= 
if "%choice1%" == "Y" goto A
if "%choice1%" == "y" goto A
if "%choice1%" == "N" cls && goto C
if "%choice1%" == "n" cls && goto C 
if NOT "%choice1%" == "y" cls && goto D
	
:A
(echo "Are you sure? This will erase all data on disk %input%. This is your last chance to go make a backup!" [y:n])
set /p choice2=
if "%choice2%" == "Y" goto B
if "%choice2%" == "y" goto B
if "%choice2%" == "N" cls && goto C
if "%choice2%" == "n" cls && goto C
if NOT "%choice2%" == "y" cls && goto D

:B
set countdown=5

:timer_loop


echo %countdown%...

timeout /t 1 /nobreak >nul

set /a countdown=%countdown% -1
if %countdown% NEQ 0 goto :timer_loop


(echo select disk %input% 
echo clean 
echo create part primary size=4000
echo format fs=fat quick) | diskpart
(echo "Congratulations you have just formatted your drive!")
(echo.)
(echo Press any key to end)
pause >nul


:C
cls
(echo Terminating)
set countdown=2

:timer_loop_2


echo %countdown% seconds...

timeout /t 1 /nobreak >nul

set /a countdown=%countdown% -1
if %countdown% NEQ 0 goto :timer_loop_2


exit
exit 


:D
(echo "That was an invalid input!")
(echo "Do you want to continue?" [y:n])
set /p choice3=
if "%choice3%" == "Y"  goto Z
if "%choice3%" == "y"  goto Z
if "%choice3%" == "N" cls && goto C
if "%choice3%" == "n" cls && goto C
if NOT "%choice3%" == "y" cls && goto D 
