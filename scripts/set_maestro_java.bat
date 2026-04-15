@echo off
setlocal EnableExtensions

REM Force Java + Maestro + ADB paths for local Jenkins
set "JAVA_HOME=C:\Program Files\Eclipse Adoptium\jdk-25.0.2.10-hotspot"
set "MAESTRO_HOME=C:\Users\HP\maestro\maestro\bin"
set "ADB_HOME=C:\Users\HP\AppData\Local\Android\Sdk\platform-tools"

if not exist "%JAVA_HOME%\bin\java.exe" (
  echo ERROR: Java not found at %JAVA_HOME%
  endlocal & exit /b 1
)

if not exist "%MAESTRO_HOME%\maestro.bat" (
  echo ERROR: Maestro not found at %MAESTRO_HOME%\maestro.bat
  endlocal & exit /b 1
)

if not exist "%ADB_HOME%\adb.exe" (
  echo ERROR: ADB not found at %ADB_HOME%\adb.exe
  endlocal & exit /b 1
)

set "PATH=%JAVA_HOME%\bin;%MAESTRO_HOME%;%ADB_HOME%;%PATH%"
echo JAVA_HOME=%JAVA_HOME%
echo MAESTRO_HOME=%MAESTRO_HOME%
echo ADB_HOME=%ADB_HOME%

endlocal & (
  set "JAVA_HOME=%JAVA_HOME%"
  set "MAESTRO_HOME=%MAESTRO_HOME%"
  set "ADB_HOME=%ADB_HOME%"
  set "PATH=%PATH%"
)
exit /b 0