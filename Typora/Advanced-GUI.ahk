; @xMaxrayx @Unbreakable-ray progect first start  at 21:01:56  on 30/6/2023   (24H Formart)  (UTC +2)


#Requires AutoHotkey v2.0
#SingleInstance Force
#HotIf WinActive("ahk_exe Typora.exe")||("ahk_exe Notebad.exe")||("ahk_exe notepad++.exe")


;//////////////////// global virable
titleUrlOutput := 'Tell a programmer: EROR NO OUTPUT FROM "mathLink()"'
isTitleAutoMode := true
LinkTitle := "Tell a programmer: didnt recive any data for Tite math"
linkRawData := "Tell a proggrmmer: didnt revive URL data"



;/////// Debug mode

isDebugMode := true




F2::MsgBox "hi"


F3::{
global linkRawData := A_Clipboard

if isDebugMode = true { 
MsgBox "A-Clipboread:[" . A_Clipboard . "]`n`n URL RAW:[" . linkRawData . "]`n`n MathUrlTitl: didn't start (not a bug)" , "Debug mode" , "262208"
}
isTitleAutoMode := true
mathLink()
SendInput titleUrlOutput
}   



+F3::LinkGenraterGUI()










;linkRawData:= "https://github.com/xmaxrayx"


;titleInputByUser := "xmaxrayx's Github page"

mathLink(){
    
    if isTitleAutoMode = true {
    global LinkTitle
    global linkRawData
    global LinkTitle :=  linkRawData
    ;LinkTitle := RegExReplace(linkRawData ,"https://" "http://" ,"")
    ;global LinkTitle := StrReplace(LinkTitle, "https://", "")
    global LinkTitle := StrReplace(LinkTitle, "http://", "")

    Sleep (10)
    ;LinkTitle := RegExReplace(linkRawData ,"http://" ,"")
    global titleUrlOutput := ('[' . LinkTitle . ']' '(' . linkRawData . ')' )
    ;MsgBox LinkTitle
    }
    else if isTitleAutoMode = false {
        
        MsgBox("Tell a programmer: wrong `"If`" logic (isTitleAutoMode) Code #EAMSAK342103Ak ", "ERROR", "16")
    
    }
    if isDebugMode = true {
        MsgBox "Link title:" . LinkTitle . "`n`nLink Raw Data:" . linkRawData . "`n`nOutput:" . titleUrlOutput ,"Debug", "262208"
    }
}

LinkGenraterGUI(){
LinkGenraterGUI := Gui()
LinkGenraterGUI.Opt("-MinimizeBox -MaximizeBox +AlwaysOnTop")
LinkGenraterGUI.Add("Text", "x8 y16 w31 h28 +0x200", "URL:")
Edit_URL := LinkGenraterGUI.Add("Edit", "x48 y16 w342 h21")
Edit_URL.OnEvent("Change", M)
Edit_Title := LinkGenraterGUI.Add("Edit", "x48 y88 w351 h21")
LinkGenraterGUI.Add("Text", "x8 y88 w33 h27 +0x200", "Title :")
SB := LinkGenraterGUI.Add("StatusBar", , "Status Bar")
SB.Text := "Link Title Genrator`t`t@xMaxrayx @Unbreakable-ray"
LinkGenraterGUI.Add("Button", "x128 y141 w154 h47", "&OK").OnEvent("Click", gTitlemath)

;LinkGenraterGUI.OnEvent('Close', (*) => ExitApp())
LinkGenraterGUI.Title := "Title Genrater"
LinkGenraterGUI.Show("w414 h224")
Return

LinkGenraterGUIEscape:
LinkGenraterGUIClose:
    ;ExitApp()

gTitlemath(*){
if Edit_URL.Text = "" {
    MsgBox(, "Warning: no URL", "262160 T5")
    return
}
if Edit_Title.Text = "" {
    m()
   global linkRawData := Edit_URL.Text
    MsgBox linkRawData "`n`n" , , "262160"
    mathLink()
    MsgBox( titleUrlOutput, , "262160")
    A_Clipboard := titleUrlOutput
}


}
mm(){
    MsgBox "hi"
}
M(*)
{
    ;linkRawData := 
}

}