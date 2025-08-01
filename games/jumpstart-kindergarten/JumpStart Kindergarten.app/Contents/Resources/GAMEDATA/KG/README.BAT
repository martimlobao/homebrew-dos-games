@echo off
C:
cd C:\KG
if exist C:\KG_DOS\KG\eng\readme.doc goto simple
C:\KG_DOS\KG\readme
goto end
:simple
C:\KG_DOS\KG\more C:\KG_DOS\KG\eng\readme.doc
:end
