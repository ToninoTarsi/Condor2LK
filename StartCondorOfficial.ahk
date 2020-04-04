#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#persistent
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Include %A_ScriptDir%\JSON.ahk
#Persistent


compName1 := "Eurobattle B"
compName2 := ""

pwd := ""






compUrl = 0
while ( true ) {

    compUrl := CheckCompOfficial(compName1,compName2)

    

   ;ToolTip, %compUrl%

    if ( compUrl != 0) {
        url := "cndr2://" . compUrl 
        ;MsgBox, %url%
        Run, %url%
        WinWait  , MULTIPLAYER
        Sleep, 200

        ControlSend, TspSkinEdit1, %pwd% , MULTIPLAYER


        Sleep, 200
        ControlClick  Join, MULTIPLAYER
        Sleep, 1000
        ExitApp
    }
    Sleep 1000
}



CheckCompOfficial(compName1,compName2)
{
    ;Prepare our WinHttpRequest object
    HttpObj := ComObjCreate("WinHttp.WinHttpRequest.5.1")
    HttpObj.SetTimeouts(6000,6000,6000,6000) ;Set timeouts to 6 seconds


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








return