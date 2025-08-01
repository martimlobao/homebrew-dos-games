@echo off
rem usage: KG [-v] [-clean] [-p]
rem The -p is only used within Windows to pause the end screen.
rem If -v is given, user can hit Ctrl-PrintScreen to dump the screen to a file.
rem If -clean is given, no TSRs will be loaded before running ka.
C:
cd C:\KG
rem if not "%LANG%" == "" setlang -d -x %LANG%
if "%1"=="-CLEAN" goto clean
if "%1"=="-clean" goto clean
moustest
if errorlevel 1 mouse
rem no special tsrs needed
rem No special sound device
:clean
Shell %1 %2 %3 %4 %5 %6 %7 %8
if errorlevel 99 goto quit
if exist zzzlch.bat zzzlch.bat %1 %2 %3 %4 %5 %6 %7 %8
:quit
rem no special tsr cleanup needed
rem No special sound device cleanup
