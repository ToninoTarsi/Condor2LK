#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#persistent
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



url := "http://condor.hitziger.net/serverlist/"

; Example: Download text to a variable:
HttpRequest := ComObjCreate("WinHttp.WinHttpRequest.5.1")
HttpRequest.Open("GET", url)
HttpRequest.Send()
this_text := HttpRequest.ResponseText

html := ComObjCreate("htmlfile")
html.write(this_text)

msgbox % html

; Loop through all links and add them to link_list variable with a new line
Loop % html.links.length
  link_list .= html.links[A_Index - 1].href . "`n"

; Certain links for relative and have text like 'about:/services/' replace the about with url
StringReplace, link_list, link_list, about:, %url%, A
msgbox % link_list

