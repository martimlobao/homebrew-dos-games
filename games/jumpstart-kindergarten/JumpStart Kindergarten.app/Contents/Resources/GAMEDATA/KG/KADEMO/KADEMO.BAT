@echo off
cd C:\KG\KADEMO
C:

if 1#==# goto SOUNDERR
if 7#==# goto SOUNDERR
if 220#==# goto SOUNDERR
if SBP#==MS# goto SOUNDERR
if ADL==RLD goto BODYNM
if ADL==rld goto BODYNM


rem  *** 3-D BODY ADVENTURE ***
:BODY
t black.img -go -W -Q
t C:\KG_DOS\KG\..\kademo\box.mov -gi -go -W -Q
t none.mov -gi -go -W -Q -b0,0 -dfC:\KG_DOS\KG\..\kademo\box1.voc -t4000 -dd1 -di7 -dp220
t black.img -v400 -gi -W -Q
t C:\KG_DOS\KG\..\kademo\3dgl.mov -v400 -go -W -Q -dfC:\KG_DOS\KG\..\kademo\3don.voc -t5000 -dd1 -di7 -dp220
if errorlevel 2 goto END
t black.img -gi -v400 -go -W -Q
t black.img -v400 -go -W -Q
if errorlevel 2 goto END
t C:\KG_DOS\KG\..\kademo\hand1.img -gi -v400 -go -dup -W -Q
if errorlevel 2 goto END
t C:\KG_DOS\KG\..\kademo\hand2.mov -gi -v400 -go -dup -W -Q -b70,70 -dfC:\KG_DOS\KG\..\kademo\hand.voc -dd1 -di7 -dp220
if errorlevel 2 goto END
t C:\KG_DOS\KG\..\kademo\hand3.mmv -gi -v400 -W -Q -b52,58,268,322 -mfhand.adl -mlka.ad -mp220
if errorlevel 2 goto END
t black.img -v400 -go -W -Q
if errorlevel 2 goto END
t C:\KG_DOS\KG\..\kademo\thea386.mov -gi -v400 -go -dup -W -Q -dfC:\KG_DOS\KG\..\kademo\skel.voc -dd1 -di7 -dp220
if errorlevel 2 goto END
t C:\KG_DOS\KG\..\kademo\brai386.mov -dfi -gi -v400 -go -W -Q -b45,29 -dd1 -di7 -dp220 -mfbrai.adl -mlka.ad -mp220
if errorlevel 2 goto END
t C:\KG_DOS\KG\..\kademo\thea386.mov -gi -v400 -W -Q -dfC:\KG_DOS\KG\..\kademo\thea2.voc -dd1 -di7 -dp220
if errorlevel 2 goto END
t black.img -go -W -Q
if errorlevel 2 goto END
t C:\KG_DOS\KG\..\kademo\box.mov -gi -go -W -Q
if errorlevel 2 goto END
t none.mov -gi -W -Q -b0,0 -dfC:\KG_DOS\KG\..\kademo\box2.voc -t5000 -dd1 -di7 -dp220
if errorlevel 2 goto END
goto END


rem  *** 3-D BODY ADVENTURE *** NO MUSIC
:BODYNM
t black.img -go -W -Q
t C:\KG_DOS\KG\..\kademo\box.mov -gi -go -W -Q
t none.mov -gi -go -W -Q -b0,0 -dfC:\KG_DOS\KG\..\kademo\box1.voc -t4000 -dd1 -di7 -dp220
t black.img -v400 -gi -W -Q
t C:\KG_DOS\KG\..\kademo\3dgl.mov -v400 -go -W -Q -dfC:\KG_DOS\KG\..\kademo\3don.voc -t5000 -dd1 -di7 -dp220
if errorlevel 2 goto END
t black.img -gi -v400 -go -W -Q
t black.img -v400 -go -W -Q
if errorlevel 2 goto END
t C:\KG_DOS\KG\..\kademo\hand1.img -gi -v400 -go -dup -W -Q
if errorlevel 2 goto END
t C:\KG_DOS\KG\..\kademo\hand2.mov -gi -v400 -go -dup -W -Q -b70,70 -dfC:\KG_DOS\KG\..\kademo\hand.voc -dd1 -di7 -dp220
if errorlevel 2 goto END
t C:\KG_DOS\KG\..\kademo\hand3.mmv -gi -v400 -W -Q -b52,58,268,322
if errorlevel 2 goto END
t black.img -v400 -go -W -Q
if errorlevel 2 goto END
t C:\KG_DOS\KG\..\kademo\thea386.mov -gi -v400 -go -dup -W -Q -dfC:\KG_DOS\KG\..\kademo\skel.voc -dd1 -di7 -dp220
if errorlevel 2 goto END
t C:\KG_DOS\KG\..\kademo\brai386.mov -dfi -gi -v400 -go -W -Q -b45,29 -dd1 -di7 -dp220
if errorlevel 2 goto END
t C:\KG_DOS\KG\..\kademo\thea386.mov -gi -v400 -W -Q -dfC:\KG_DOS\KG\..\kademo\thea2.voc -dd1 -di7 -dp220
if errorlevel 2 goto END
t black.img -go -W -Q
if errorlevel 2 goto END
t C:\KG_DOS\KG\..\kademo\box.mov -gi -go -W -Q
if errorlevel 2 goto END
t none.mov -gi -W -Q -b0,0 -dfC:\KG_DOS\KG\..\kademo\box2.voc -t5000 -dd1 -di7 -dp220
if errorlevel 2 goto END
goto END




:SOUNDERR
cls
echo.
echo.
echo.
echo.
echo         While 3-D BODY ADVENTURE does work with your sound
echo             and music devices, this PREVIEW does not.
echo.
echo                     Press any key to return to:
echo                         JumpStart Kindergarten CD-ROM
pause > nul

:END
t black.img -gi -W -Q
..\KG
