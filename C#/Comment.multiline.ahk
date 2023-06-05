#Requires AutoHotkey v2.0
#SingleInstance Force
;#HotIf WinActive("ahk_exe Code.exe") ;only works for Vicual code
;#HotIf WinActive("ahk_exe devenv.exe") ;only works for visual studio 

^Q::
{
    aa := ""
    A_Clipboard := ""
    Send "^c"
    if !ClipWait(0.1)
        {
            send ("`n/*`n`n*/")
            send("{Up}")
            return
        }
    ;aa := ("/*`n" (A_Clipboard"`n") "`n*/")
    Sleep(10)
    SendInput ("/*`n" (A_Clipboard) "{Enter}*/")
    return
}
