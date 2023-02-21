@ECHO OFF
if EXIST "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" goto UNLOCK
if NOT EXIST ACCESSfiles goto MDACCESSfiles

:CONFIRM
SETLOCAL
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do       rem"') do (
    set "DEL=%%a"
)
call :colorecho c0 "MasterK  Choose to proceed YES yes  OR  NO no!"
echo
pause
exit 

:colorecho
<nul set /p ".=%DEL%" > "%~2"
FINDSTR /v /a:%1 /R "$" "%~2" nul
del "%~2" > nul 2>&1i
set/p "cho=>"
if %cho%==YES goto LOCK
if %cho%==yes goto LOCK
if %cho%==NO goto END
if %cho%==no goto END
echo ##MasterK## Choose (YES/yes) to encrypt the file
goto CONFIRM

:LOCK
ren ACCESSfiles "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
attrib +h +s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
echo ##MasterK## Folder encrypted successfully
goto End
:UNLOCK
echo ##MasterK## (Enter your access code):
setlocal

set /P "=_"< NUL > "Enter Password"
findstr /A:1E /V "$" "Enter Password" NUL > CON
del "Enter Password"
set /P "Password="
if NOT %password%==MasterK123 goto FAIL
attrib -h -s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
ren "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" ACCESSfiles
echo --------------------------------------------------##MasterK## Access Granted----------------------------------------------------------
goto End

:FAIL
goto cmd

:MDACCESSfiles
md ACCESSfiles
echo ##MasterK## Access Granted
goto End

:cmd
C:\
cd /d C:\Users\Asus\Desktop\masterk\CommandCam
CommandCam
exit
goto End

:End