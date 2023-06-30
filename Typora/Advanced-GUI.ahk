; @xMaxrayx @Unbreakable-ray progect first start  at 21:01:56  on 30/6/2023   (24H Formart)  (UTC +2)


#Requires AutoHotkey v2.0
#SingleInstance Force
#HotIf WinActive("ahk_exe Typora.exe")

titleUrlOutput := 'EROR NO OUTPUT FROM "mathLink()"'
isTitleAutoMode := true


F2::MsgBox "hi"








F3::{
;A_Clipboard := ""
linkRawData := A_Clipboard
MsgBox A_Clipboard "`n" linkRawData

isTitleAutoMode := true
mathLink()
SendInput titleUrlOutput


}   



;LinkGenraterGUI()










linkRawData:= "https://github.com/xmaxrayx"


titleInputByUser := "xmaxrayx's Github page"

mathLink(){


    if isTitleAutoMode = true {
    LinkTitle := RegExReplace(linkRawData ,"https://" ,"")
    global titleUrlOutput := (("[" . LinkTitle . "](" . linkRawData .")" ))
    ;MsgBox LinkTitle
    }
    else if isTitleAutoMode = false {
    ;()

    global titleUrlOutput := ("[" . titleInputByUser . "]" "(" . linkRawData . ")")
   

    }

}

LinkGenraterGUI(){
LinkGenraterGUI := Gui()
LinkGenraterGUI.Opt("-MinimizeBox -MaximizeBox +AlwaysOnTop")
LinkGenraterGUI.Add("Text", "x8 y16 w31 h28 +0x200", "URL:")
Edit_URL := LinkGenraterGUI.Add("Edit", "x48 y16 w342 h21") ;.OnEvent("Change", M)
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
if Edit_Title.Text = ""{
    MsgBox(, "Warning: no URL", "262160 T5")
}
if Edit_URL.Text = "" {
    linkRawData := Edit_Title.Text
    mathLink()
}


}
mm(){
    MsgBox "hi"
}
M(*)
{
    MsgBox "hi"
}

}