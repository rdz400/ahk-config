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

^!p::
{
    MyInput := InputBox("Projectnaam:", "Nieuw project Obsidian")
    Run "pwsh " . EnvGet("SCRIPTS_FOLDER") . "\new_project.ps1 " . MyInput.Value,,"Hide"
}

^!o::
{
    Run "pwsh " . EnvGet("SCRIPTS_FOLDER") . "\wrapper.ps1 ", , "Hide"
}

; Remap CapsLock to Escape to make Vim easier
CapsLock::Escape

#Include "Hotstrings.ahk"
