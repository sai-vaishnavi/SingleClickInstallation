@echo off

call :isAdmin

if %errorlevel% == 0 (
    goto :run
) else (
    echo Requesting administrative privileges...
    goto :UACPrompt
)

exit /b

:isAdmin
    fsutil dirty query %systemdrive% >nul
exit /b

:run

xcopy /f  /Y /O "C:\Users\G Sai Vaishnavi\Desktop\matmweb.war" "C:\Program Files\Apache Software Foundation\Tomcat 9.0\webapps"  

replace "C:\Users\G Sai Vaishnavi\Desktop\server.xml" "C:\Program Files\Apache Software Foundation\Tomcat 9.0\conf" 

cmd /k  "C:\Program Files\Apache Software Foundation\Tomcat 9.0\bin\Tomcat9.exe"

pause

exit /b

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %~1", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
exit /B

