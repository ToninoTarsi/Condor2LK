#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#persistent
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Include %A_ScriptDir%\JSON.ahk
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



CheckCompAlternate(compName1,compName2)
{
    ;Prepare our WinHttpRequest object
    HttpObj := ComObjCreate("WinHttp.WinHttpRequest.5.1")
    HttpObj.SetTimeouts(6000,6000,6000,6000) ;Set timeouts to 6 seconds

    url := "http://condor.hitziger.net/serverlist/scripts/php/RequestData.php?data=%7B%22joinable%22%3Atrue%2C%22waiting%22%3Afalse%2C%22race%22%3Afalse%2C%22detail%22%3A0%2C%22search%22%3A%22%22%2C%22lastrefresh%22%3A0%7D"
    HttpObj.Open("GET",URL)
    HttpObj.Send()

    ;sleep 200
    r := HttpObj.Responsetext

    j := json.load(r) ; convert JSON Response to AHK object

    ;msgbox % r

    for k, v in j.server {
        name := v.name
        url := v.url
        stat := v.status
        serverversion := v.serverversion
        ;MsgBox %serverversion%
        if ( serverversion == 2 && %stat% == "0" ) {
            if ( compName1 != "" ) {
                IfInString, name, %compName1%
                {
                    return url 

                }
            }
            if ( compName2 != "" && %stat% == 0  ) {
                IfInString, name, %compName2%
                {
                    return url 

                }
            }
        }

    }
    return 0
}








return