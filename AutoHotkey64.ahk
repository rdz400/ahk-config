^F5::Reload

!Volume_Up::SendInput "!{F4}"

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

#Include "Hotstrings.ahk"
