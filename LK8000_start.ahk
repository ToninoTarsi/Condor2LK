#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#persistent
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#include %A_ScriptDir%\WatchDirectory.ahk
#include %A_ScriptDir%\lklib.ahk

StartLK8000(1)



