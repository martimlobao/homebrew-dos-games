@echo off
path=c:\;d:\windows\;d:\;e:\
copy d:\ini\*.* d:\windows\
setini d:\windows\system.ini boot shell %1
call c:\add.bat
setini d:\windows\win.ini desktop WallPaper classicr.bmp
setini d:\windows\win.ini colors background 0 0 0
c:
cd \
d:\windows\win
