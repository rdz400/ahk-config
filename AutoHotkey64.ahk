^F5::Reload

!Volume_Up::
{
    SendInput("!{F4}")
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


^#e::
{
    ClippedText:=A_Clipboard
    If(RegExMatch(ClippedText, "^[\s\d]*$")){
        NewText:=RegExReplace(ClippedText, "(\s+)", " ")
        NewText:=Trim(NewText)
        NewText:=RegExReplace(NewText, " ", ",")
        SumInts:=0
        Loop Parse, NewText, ",", A_Space A_Tab{
            If(IsNumber(A_LoopField)){
                SumInts:= SumInts + A_LoopField
            }
        }
        MsgBox(SumInts)
    }
}

^#f::
{
    Result:=Trim(A_Clipboard, OmitChars := "`"")
    OneDrive := StrReplace(Trim(EnvGet("OneDrive")), "\", "\\")
    OneDriveExcelPattern := "^" . OneDrive . "\\.+xlsx$"
    MsgBox(OneDrive)
    MsgBox(OneDriveExcelPattern)
    If(RegExMatch(Result, OneDriveExcelPattern)){
        NewStr := RegExReplace(Result
            ,OneDrive . "\\"
            ,"https://d.docs.live.net/cbe61d18a08ced95/"
            ,
            ,1)

        NewStr := RegExReplace(NewStr
            ,"\\"
            ,"/")
        NewClipBoard:="ms-excel:" . NewStr
        ; MsgBox "ms-excel:" . NewStr
        A_Clipboard := NewClipBoard
    } Else{
        MsgBox "Nope no match for " . Result
    }
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


^#g::
{
    MyGui := Gui()
    MyGui.Add("Text",, "Pick a file to launch from the list below.")
    LB := MyGui.Add("ListBox", "w640 r10")
    LB.OnEvent("DoubleClick", LaunchFile)
    Loop Files, "C:\*.*"  ; Change this folder and wildcard pattern to suit your preferences.
        LB.Add([A_LoopFilePath])
    MyGui.Add("Button", "Default", "OK").OnEvent("Click", LaunchFile)
    MyGui.Show()

    LaunchFile(*)
    {
        if MsgBox("Would you like to launch the file or document below?`n`n" LB.Text,, 4) = "No"
            return
        ; Otherwise, try to launch it:
        try Run(LB.Text)
        if A_LastError
            MsgBox("Could not launch the specified file. Perhaps it is not associated with anything.")
    }
}

ReadColors()
{
    Text := FileRead("colors.txt", "UTF-8")
    Colors := StrSplit(Text, "`n")
    return Colors
}

^#t::
{

    NewGui := Gui(, "Test Gui")
    NewGui.Opt("+AlwaysOnTop +Resize")
    NewGui.SetFont(, "Roboto")
    colors := ReadColors()
    for index, element in colors
    {   
        my_label := Format("vLabel{:.0d}", index)
        my_bg := Format("Background{}", Trim(element, "`r"))
        full_option := Trim(Format("h20 Y+0 {} w200 {}", my_label, my_bg))
        NewGui.Add("Edit", full_option, element)
    }

    NewGui.Show()

    LaunchFile(*)
    {
        ; MsgBox(lb.Text)
        if A_LastError
            MsgBox("Could not launch the specified file. Perhaps it is not associated with anything.")
    }
}


#Include "ContextSensitive.ahk"
#Include "Hotstrings.ahk"