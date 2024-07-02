if "%2"=="firstrun" exit
cmd /c "%0" null firstrun
if "%1"=="skipuac" goto skipuacstart
:checkPrivileges
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )
:getPrivileges
if '%1'=='ELEV' (shift & goto gotPrivileges)
setlocal DisableDelayedExpansion
set "batchPath=%~0"
setlocal EnableDelayedExpansion
ECHO Set UAC = CreateObject^("Shell.Application"^) > "%temp%\s.vbs"
ECHO UAC.ShellExecute "!batchPath!", "ELEV", "", "runas", 1 >> "%temp%\s.vbs"
"%temp%\s.vbs"
exit /B
:gotPrivileges
setlocal & pushd .
cd /d %~dp0
cmd /c "%0" skipuac firstrun
cd /d %~dp0
:skipuacstart
if "%2"=="firstrun" exit

@echo off
title Copilot Troubleshoot    Ver. 24R7
:menu
cls
echo +-------------------------------------------+
echo +                Troubleshoot               +
echo +-------------------------------------------+
echo  1.  Install Edge Browser                   
echo  2.  Info That Can Help
echo  3.  Install Windows Store
echo  4.  Write The Problem In Github
echo +-------------------------------------------+
set /p choice=choose from (4 to 7):

if "%choice%"=="1" goto edge
if "%choice%"=="2" goto info
if "%choice%"=="3" goto store
if "%choice%"=="4" goto github

:edge
bitsadmin /transfer Edge /download /priority normal https://raw.githubusercontent.com/adasjusk/edge/main/MicrosoftEdgeSetup.exe %USERPROFILE%\AppData\Local\Temp\MicrosoftEdgeSetup.exe
%USERPROFILE%\AppData\Local\Temp\MicrosoftEdgeSetup.exe
cls
goto menu

:info
cls
echo +----------------------------------------------------------------------+
echo + So if you don't have Copilot In Taskbar The Is Few Steps To Enable It:
echo +----------------------------------------------------------------------+
echo + PS: Maximize CMD On Fullscreen
echo +----------------------------------------------------------------------
echo + You Have To Be On Windows 11 2H23 Or 2H24 Press Win + R And Type winver And Check What Version of Windows 11 you have. If Not On These Versions 2H23/2H24 Then Update your PC.
echo +----------------------------------------------------------------------
echo + Minimal Requirements Needed To Run Copilot Is: Windows Store, Microsoft Edge, Windows 11 2H23 Enterprise, Windows Insider Program, Minimum 8 GB Of Ram And Minimum 64 GB Storage For Updates.
echo +----------------------------------------------------------------------
pause
goto menu

:store
bitsadmin /transfer Store /download /priority normal https://raw.githubusercontent.com/adasjusk/Windows-Store-AIO/main/Windows-Store-AIO.cmd %USERPROFILE%\AppData\Local\Temp\Windows-Store-AIO.cmd
cmd /k %USERPROFILE%\AppData\Local\Temp\Windows-Store-AIO.cmd
pause
goto menu

:github
cls
echo https://github.com/adasjusk/Copilot-Enable/issues
pause
goto menu