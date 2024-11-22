@echo off
setlocal

rem Set source as an environment variable
set "source=%CodeSurfing_Backup%"

rem Set the volume label for the destination
set "volumeLabel=BackupDrive"

rem Find the drive letter associated with the volume label
for /f "tokens=2 delims==" %%i in ('wmic volume where "label='%volumeLabel%'" get DriveLetter /format:value') do set "driveLetter=%%i"

rem If destination drive letter is not found, exit the script
if "%driveLetter%"=="" (
    echo Volume label %volumeLabel% not found.
    exit /b 1
)

rem Set the destination path
set "destination=%driveLetter%\Backup_Folder"

rem Run RoboCopy to mirror source to destination
robocopy "%source%" "%destination%" /E /COPYALL /R:3 /W:5 /NFL /NDL /NJH /NJS /NS /NC
endlocal
