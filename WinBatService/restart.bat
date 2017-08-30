::守护进程监控脚本
@echo off
::变量延迟
setlocal enabledelayedexpansion   

:restart
taskkill /f /im php.exe
FOR /F "eol=# tokens=1,2,3* delims=; " %%i in (waicp_conf.txt) do (	
	start /b %%k %%l
)
goto sleep

:start
FOR /F "eol=# tokens=1,2,3* delims=; " %%i in (waicp_conf.txt) do (
	set /p pid=<%%j
	set status=0
	FOR /F "tokens=2 delims= " %%n in ('tasklist.exe ^|find "%%i"') do ( 
		if !pid! == %%n (
			set status=1					
		)											
	)
	if !status! == 0 (
		start /b %%k %%l
	)
)
goto sleep

:sleep
ping /n 3 127.1 >nul
goto start