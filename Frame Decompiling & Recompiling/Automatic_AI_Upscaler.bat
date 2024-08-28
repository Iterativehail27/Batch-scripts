set countdown=20

:Z
echo %countdown%...

cd /d ###YOUR DRIVE LETTER HERE###
cd ###YOUR VIDEO FRAME INPUT DIRECTORY HERE###
del /s /q *.*

cd /d ###YOUR DRIVE LETTER HERE###
cd ###YOUR VIDEO STAGING DIRECTORY HERE###
del /s /q *.*

cd ###YOUR VIDEO STORAGE FOLDER HERE###

FOR %%F IN ("%###YOUR VIDEO STORAGE FOLDER HERE###%\*.mkv") DO (
set filename=%%F
goto tests
)
:tests
echo "%filename%"

move "%filename%" "###YOUR VIDEO FRAME INPUT DIRECTORY HERE###"

cd "###YOUR VIDEO FRAME INPUT DIRECTORY HERE###"
for %%i in (*.mkv) do (
    echo Processing "%%i"
    ffmpeg -i "%%i" "###YOUR VIDEO FRAME INPUT DIRECTORY HERE###\frame%%07d.png"
    move "###YOUR VIDEO FRAME INPUT DIRECTORY HERE###\frame%%07d.png" "###YOUR VIDEO STAGING FOLDER HERE###"
)


cd ###YOUR AI MODEL FOLDER EXE HERE### 

### <EXAMPLE> ###

cd "G:\realesrgan-ncnn-vulkan-20220424-windows\realesrgan-ncnn-vulkan.exe" -i "###YOUR VIDEO STAGING FOLDER HERE###" -o "###YOUR VIDEO FRAME INPUT DIRECTORY HERE###" -s 1 -n 4x-UltraSharp-fp32 -f png

### </EXAMPLE> ###


setlocal enabledelayedexpansion

set "###YOUR VIDEO FRAME INPUT DIRECTORY HERE###"
set "###YOUR VIDEO FRAME INPUT DIRECTORY HERE###"

cd "###YOUR VIDEO FRAME INPUT DIRECTORY HERE###"


for %%i in (*.mkv) do (
    echo Processing "%%i"
    ffmpeg -r 23.976023 -i frame%%07d.png -c:v libsvtav1 -crf 1 -pix_fmt yuv420p "###YOUR VIDEO OUTPUT DIRECTORY HERE###\%%i"
)

endlocal

timeout /t 1 /nobreak >nul

set /a countdown=%countdown% -1
if %countdown% NEQ 0 goto :Z

pause
