@echo off
set appDir=%~dp0
set tortoiseRoot=C:\Program Files\TortoiseSVN\bin\
set exeProcPath=%tortoiseRoot%TortoiseProc.exe
echo exeProcPath = %exeProcPath%
set workspace=%1
if not "%workspace%"=="" set path=/path:"%workspace%"
echo path = %path%
set outfile=%appDir%svnRev.txt
echo outfile = %outfile%
"%exeProcPath%" /command:log %path% /outfile:"%outfile%"
set /p selectRev=<"%outfile%"
del "%outfile%"
echo rev=%selectRev%