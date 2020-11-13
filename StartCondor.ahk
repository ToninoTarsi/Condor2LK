#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#persistent
#SingleInstance force  
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Include %A_ScriptDir%\JSON.ahk
#Include %A_ScriptDir%\CondorLib.ahk
#Persistent
compName2 := ""
pwd := ""

Run RunDll32.exe InetCpl.cpl`,ClearMyTracksByProcess 8	
Run RunDll32.exe InetCpl.cpl`,ClearMyTracksByProcess 2


; Server name

compName1 := "IWC"  ; http://condor-danmark.dk/serverlist-2/


;compName1 := "Les rideurs du far wave"

;compName1 := "Eurobattle A"
 

compUrl = 0
while ( true ) {

        
    compUrl := CheckCompAlternate(compName1,compName2)

    if ( compUrl == 0) { 
        compUrl := CheckCompJson(compName1,compName2)
    }


    ; if ( compUrl == 0) { 
    ;     compUrl := CheckCompOfficial(compName1,compName2)
    ; }

    ;ToolTip, %compUrl%

    if ( compUrl != 0) {
        url := "cndr2://" . compUrl 
        ;MsgBox, %url%
        Run, %url%
        WinWait  , MULTIPLAYER
        if (  pwd != "" ) {
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
    ;Sleep 1000
}








return