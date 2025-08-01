@echo off
rem usage: KG [-v] [-clean] [-p]
rem The -p is only used within Windows to pause the end screen.
rem If -v is given, user can hit Ctrl-PrintScreen to dump the screen to a file.
rem If -clean is given, no TSRs will be loaded before running ka.
C:
cd C:\KG\KG
:checkcd
if 1==1 goto gotcd
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
KGR.EXE  %1 %2 %3 %4 %5 %6 %7 %8 %9 -PC:\KG
if errorlevel 1 goto bottom
rem don't clear the screen for errors...
rem no special tsr cleanup needed
goto end
:nomouse
..\mouse
rem no special tsrs needed
rem No special sound device
KGR.EXE  %1 %2 %3 %4 %5 %6 %7 %8 %9 -PC:\KG
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
..\vgacapt KGR.EXE  %1 %2 %3 %4 %5 %6 %7 %8 %9 -PC:\KG
if errorlevel 1 goto bottom
rem don't clear the screen for errors...
rem no special tsr cleanup needed
goto end
:vnomouse
..\mouse
rem no special tsrs needed
rem No special sound device
..\vgacapt KGR.EXE  %1 %2 %3 %4 %5 %6 %7 %8 %9 -PC:\KG
rem ..\vgacapt ..\ka -520k ..\kav.exe -lC:\KG -rC:\KG_DOS\KG -fC:\KG\KG
if errorlevel 1 goto ubottom
rem don't clear the screen for errors...
rem no special tsr cleanup needed
..\mouse /u >nul
goto end
:clean
KGR.EXE  %1 %2 %3 %4 %5 %6 %7 %8 %9 -PC:\KG
rem ..\ka -520k ..\kav.exe -lC:\KG -rC:\KG_DOS\KG -fC:\KG\KG
if errorlevel 1 goto bottom
rem don't clear the screen for errors...
:end
rem No special sound device cleanup
rem echo.
rem echo.
rem echo  ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
rem echo  บ                Thank you for using Undersea Adventure.                  บ
rem echo  บ                                                                         บ
rem echo  บ       Try these other great new products from Knowledge Adventure!      บ
rem echo  ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
rem echo. 
rem echo                         ษอออออออออออออออออออออออออออป
rem echo                         บ   3-D BODY ADVENTURE      บ
rem echo                         บ   3-D DINOSAUR ADVENTURE  บ
rem echo                         บ   SCIENCE ADVENTURE II    บ
rem echo                         บ   AMERICA ADVENTURE       บ
rem echo                         บ   SPACE ADVENTURE II      บ
rem echo                         บ   MAGIC THEATRE           บ
rem echo                         บ   IMAX DISCOVERERS        บ
rem echo                         บ   IMAX SPEED              บ
rem echo                         บ   KID'S ZOO               บ
rem echo                         บ   ZURK'S LEARNING SAFARI  บ
rem echo                         ศอออออออออออออออออออออออออออผ
rem echo.
rem echo.
rem echo                   For more information call (818) 542-4200.
rem echo.
:bottom
rem if not "%1"=="-p" goto last
	rem echo Press a key to return to Windows...
	rem pause > nul
:last
cd ..
KG %1 %2 %3 %4 %5 %6 %7 %8 %9
