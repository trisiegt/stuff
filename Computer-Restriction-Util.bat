@echo off
cls

if exist "%userprofile%\.dev\cruproperties.conf" (goto halt) else (goto passcheck)
    

:passcheck 
echo Hello. What colour scheme (for accessibility) would you like?
echo [1]: White on Black (Recommended)
echo [2]: Black on White
echo [3]: Green on Black
echo [4]: Red on Black
set /p accessibility.colour=Enter it here! 
if %accessibility.colour%==1 goto achoice1
if %accessibility.colour%==2 goto achoice2
if %accessibility.colour%==3 goto achoice3
if %accessibility.colour%==4 goto achoice4

:achoice1
cls && goto start

:achoice2
color 70
cls && goto start

:achoice3
color 02
cls
goto start

:achoice4
color 04
cls
goto start








:start
echo Would you like to disable all restrictions?
choice /c yn
if %errorlevel%==1 goto remove
if %errorlevel%==2 exit
if not %errorlevel%==1 exit






:remove
REG DELETE HKCR\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoViewContextMenu /f
REG DELETE HKCR\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v DisableRegistryTools /f
REG DELETE HKCR\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun /f
reg add HKLM\SYSTEM\CurrentControlSet\Services\USBSTOR /v "Start" /t REG_DWORD /v 3 /f
reg delete HKCR\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /f














:halt
cls
echo Waaait a sec, did you forget to delete the debug file?
echo If you forgot where it is, it's in %userprofile%\.dev\cruproperties.conf!
pause>nul