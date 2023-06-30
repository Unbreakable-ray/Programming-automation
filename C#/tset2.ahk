; Create the list box with three items:
myGui := Gui()
ogcMyListBoxVar := myGui.Add("ListBox", "r3 w200  vMyListBoxVar", ["Apple", "Banana", "Orange"])
ogcMyListBoxVar.OnEvent("DoubleClick", MyListBox.Bind("DoubleClick"))

; Define the hotstring that will show the GUI window:
::ak::
; Send a special character (Left-to-Right Mark) and select it:
{ ; V1toV2: Added bracket
SendInput("{U+200E}{Shift Down}{Left}{Shift Up}")

; Get the position of the selected character:
CaretGetPos(&x, &y)

; Delete the character:
SendInput("{Backspace}")

; Show the GUI window at the position of the text cursor:
myGui.Opt("+ToolWindow +AlwaysOnTop -Caption ")


myGui.BackColor := "EEAA99"

 ; This will show only the list box without the frame
myGui.Show("x" . 47 . " y" . 47)

WinSetTransColor("EEAA99", MyGui)



;WinSetTransColor  "EEAA99" , "myGui"

;WinSetTransparent("Black", "barrier")

return
; The script will be notified whenever the user selects an item from the list box.
} ; Added bracket before function


MyListBox(A_GuiEvent, GuiCtrlObj, Info, *)
{ ; V1toV2: Added bracket
if (A_GuiEvent = "DoubleClick") ; If the user double-clicks
{
    MyListBoxVar := ogcMyListBoxVar.Text ; Get the value of the selected item
    myGui.Hide() ; Hide the GUI window
    ;WinActivate("ahk_class CabinetWClass") ; Activate File Explorer
    Sleep(100)
    SendInput(MyListBoxVar) ; Send the value to the active window
}

return


; Define a hotkey for Enter that will check if the list box is visible and act accordingly:
} ; V1toV2: Added Bracket before hotkey or Hotstring
Enter::
{ ; V1toV2: Added bracket
if WinExist("ahk_class AutoHotkeyGUI") ; If the list box is visible
{
    MyListBoxVar := ogcMyListBoxVar.Text ; Get the value of the selected item
    myGui.Hide() ; Hide the GUI window
    ; Activate File Explorer
    SendInput(MyListBoxVar) ; Send the value to the active window
}
else ; If the list box is not visible
{
    SendInput("{Enter}") ; Send a normal Enter key
}
return
} ; V1toV2: Added bracket in the end

