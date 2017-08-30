DIM objShell
msgbox "stop service"
set objShell=wscript.createObject("wscript.shell")
objShell.Run "taskkill /f /im php.exe", 0, TRUE
objShell.Run "taskkill /f /im cmd.exe", 0, TRUE
