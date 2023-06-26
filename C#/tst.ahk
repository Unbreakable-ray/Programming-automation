#SingleInstance Force

#Requires AutoHotkey v2


MyGui_Create()

Return


MyGui_Create(){

	MyGui := Gui(, "New Gui")


	Chk1 := MyGui.AddCheckBox(, "CheckBox")

	Btn1 := MyGui.AddButton("x63 y85", "&OK")

	Btn2 := MyGui.AddButton("x22 y169 w164 h35", "&OK")

	MyGui.Show("w300 h300")

ogcButtonreplcenewline := myGui.Add("Button", "x7 y21 w133 h36", "replce new line")
ogcButtonreplcenewline.OnEvent("Click", ww.Bind("Normal"))
ww : MsgBox "[C# comment]"  "`n`n" . winStatus, "Debug C# assistant"
	Return




}