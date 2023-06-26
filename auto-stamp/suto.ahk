#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%
;Typing aid
;  Press 1 to 0 keys to autocomplete the word upon suggestion
;  (0 will match suggestion 10)
;                                  - Jordi S
;                               Heavily modified by:
;                                  - Maniac
;                               modified by:
;                                  - Asaptrad
;                                  - Artwinauto.com
;___________________________________________

SplashTextOn,400,100,,TypingAid Program version 1.0 from Artwinauto.com. Credits: Jordi S, Maniac, Asaptrad @ AutoHotKey Forum
Sleep, 3000
SplashTextOff

;    CONFIGURATIONS

; Editor Window Recognition
; (make it blank to make the script seek all windows)

ETitle =

;Minimum word length to make a guess
WLen = 3
keyagain=
key=
clearword=1
;Gosub,clearallvars   ; clean vars from start

; Press 1 to 0 keys to autocomplete the word upon suggestion
; (0 will match suggestion 10)
;_______________________________________

CoordMode, ToolTip, Relative
AutoTrim, Off

;reads list of words from file
Loop, Read,  %A_ScriptDir%\Wordlist.txt   
{
   StringLeft, Base, a_loopreadline, %wlen%
   Base := ConvertWordToAscii(Base)
   basenum%Base%++
   pos := basenum%Base%
   cmd%Base%%pos% = %a_loopreadline%
}
SetTimer, Winchanged, 100

Loop
{
   ;Editor window check
    WinGetActiveTitle, ATitle
    WinGet, A_id, ID, %ATitle%
    IfNotInString, ATitle, %ETitle%
    {
      ToolTip
      Setenv, Word,
      sleep, 500
      Continue
  }
   
   ;Get one key at a time
   Input, chr, L1 V,{enter}{space}.;`:¿?¡!"()]{}{}}{bs}{{}{esc}{tab}{Home}{End}{PgUp}{PdDn}{Up}{Dn}{Left}{Right}
   EndKey = %errorlevel%
   ; If active window has different window ID from before the input, blank word
   ; (well, assign the number pressed to the word)   
   WinGetActiveTitle, ATitle
   WinGet, A_id2, ID, %ATitle%
   IfNotEqual, A_id, %A_id2%
   {
      Gosub,clearallvars
      Setenv, Word, %chr%
      Continue
   }
   
   ifequal, OldCaretY,
        OldCaretY = %A_CaretY%
   ifnotequal, OldCaretY, %A_CaretY%
   {
         Gosub,clearallvars
         Setenv, Word, %chr%
         Continue
         
   }
   
   OldCaretY=%A_CaretY%
   
      ;Backspace clears last letter
      ifequal, EndKey, Endkey:BackSpace
      {
        StringLen, len, Word
        IfNotEqual, len, 0
         { ifequal, len, 1
            {
            Gosub,clearallvars
            } else {
                     StringTrimRight, Word, Word, 1
                   }     
         }
   } else ifequal, EndKey, Max
         {
         ifequal, chr, @
                  {
                     Gosub,clearallvars
                     Setenv, Word, %chr%
                     Continue
                  } else {
                           Setenv, Word, %word%%chr%
                           }
            } else Gosub,clearallvars
   
   ;Wait till minimum letters
   StringLen, len, Word
   IfLess, len, %wlen%
   {
      ToolTip
      Continue
   }
   
   ;Match part-word with command
   Num =
   Match =
   singlematch = 0
   number = 0
   StringLeft, baseword, Word, %wlen%
   baseword := ConvertWordToAscii(baseword)
   Loop
   {
      IfEqual, cmd%baseword%%a_index%,, Break
      IfEqual, number, 10
         Break
      StringLen, chars, Word
      StringLeft, strippedcmd, cmd%baseword%%a_index%, %chars%
      ifequal, strippedcmd, %Word%
      {
            number ++
            singlematch := cmd%baseword%%a_index%
            match = %match%%number%. %singlematch%`n
            singlematch%number% = %singlematch%
           
            Continue           
      }
}
   ;If no match then clear Tip
   IfEqual, Match,
   {
      clearword=0
      Gosub,clearallvars
      Continue
   }
   
   ;Show matched command
   StringTrimRight, match, match, 1        ; Get rid of the last linefeed
   WinGetActiveTitle, ATitle
   WinGetPos, , PosY, , SizeY, %ATitle%
   MaxY := PosY + SizeY
   ToolTipSizeY := (number * 12)
   ToolTipPosY := A_CaretY+24
   if ((ToolTipSizeY + ToolTipPosY) > MaxY)
       ToolTipPosY := (A_CaretY - 14 - ToolTipSizeY)
   IfNotEqual, Word,,ToolTip, %match%, %A_CaretX%, %ToolTipPosY%
   ; +14 Move tooltip down a little so as not to hide the caret.
}

