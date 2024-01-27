^F5::Reload

!Volume_Up::
{
    SendInput("!{F4}")
}

!^z::
{
    If (UniqueID := WinExist("ahk_exe WindowsTerminal.exe")) {
        WinActivate("ahk_id " . UniqueID)
    }
}

!^x::
{
    If (UniqueID := WinExist("Productivity ahk_exe msedge.exe")) {
        WinActivate("ahk_id " . UniqueID)
    } else {
        SetKeyDelay , -1,-1
        Run("msedge.exe --new-window")

        If(WinWait("New tab ahk_exe msedge.exe",,4)){
            WinActivate()
            SendInput("!f")
            SendInput("l")
            SendInput("w")
            Sleep(1000)
            SendInput("Productivity{Enter}")
            Sleep(300)
            SendInput("^+o")
            Sleep(1200)
            SendInput("Daily Start")
            Sleep(800)
            SendInput("^{Enter}")
            SendInput("^w")
        }
    }
}

^#j::
{
    snippets:=EnvGet("snippets")
    Run("cmd /K jupyter lab `"" . snippets . "`"")
}


^#r:: ; Force a reset of the current window
{

    ; pid := "ahk_pid 19992"
    pid := "ahk_pid 9404"
    win_id:=WinExist(pid)
    ; MsgBox(win_id)
    If(win_id){
        ; MsgBox("Hello?")
        WinActivate(pid)
        WinWaitActive(pid, , 3)
        ; WinMove(,,1950,1100, pid)
        ; Sleep(1000)

        ; SendInput("#{Up}")
        WinMinimize(pid)
        MouseMove(20, -4, 0)
        MouseClick("left")
        MouseClick("left")
        Sleep(200)
        MouseMove(20, -4, 0)
        MouseClick("left")
        MouseClick("left")

    }

}


ReadColors()
{
    Text := FileRead("colors.txt", "UTF-8")
    Colors := StrSplit(Text, "`n")
    return Colors
}


#Include "ContextSensitive.ahk"
#Include "Hotstrings.ahk"