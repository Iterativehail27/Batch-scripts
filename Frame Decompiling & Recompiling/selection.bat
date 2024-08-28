set countdown=20

:Z
echo %countdown%...

cd /d G:
cd G:\Topaz Output G\Frame_Input
del /s /q *.*

cd G:\Topaz Output G\holding

FOR %%F IN ("%G:\Topaz Output G\holding%\*.mkv") DO (
set filename=%%F
goto tests
)
:tests
echo "%filename%"

move "%filename%" "G:\Topaz Output G\Frame_Input"

setlocal enabledelayedexpansion

set "G:\Topaz Output G\Frame_Input"
set "G:\Topaz Output G\Frame_Input"

cd "G:\Topaz Output G\Frame_Input"


for %%i in (*.mkv) do (
    echo Processing "%%i"
    ffmpeg -i "%%i" "G:\Topaz Output G\Frame_Input\frame%%07d.png"
    ffmpeg -r 23.976023 -i frame%%07d.png -c:v libsvtav1 -crf 1 -pix_fmt yuv420p "G:\Topaz Output G\Frame_Output\%%i"
)

endlocal

timeout /t 1 /nobreak >nul

set /a countdown=%countdown% -1
if %countdown% NEQ 0 goto :Z

pause