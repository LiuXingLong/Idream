::守护进程监控脚本
@echo off
::变量延迟
setlocal enabledelayedexpansion   
  
:start
FOR /F "eol=# tokens=1,2,3* delims=; " %%i in (waicp_conf.txt) do (
	set /p pid=<%%j	
	set status=0
	FOR /F "tokens=4 delims= " %%n in ('qprocess.exe * ^| find "%%i"') do (							
		if !pid! == %%n (
			set status=1					
		)											
	)
	if !status! == 0 (
		start %%k %%l
	)
)
pause