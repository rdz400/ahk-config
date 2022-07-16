/*
**********************
****OneNote Shortcuts
**********************
*/

#HotIf WinActive("ahk_exe ONENOTE.EXE")

^Del::
{
    SendInput("^!g")
    Sleep(100)
    SendInput("{Enter}{Del}")
    SendInput("^!g")
}

#^c::
{
    If (A_Cursor == "IBeam"){
        Sleep(250)
        SendInput("{LAlt}")
        Sleep(250)
        SendInput("hff")
        SendInput("Roboto Mono{Enter}")
        SendInput("{Esc}")
    }
}

/*
**********************
****File Explorer Shortcuts
**********************
*/

#HotIf WinActive("ahk_exe Explorer.EXE")
^+c::
{
    A_Clipboard:=""
    ; SendInput("{Shift down}{F10 down}")
    ; SendInput("{Shift up}{F10 up}")
    SendInput("+{F10}")
    Sleep(100)
    SendInput("a")
    If !ClipWait(3){
        MsgBox("Failed to copy")
    }
    A_Clipboard:=Trim(A_Clipboard, "`"' ")
}

/*
**********************
****EXCEL Shortcuts
**********************
*/

#HotIf WinActive("ahk_exe EXCEL.EXE")
#\::
{
    A_Clipboard:=""
    Sleep(200)
    SendInput("{LAlt}fic")
    ClipWait  ; Wait for the clipboard to contain text.
    Result :=  Trim(A_Clipboard, "`"")
    SendInput("{Esc}")
    NewClipBoard:="ms-excel:" . Result
    A_Clipboard := NewClipBoard
}
#HotIf