setlocal enabledelayedexpansion

cd /d "YOUR DIRECTORY WITH YOUR VIDEO HERE"

for %%i in (*.mkv) do (
    echo Processing "%%i"
    ffmpeg -i "%%i" "YOUR DIRECTORY WITH YOUR VIDEO HERE\frame%%07d.png"
)

endlocal

PAUSE
