

$loc = "$($env:APPDATA)\Microsoft\Windows\Start Menu\Programs\Startup\ahk.lnk"
$pad = Get-ChildItem ".\AutoHotkey64.exe"
$source_path = $pad.FullName

$WScriptObj = New-Object -ComObject ("WScript.Shell")
$shortcut = $WscriptObj.CreateShortcut($loc)
$shortcut.TargetPath = $source_path
$shortcut.Save()