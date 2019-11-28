@echo off
set KEIL_BIN_FOLDER=C:\RT\Keil\C51\BIN

cls
echo Keil Compiler batch by Kenvix
echo Compiler path is %KEIL_BIN_FOLDER%

cd /d "%1\build"

call "%KEIL_BIN_FOLDER%\C51.EXE" "%2\%3.c" 
move "%2\%3.LST" "%2\..\build" > NUL || goto failed
move "%2\%3.OBJ" "%2\..\build" > NUL || goto failed

call "%KEIL_BIN_FOLDER%\BL51.EXE" "%1\build\%3.OBJ" TO %3 
call "%KEIL_BIN_FOLDER%\OH51.EXE" "%1\build\%3" || goto failed

echo Compiled successfully: build\%3.hex
exit 0

:failed
set ERRCODE=%errorlevel%
echo Compilation Failed: Code %ERRCODE%
exit %ERRCODE%