@echo off
cls
echo Keil Compiler batch by Kenvix

cd /d "%2\build"

call "%1\C51.EXE" "%3\%4.c" || goto failed
move "%3\%4.LST" "%3\..\build" > NUL
move "%3\%4.OBJ" "%3\..\build" > NUL

call "%1\BL51.EXE" "%2\build\%4.OBJ" TO %4 || goto failed
call "%1\OH51.EXE" "%2\build\%4" || goto failed

echo Compiled successfully: build\%4.hex
exit 0

:failed
echo Operation Failed
exit %errorlevel%