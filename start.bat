@echo off
setlocal

:: Detect paths for avdmanager.bat and emulator.exe
set AVDMANAGER_PATH="%USERPROFILE%\AppData\Local\Android\Sdk\tools\bin\avdmanager.bat"
set EMULATOR_PATH="%USERPROFILE%\AppData\Local\Android\Sdk\emulator\emulator.exe"

:: Check if avdmanager.bat and emulator.exe exist
if not exist %AVDMANAGER_PATH% (
    echo avdmanager.bat not found.
    exit /b
)

if not exist %EMULATOR_PATH% (
    echo emulator.exe not found.
    exit /b
)

:: List available emulators
echo Available emulators:
%AVDMANAGER_PATH% list avd | find "Name:"

:: Launch emulator with the name passed as an argument
if "%~1"=="" (
    echo.
    echo Please specify the name of the emulator to launch.
    echo Example: start.bat EmulatorName
    exit /b
)

echo Launching emulator %~1...
%EMULATOR_PATH% -avd %~1

endlocal