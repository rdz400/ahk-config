
$loc = "$($env:APPDATA)\Microsoft\Windows\Start Menu\Programs\Startup\ahk.lnk"

# Ahk Script
$script_loc = Get-Item ".\AutoHotkey64.ahk"

# Ahk Executable
$ahk_executable = Get-Item "$Env:LOCALAPPDATA\Programs\AutoHotkey\v2\AutoHotkey64.exe"
$ahk_dir = $ahk_executable.Directory

# Create the shortcut
$WScriptObj = New-Object -ComObject ("WScript.Shell")
$shortcut = $WscriptObj.CreateShortcut($loc)
$target_arg = "`"$($script_loc)`""

$shortcut.TargetPath = $ahk_executable.FullName
$shortcut.Arguments = "$target_arg"
$shortcut.WorkingDirectory =  $ahk_dir.FullName

$shortcut.Save()



