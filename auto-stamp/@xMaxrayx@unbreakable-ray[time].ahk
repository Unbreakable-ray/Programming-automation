#Requires AutoHotkey v2.0
#SingleInstance Force
#HotIf WinActive("ahk_exe vivaldi.exe") || WinActive("ahk_exe devenv.exe") || WinActive("ahk_exe Code.exe") ;|| WinActive("ahk_exe Typora.exe")  ;only works for these

f1::
{
;date and auther
timeString :=FormatTime(,"'   at' HH:mm:ss  'on' d/M/yyyy   '(24H Formart)  (UTC +2)'")
author :="@xMaxrayx @Unbreakable-ray"

;stamp
stamp := author timeString

;MsgBox stamp  
  
A_Clipboard := stamp
Send    '^v' 
}
