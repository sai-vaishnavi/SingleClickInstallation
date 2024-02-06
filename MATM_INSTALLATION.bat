cd %cd%

start /wait jdk-8u281-windows-x64.exe /s REBOOT=Suppress

apache-tomcat-9.0.41.exe /S

cmd /k "adminrun.bat"

pause