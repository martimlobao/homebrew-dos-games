@echo off
rem usage: KG [-v] [-clean] [-p]
rem The -p is only used within Windows to pause the end screen.
rem If -v is given, user can hit Ctrl-PrintScreen to dump the screen to a file.
rem If -clean is given, no TSRs will be loaded before running ka.
C:
cd C:\KG\ADVENT01
:checkcd
..\existdir C:\KG_DOS\KG\drivers
if errorlevel 1 goto nocd
goto gotcd
:nocd
cls
echo. 
echo.
echo                      ษอออออออออออออออออออออออออออออออป
echo                      บ                               บ
echo                      บ Unable to access the CD-ROM!  บ
echo                      บ                               บ
echo                      ศอออออออออออออออออออออออออออออออผ
echo. 
echo. 
echo Please insert KG in drive C: and press a key to continue
echo                               [CTRL-C] to exit.
echo. 
pause > nul
cls
goto checkcd
:gotcd
rem if not "%LANG%" == "" ..\setlang -d -x %LANG%
if "%1"=="-CLEAN" goto clean
if "%1"=="-clean" goto clean
rem power.exe not detected
if "%1"=="-V" goto vgacapt
if "%1"=="-v" goto vgacapt
..\moustest
if errorlevel 1 goto nomouse
rem no special tsrs needed
rem No special sound device
..\ka -520k ..\kav.exe -lC:\KG -rC:\KG_DOS\KG\..\ADVENT01 -fC:\KG\ADVENT01
if errorlevel 1 goto bottom
rem don't clear the screen for errors...
rem no special tsr cleanup needed
goto end
:nomouse
..\mouse
rem no special tsrs needed
rem No special sound device
..\ka -520k ..\kav.exe -lC:\KG -rC:\KG_DOS\KG\..\ADVENT01 -fC:\KG\ADVENT01
if not errorlevel 1 goto endmouse
:ubottom
	rem no special tsr cleanup needed
	..\mouse /u >nul
	goto bottom
:endmouse
rem don't clear the screen for errors...
rem no special tsr cleanup needed
..\mouse /u >nul
goto end
:vgacapt
..\moustest
if errorlevel 1 goto vnomouse
rem no special tsrs needed
rem No special sound device
..\vgacapt ..\ka -520k ..\kav.exe -lC:\KG -rC:\KG_DOS\KG\..\ADVENT01 -fC:\KG\ADVENT01
if errorlevel 1 goto bottom
rem don't clear the screen for errors...
rem no special tsr cleanup needed
goto end
:vnomouse
..\mouse
rem no special tsrs needed
rem No special sound device
..\vgacapt ..\ka -520k ..\kav.exe -lC:\KG -rC:\KG_DOS\KG..\ADVENT01 -fC:\KG\ADVENT01
if errorlevel 1 goto ubottom
rem don't clear the screen for errors...
rem no special tsr cleanup needed
..\mouse /u >nul
goto end
:clean
..\ka -520k ..\kav.exe -lC:\KG -rC:\KG_DOS\KG\..\ADVENT01 -fC:\KG\ADVENT01
if errorlevel 1 goto bottom
rem don't clear the screen for errors...
:end
rem No special sound device cleanup
:bottom
:last
cd ..
KG
