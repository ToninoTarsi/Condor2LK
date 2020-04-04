#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#persistent
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#include %A_ScriptDir%\WatchDirectory.ahk


FileDelete, C:\temp\Flightplan.kml
Run, D:\Condor2\Tools\FPLtoKML.1.3.2\FPLtoKML.exe
WinWait  , ahk_exe FPLtoKML.exe
ControlClick  , Create,  ahk_exe FPLtoKML.exe
While ! FileExist( "C:\temp\Flightplan.kml" )
  Sleep 250
ControlClick  , Exit,  ahk_exe FPLtoKML.exe
run C:\temp\Flightplan.kml
ExitApp
