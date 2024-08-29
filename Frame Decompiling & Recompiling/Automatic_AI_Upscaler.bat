set countdown=20
set frameinput=###YOUR FRAME INPUT DIRECTORY HERE###
set frameoutput=###YOUR FRAME OUTPUT DIRECTORY HERE###
set videostorage=###YOUR VIDEO STORAGE DIRECTORY HERE###

:Z
echo %countdown%...

cd /d G:
cd %frameinput%
del /s /q *.*

cd %videostorage%

FOR %%F IN ("%videostorage%\*.mkv") DO (
set filename=%%F
goto tests
)
:tests
echo "%filename%"

move "%filename%" "%frameinput%"

setlocal enabledelayedexpansion

cd "%frameinput%"


for %%i in (*.mkv) do (
    echo Processing "%%i"
    ffmpeg -i "%%i" "%frameinput%\frame%%07d.png"
)

endlocal

cd "%frameinput%"

for %%i in (*.mkv) do (
    echo Processing "%%i"
    set Video_Name=%%i
)

del "%frameinput%\*.mkv"


                                                                ###THIS PART IS HIGHLY CUSTOMIZABLE###
                                                                ###YOU MAY USE YOUR OWN AI UPSCALING ENGINE/MODEL HERE###

                                                                            ###<EXAMPLE>###


cd G:\realesrgan-ncnn-vulkan-20220424-windows
realesrgan-ncnn-vulkan.exe -i "%frameinput%" -o "%frameinput%" -s 2 -n 4x-UltraSharp-fp32 -f png 


                                                                            ###</EXAMPLE>###


setlocal enabledelayedexpansion

cd "%frameinput%"


echo Processing "%Video_Name%"
ffmpeg -r 23.976023 -i frame%%07d.png -c:v libsvtav1 -crf 1 -pix_fmt yuv420p "%frameoutput%\%Video_Name%"


endlocal

timeout /t 1 /nobreak >nul

set /a countdown=%countdown% -1
if %countdown% NEQ 0 goto :Z

pause
