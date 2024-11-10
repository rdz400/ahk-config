^F5::Reload

!Volume_Up::SendInput "!{F4}"

GroupAdd "msedge", "ahk_exe msedge.exe"
GroupAdd "drawio", "ahk_exe draw.io.exe"

^!x::GroupActivate "msedge"

^!d::GroupActivate "drawio"

!^z::
{
    If (UniqueID := WinExist("ahk_exe WindowsTerminal.exe")) {
        WinActivate("ahk_id " . UniqueID)
    }
}

!^c::
{
    If (UniqueID := WinExist("ahk_exe Obsidian.exe")) {
        WinActivate("ahk_id " . UniqueID)
    }
}

^!p::
{
    MyInput := InputBox("Projectnaam:", "Nieuw project Obsidian")
    Run "pwsh " . EnvGet("SCRIPTS_FOLDER") . "\new_project.ps1 " . MyInput.Value,,"Hide"
}

^!o::
{
    Run "pwsh " . EnvGet("SCRIPTS_FOLDER") . "\wrapper.ps1 ", , "Hide"
}


#Include "Hotstrings.ahk"
