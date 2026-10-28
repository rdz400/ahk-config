; Hotkey modifier symbols:
;   #  Win
;   !  Alt
;   ^  Ctrl
;   +  Shift
;   <  / >  Left / right variant of the modifier that follows (e.g. <^ = left Ctrl)
;   ~  Let the key's native function pass through as well
;   *  Fire even when extra modifiers are held down
;   $  Prevent the hotkey from being triggered by its own Send

^F5::Reload

!Volume_Up::SendInput "!{F4}"

GroupAdd "msedge", "ahk_exe msedge.exe"
GroupAdd "drawio", "ahk_exe draw.io.exe"
GroupAdd "code", "ahk_exe Code.exe"

^!x::GroupActivate "msedge"
^!d::GroupActivate "drawio"
^!s::GroupActivate "code"

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

^!t::
{
    If (UniqueID := WinExist("ahk_exe ms-teams.exe")) {
        WinActivate("ahk_id " . UniqueID)
    } Else {
        Run "explorer.exe shell:AppsFolder\MSTeams_8wekyb3d8bbwe!MSTeams"
    }
}

; Copilot key + O: open Outlook (the Copilot key sends LShift + LWin + F23)
F23 & o::
{
    If (UniqueID := WinExist("ahk_exe OUTLOOK.EXE")) || (UniqueID := WinExist("ahk_exe olk.exe")) {
        WinActivate("ahk_id " . UniqueID)
    } Else {
        Run "outlook.exe"
    }
}

; Center the active window on the monitor it is currently on
#!c::
{
    If !(UniqueID := WinExist("A")) || WinGetMinMax("ahk_id " . UniqueID) != 0
        Return
    WinGetPos(&X, &Y, &W, &H, "ahk_id " . UniqueID)
    MonitorGetWorkArea(GetMonitorAt(X + W // 2, Y + H // 2), &Left, &Top, &Right, &Bottom)
    WinMove(Left + (Right - Left - W) // 2, Top + (Bottom - Top - H) // 2, , , "ahk_id " . UniqueID)
}

GetMonitorAt(X, Y)
{
    Loop MonitorGetCount() {
        MonitorGet(A_Index, &Left, &Top, &Right, &Bottom)
        If (X >= Left && X < Right && Y >= Top && Y < Bottom)
            Return A_Index
    }
    Return MonitorGetPrimary()
}


; Remap CapsLock to Escape to make Vim easier
CapsLock::Escape

#Include "Hotstrings.ahk"
