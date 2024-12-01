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

^+w::F11

^#Tab::^PgDn

^+#Tab::^PgUp

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

/*
**********************
****EXCEL Shortcuts
**********************
*/

#HotIf WinActive("ahk_exe DaxStudio.exe")

Media_Play_Pause::
{
    SendInput("{F5}")
}
#HotIf