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

; compName1 := "Cerdanya"
; compName2 := "Gp5"

; compName1 := "Italian Championship A" 
; compName2 := "ITALIAN CHAMPIONSHIP - A"


; compName1 := "Corona Cup" 
; compName2 := ""
; pwd := "qqqhy"


; compName1 := "NouZaChalles"
; compName2 := "AAT"

compName1 := "GP2020 srv A"
compName2 := "GP 2020"
pwd := "7sxej"


; compName1 := "Eurobattle A"  ; http://condor-danmark.dk/serverlist-2/

; compName1 := "FR07-C2 TchinTchin"
; compName2 := ""
; pwd := ""

; compName1 := "Riders du far Wave"
; compName2 := "Les rideurs du far wave"

; compName1 := "FFF"
; compName2 := ""

; compName1 := "muge1"
; compName2 := ""

; compName1 := "13h30 Le pousse cafe"
; compName2 := ""

; compName1 := "GLGC Draak"
; compName2 := ""
 


compUrl = 0
while ( true ) {

        
    compUrl := CheckCompAlternate(compName1,compName2)

    if ( compUrl == 0) { 
        compUrl := CheckCompVirtualsoaring(compName1,compName2)
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