#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#persistent
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Include %A_ScriptDir%\JSON.ahk
#Include %A_ScriptDir%\CondorLib.ahk
#Persistent



compName1 := "Italian Championship A" 
compName2 := "ITALIAN CHAMPIONSHIP - A"

pwd := ""






compUrl = 0
while ( true ) {

        
    compUrl := CheckCompAlternate(compName1,compName2)




    ;ToolTip, %compUrl%

    if ( compUrl != 0) {
        url := "cndr2://" . compUrl 
        ;MsgBox, %url%
        Run, %url%
        WinWait  , MULTIPLAYER
        if (  %pwd% != "" ) {
            Sleep, 1000
            ControlSend, TspSkinEdit1, %pwd% , MULTIPLAYER
        }
        WinMove  MULTIPLAYER 100, 100
        ControlClick  Join, MULTIPLAYER
        Sleep, 1000
        ControlClick  Join, MULTIPLAYER
        Sleep, 1000
        ExitApp
    }
    Sleep 200
}










return