; Timed function to detect change of focus (and remove tooltip when changing active window)
Winchanged:
   WinGetActiveTitle, ATitle
   WinGet, A_id3, ID, %ATitle%
   IfNotEqual, A_id, %A_id3%
   {
      ToolTip ,
   } else {
            ; If we are in the correct window, and OldCaretY is set, clear the tooltip if not in the same line
            IfInString, ATitle, %ETitle%
            {
               IfNotEqual, OldCaretY,
               {
                  IfNotEqual, OldCaretY, %A_CaretY%   
                  {
                     ToolTip,
                  }
               }
            }
         }
   Return
   
; Key definitions for autocomplete (0 to 9)
#MaxThreadsPerHotkey 1
$1::
key=1
Gosub, checkword
Return

$2::
key=2
Gosub, checkword
Return

$3::
key=3
Gosub, checkword
Return

$4::
key=4
Gosub, checkword
Return

$5::
key=5
Gosub, checkword
Return

$6::
key=6
Gosub, checkword
Return

$7::
key=7
Gosub, checkword
Return

$8::
key=8
Gosub, checkword
Return

$9::
key=9
Gosub, checkword
Return

$0::
key=10
Gosub, checkword
Return

^+c::
text =
ClipBoard =
Sleep, 100
SendInput, ^c
Sleep, 200
text = %Clipboard%

found = 0

Loop, Read, wordlist.txt
{
	If text = %A_LoopReadLine%
	found = 1
}

If found = 0
FileAppend, %text%`n, wordlist.txt

Reload
Sleep 200

Return


; If hotkey was pressed, check wether there's a match going on and send it, otherwise send the number(s) typed
checkword:
   clearword=1

   ; If active window has different window ID from before the input, blank word
   ; (well, assign the number pressed to the word)
   WinGetActiveTitle, ATitle
   WinGet, A_id2, ID, %ATitle%
   IfNotEqual, A_id, %A_id2%
      {
         if key =10
            key = 0
         SendInput,%key%
         Gosub,clearallvars
         Return
      }
     
   IfNotEqual, OldCaretY, %A_CaretY%
      {
         if key =10
            key = 0
         SendInput,%key%
         Gosub,clearallvars
         Return
      }

   if word=        ; only continue if word is not empty
      {
         if key =10
            key = 0
         SendInput,%key%
         Setenv, Word, %key%
         clearword=0
         Gosub,clearallvars
         Return
      }
   
   ifequal, singlematch%key%,   ; only continue singlematch is not empty
      {
         if key =10
            key = 0
         SendInput,%key%
         Setenv, Word, %word%%key%
         clearword=0
         Gosub,clearallvars
         Return
      }

   ; SEND THE WORD!
   if key =0
      key = 10
   sending := SubStr(singlematch%key%, len+1)
   StringLen, len, Word   
   SendInput, {Raw}%sending% ; Send word (Raw because we want the substring exactly as in wordlist.txt)
   
   Gosub,clearallvars
   Return


; This is to blank all vars related to matches, tooltip and (optionally) word
clearallvars:
      Ifequal,clearword,1,Setenv,word,
      ToolTip
      ; Clear all singlematches
      Loop, 10
      {
         singlematch%a_index% =
      }
      sending =
      key=
      match=
      clearword=1
      OldCaretY=
      Return
     
ConvertWordToAscii(Base)
{
   StringUpper, Base, Base
   StringLen, Len, Base
   Loop, %Len%
   {
      Transform, Letter, Asc, %Base%
      StringLen, LetterLen, Letter
      IfLess, %LetterLen%, 3
      {
         Amt := 3-LetterLen
         Loop, %Amt%
         {
            Letter = 0%Letter%
         }
      }
      New = %New%%Letter%
      StringTrimLeft, Base, Base, 1
   }
Return New
}