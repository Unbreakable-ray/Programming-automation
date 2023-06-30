/* Auto-complete for AHK v2 -------------------------------------
This script provides a type-ahead (auto-complete) feature.
A word appears from a list of words.
The user can press TAB to accept the selection.
By mikeyww, with text selection by Raghava Doregowda
22 January 2023 • For AutoHotkey version 2.0.2
https://www.autohotkey.com/boards/viewtopic.php?p=503278#p503278
-----------------------------------------------------------------
*/
#Requires AutoHotkey v2.0
wordList := "
(
amanda
alex
amir
)"
wordList := Sort(wordList)
inputStart

inputStart() { ; Begin input collection
 Global suffix := ""
 ih        := InputHook('IV', "{LControl}{RControl}{LAlt}{RAlt}{LWin}{RWin}{AppsKey}"
                            . "{F1}{F2}{F3}{F4}{F5}{F6}{F7}{F8}{F9}{F10}{F11}{F12}"
                            . "{Left}{Right}{Up}{Down}{Home}{End}{PgUp}{PgDn}{Del}{Ins}"
                            . "{BS}{CapsLock}{NumLock}{PrintScreen}{Pause}{Tab}{Esc} ")
 ih.OnChar := (ih, char)   => SetTimer(inputMatch.Bind(ih, char), -100) ; Each char starts the timer
 ih.OnEnd  := inputEnded    ; Call function when input is terminated
 ih.Start
}

inputMatch(ih, char) {                                         ; Executes when typing ends & timer expires
 Global suffix := ""
 If RegExMatch(ih.Input, "D)\w+$", &prefix) &&                 ; If input ends in word chars,
    RegExMatch(wordList, "`nmi)^" prefix[] "\K.*", &suffix) {  ;  and chars match something in word list
  Send "{Text}" suffix := suffix[]                             ;  then send the suffix,
  Send "+{Left " StrLen(suffix) "}"                            ;  and select the suffix
 }
 ih.KeyOpt("{Tab}{Esc}", suffix = "" ? "-S" : "+S")            ; If suffix exists, suppress these keys
 ; ToolTip 'Input = #' ih.Input '#`nSuffix = #' suffix '#'
}

inputEnded(ih, vk := "", sc := "") {                           ; Executes when input is terminated
 ; ToolTip '#' ih.Input '# #' suffix '# #' ih.EndKey '#'
 (ih.EndKey = "F4") && (SoundBeep(1500), ExitApp())            ; F4 = exit this script
 If suffix != ""                  ; If suffix exists, handle these conditions
  Switch ih.EndKey {
   Case "Tab"   : Send '{Right}'  ; TAB is RIGHT: this will preserve the selected text
   Case "Escape": Send '{BS}'     ; ESC is BACKSPACE: this will delete the selected text
  }
 inputStart
}