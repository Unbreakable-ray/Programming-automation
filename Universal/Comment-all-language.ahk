
;@xmaxrayx ;@unbreakable-ray


#Requires AutoHotkey v2.0
#SingleInstance Force
#HotIf WinActive("ahk_exe Code.exe") || WinActive("ahk_exe devenv.exe") ;only works for Vicual code / studio

;================================[start the engine]============================
Language := ""


;===============================[Temp engine]==========================




;===============================[Debug]==========================


F12::
{ ; V1toV2: Added bracket
Suspend()
If A_IsSuspended {
        
        myGui := Gui()
        myGui.BackColor := "0xFF2D2D"
        myGui.Opt("-caption +toolwindow +AlwaysOnTop")
        myGui.SetFont("s30 bold", "Tahoma")
        ogctextTX := myGui.add("text", "vTX cBlack", "Off")
        myGui.Title := "TRANS-WIN"
        myGui.Show("x" ((A_ScreenWidth*0.5)-50) " y" A_ScreenHeight-130)
   ;WinSet TransColor, White, TRANS-WIN
        Sleep(200)
		SoundBeep(4500)
		myGui.Destroy()


} Else {
        myGui.BackColor := "0x00FF40"
        myGui.Opt("-caption +toolwindow +AlwaysOnTop")
        myGui.SetFont("s30 bold", "Tahoma")
        ogctextTX := myGui.add("text", "vTX cBlack", "On")
        myGui.Title := "TRANS-WIN"
        myGui.Show("x" ((A_ScreenWidth*0.5)-50) " y" A_ScreenHeight-130)
   ;WinSet TransColor, White, TRANS-WIN
        Sleep(200)
		SoundBeep(800)
		myGui.Destroy()

 
}
} ; V1toV2: Added bracket in the end
