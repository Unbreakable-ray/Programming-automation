;@xmaxrayx ;@unbreakable-ray

#Requires AutoHotkey v2.0
#SingleInstance Force
#HotIf WinActive("ahk_exe Code.exe") || WinActive("ahk_exe devenv.exe") ;only works for Vicual code / studio


^q::
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
    Sleep(10)
    aa := ("/*`n" (A_Clipboard) "`n`n*/")
    A_Clipboard = aa
    Send, "^v"

    ;SendInput (aa) ;too slow
}





    /*
    Sendinput ("/*")
    Sendinput ("{Enter}")
    Sendinput (A_Clipboard)
    Sleep(100)
    Sendinput ("`n {Enter}")
    Sleep(100)
    Sendinput("*/")
    return
    */


    ;@xmaxrayx ;@unbreakable-ray
