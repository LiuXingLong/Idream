DIM objShell
msgbox "restart service"
set objShell=wscript.createObject("wscript.shell")   
objShell.Run "taskkill /f /im cmd.exe", 0, TRUE
objShell.Run "restart.bat", 0, TRUE