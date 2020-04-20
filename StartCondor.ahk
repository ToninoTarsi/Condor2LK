#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#persistent
#SingleInstance force  
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Include %A_ScriptDir%\JSON.ahk
#Persistent
compName2 := ""
Run RunDll32.exe InetCpl.cpl`,ClearMyTracksByProcess 8	
Run RunDll32.exe InetCpl.cpl`,ClearMyTracksByProcess 2


; Server name

; compName1 := "Italian Championship A" 
; compName2 := "Italian Championship-A"

; compName1 := "CNVVV" 
; compName2 := "Campeonato"

; compName1 := "Corona Cup" 
; compName2 := ""

; compName1 := "NouZaChalles"
; compName2 := ""

;compName1 := "Pirineos-Server A"

;compName1 := "GP2020"
;compName2 := "GP 2020"

;compName1 := "FFF"

compName1 := "Eurobattle A"  ; http://condor-danmark.dk/serverlist-2/

; compName1 := "Tchin Tchin"
; compName2 := ""


pwd := ""






compUrl = 0
while ( true ) {

        
    compUrl := CheckCompAlternate(compName1,compName2)

    if ( compUrl == 0) { 
        compUrl := CheckCompVirtualsoaring(compName1,compName2)
    }


    if ( compUrl == 0) { 
        compUrl := CheckCompOfficial(compName1,compName2)
    }

    ;ToolTip, %compUrl%

    if ( compUrl != 0) {
        url := "cndr2://" . compUrl 
        ;MsgBox, %url%
        Run, %url%
        Sleep, 1000
        WinWait  , MULTIPLAYER
        Sleep, 1000
        ControlSend, TspSkinEdit1, %pwd% , MULTIPLAYER
        Sleep, 1000
        ControlClick  Join, MULTIPLAYER
        Sleep, 1000
        ExitApp
    }
    ;Sleep 1000
}


CheckCompVirtualsoaring(compName1,compName2)
{
    ;Prepare our WinHttpRequest object
    HttpObj := ComObjCreate("WinHttp.WinHttpRequest.5.1")
    HttpObj.SetTimeouts(6000,6000,6000,6000) ;Set timeouts to 6 seconds


    IE := ComObjCreate("InternetExplorer.Application")
    IE.Visible := false

    IE.Navigate("https://virtualsoaring.eu/serverlist/" PostCode)

    while IE.readyState!=4 || IE.document.readyState != "complete" || IE.busy
        continue
    Sleep 200
 

    table  := IE.document.getElementById("serverlist").Rows
    rows  := table.Length

    ;MsgBox, %rows% 

    ;msg := table[1].getElementsByTagName("td")[A_Index-1].innerText
    msg =
    Loop, % rows
    {
        i := A_Index-1
        cols  := table[i].getElementsByTagName("TD").Length
        ;MsgBox, %cols%
        if ( cols == 10) {
            name := table[i].getElementsByTagName("TD")[0].innerText
            join_status := table[i].getElementsByTagName("TD")[2].innerText
            condor_version := SubStr(table[i].getElementsByTagName("TD")[4].innerText,1,1)
            ;MsgBox, %condor_version%
            url := table[i].getAttribute("data-href")
            ;MsgBox, %name% %join_status% %url%

            if ( join_status == "Joining Enabled" && condor_version == "2") {
                if ( compName1 != "" ) {
                    IfInString, name, %compName1%
                    {
                        ;MsgBox  %url%
                        return url 

                    }
                    }
                if ( compName2 != "" ) {
                    IfInString, name, %compName2%
                    {
                        return url 
                    }
                }
            }

        }

    }

    RunWait, Taskkill /f /im iexplore.exe, , Hide
    return 0
}


CheckCompOfficial(compName1,compName2)
{
    ;Prepare our WinHttpRequest object
    HttpObj := ComObjCreate("WinHttp.WinHttpRequest.5.1")
    HttpObj.SetTimeouts(60000,60000,60000,60000) ;Set timeouts to 6 seconds


    IE := ComObjCreate("InternetExplorer.Application")
    IE.Visible := false

    IE.Navigate("http://www.condorsoaring.com/serverlist/?wdt_search=cndr2" PostCode)

    while IE.readyState!=4 || IE.document.readyState != "complete" || IE.busy
        continue
   Sleep 200
 

    table  := IE.document.getElementById("table_1").Rows
    rows  := table.Length

    ;MsgBox, %rows% . %cols%

    ;msg := table[1].getElementsByTagName("td")[A_Index-1].innerText
    msg =
    Loop, % rows
    {
        i := A_Index-1
        cols  := table[i].getElementsByTagName("TD").Length
        if ( cols == 11) {
            name := table[i].getElementsByTagName("TD")[1].innerText
            join_status := table[i].getElementsByTagName("TD")[3].innerText
            html := table[i].innerHTML
            ; StringReplace, html,html,", , All
            ; StringReplace,html,html,`n,,All
            ; StringReplace,html,html,`t,,All
            FoundPos := InStr(html, "cndr2:")
            url :=   SubStr(html,FoundPos+6,20)
            if ( join_status == "Joining Enabled" ) {
                if ( compName1 != "" ) {
                    IfInString, name, %compName1%
                    {
                        ;MsgBox  %url%
                        return url 

                    }
                    }
                if ( compName2 != "" ) {
                    IfInString, name, %compName2%
                    {
                        return url 
                    }
                }
            }

        }

    }

    RunWait, Taskkill /f /im iexplore.exe, , Hide
    return 0
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