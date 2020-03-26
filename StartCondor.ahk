#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#persistent
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Include %A_ScriptDir%\JSON.ahk
#Persistent


compName := "Quarantine"


compUrl = 0
while ( true ) {

    compUrl := CheckComp(compName)
    ;MsgBox  %compUrl%

    if ( compUrl != 0) {
        url := "cndr2://" . compUrl 
        ;MsgBox, %url%
        Run, %url%
        WinWait  , MULTIPLAYER
        ControlClick  Join, MULTIPLAYER
        ExitApp
    }
    Sleep 2000
}



CheckComp(compName)
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
        serverversion := v.serverversion
        if ( serverversion == 2) {
            IfInString, name, %compName%
            {
                return url 

            }
        }

    }
    return 0
}








return