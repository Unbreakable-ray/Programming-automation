; Create the list box with three items:
Gui, Add, ListBox,  r3 w200 gMyListBox vMyListBoxVar, Apple|Banana|Orange

; Define the hotstring that will show the GUI window:
::ak::

SendInput {Backspace}




Gui, +LastFound -Caption +ToolWindow +AlwaysOnTop 
Gui, Show, x%xpos% y%ypos%
CustomColor = EEAA99  
Gui, Color, %CustomColor%
WinSet, TransColor, %CustomColor% 1000


return

; The script will be notified whenever the user selects an item from the list box.
MyListBox:
if (A_GuiEvent = "DoubleClick") ; If the user double-clicks
{
    GuiControlGet, MyListBoxVar ; Get the value of the selected item
    Gui Hide ; Hide the GUI window
    WinActivate ahk_class CabinetWClass ; Activate File Explorer
    SendInput %MyListBoxVar% ; Send the value to the active window
}
return

; Define a hotkey for Enter that will check if the list box is visible and act accordingly:
Enter::
if WinExist("ahk_class AutoHotkeyGUI") ; If the list box is visible
{
    GuiControlGet, MyListBoxVar ; Get the value of the selected item
    Gui Hide ; Hide the GUI window
    WinActivate ahk_class CabinetWClass ; Activate File Explorer
    SendInput %MyListBoxVar% ; Send the value to the active window
}
else ; If the list box is not visible
{
    SendInput {Enter} ; Send a normal Enter key
}
return
