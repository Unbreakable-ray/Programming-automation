
;@xmaxrayx ;@unbreakable-ray


#Requires AutoHotkey v2.0
#SingleInstance Force
#HotIf WinActive("ahk_exe Typora.exe")





;================================[start the engine]============================
aa := ""
modClipbord_God := ""


;===============================[Temp engine]==========================




;===============================[Debug]==========================




;================================    ==============================
;================================[`text`]============================
;================================    ============================
f1:: ; add " ` "
               {
    global aa
    A_Clipboard := "" 
    Send "^x"  
            if !ClipWait(0.5)
                { ;bold by send keybored

            ;Send '{Blind}+{Left}' ;dost work
            Send("{shift Down}^{Left}{shift Up}") 
            Send "^x"
            if !ClipWait(0.1) ;no text
                                {
                                    send ("````")
                                    send ("{Left 1}")
                                    global aa :=2 ;for Smart navigation
                                    return
                                }
                                    modClipbord_God := ""  ; there text
                                    modClipbord_God := A_Clipboard
                                    modClipbord_God := StrReplace(A_Clipboard, A_Space, "") ;remove space
                                    modClipbord_God := StrReplace(modClipbord_God, "`r`n", "") ;remove new lines
                                    ;Send ("[b]" modClipbord_God "[/b]")  too slow
                                    A_Clipboard := ("``" . modClipbord_God . "``")
                                    Send "^v"
                                    global aa := 4 ;for Smart navigation
                                    return
                                    
                } ;end of bold by keybored
                
                
                ;blod by [mouse]
                global modClipbord_God := ""  
                global modClipbord_God := A_Clipboard
                global modClipbord_God :="``" . modClipbord_God . "``"
                A_Clipboard := modClipbord_God
                Send "^v"
                
               }



+F1:: ;remove " ` "
        {
            A_Clipboard := ""
            Send '^x'
            if !ClipWait(2)
            {
                MsgBox "no text selected", "err"
                return
            }
            modClipbord_God := StrReplace(A_Clipboard, "``", "") ;remove " ` "
            A_Clipboard :=modClipbord_God
            Send "^v"
        }
;===============================[Enter]==========================

Enter::
{
    Send (".{Enter}")
}

^Enter::
{
    Send ("{Enter}")
}

+Enter::
{
Send ("<br>")
}

;===============================[Strikethrough  ~~ ]==========================


$^-::
{
A_Clipboard := ""
Send "^c"
if !ClipWait(2)
    {
    MsgBox "no text"
    return
    }
modClipbord_God := ("~~" . A_Clipboard . "~~")
A_Clipboard := modClipbord_God
Send '^v'
}