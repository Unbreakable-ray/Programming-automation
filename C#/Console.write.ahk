#Requires AutoHotkey v2.0
#SingleInstance Force
#HotIf WinActive("ahk_exe Code.exe") ;only works for Vicual code
#HotIf WinActive("ahk_exe devenv.exe") ;only works for visual studio 


F1::
{
SendInput ("Console.WriteLine(`"`")`;")
Send ("{Left 3}")
return
}


F2::
{
SendInput ("Console.Write(`"`")`;")
Send ("{Left 3}")
return
}


;@xmaxray @unbreakable-ray 