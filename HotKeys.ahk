^F5::Reload

!Volume_Up::SendInput "!{F4}"


Numpad9::SendInput "01-projects"

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

Launch_App2::SendInput "="

;#Include "ContextSensitive.ahk"
#Include "Hotstrings.ahk"
