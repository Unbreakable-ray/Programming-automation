CustomColor = EEAA99  
Gui, +LastFound +AlwaysOnTop -Caption +ToolWindow
Gui, Font, s32

Gui, Color, %CustomColor%
WinSet, TransColor, %CustomColor% 1000
Gui, Show, AutoSize,NoActivate  