# Dit werkt niet meer, ik maak nu een shortcut van AutoHotkey64.ahk en sla
# deze op in Startup (de folder die je hieronder ziet)

$loc = "$($env:APPDATA)\Microsoft\Windows\Start Menu\Programs\Startup\ahk.lnk"
$pad = Get-ChildItem ".\AutoHotkey64.ahk"
$source_path = $pad.FullName

$WScriptObj = New-Object -ComObject ("WScript.Shell")
$shortcut = $WscriptObj.CreateShortcut($loc)
$shortcut.TargetPath = $source_path
$shortcut.Save()