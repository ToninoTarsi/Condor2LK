#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#persistent
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#include %A_ScriptDir%\WatchDirectory.ahk

    
IniRead, TaskDir, Condor2LK.ini, TaskDir, TaskDir


SplitPath, TaskDir,, dir







WatchDirectory(dir, "StartLK8000", 0x10)
return

CustomMsgBox(Title,StartHeight, WindDir , WindSpeed, Inversion, Strength,  FontOptions="",WindowColor="")
{
	Gui,66:Destroy
	Gui,66:Color,%WindowColor%
	
    Gui,66:Font,S32 CDefault
	Gui,66:Add,Text,,StartHeight= %StartHeight% m
    Gui,66:Add,Text,,WindDir= %WindDir% deg
    Gui,66:Add,Text,,WindSpeed= %WindSpeed% kmh
    Gui,66:Add,Text,,Inversion= %Inversion% m
    Gui,66:Add,Text,,Strength= %Strength% 



	Gui,66:Font
	GuiControlGet,Text,66:Pos,Static1
	
	Gui,66:Add,Button,% "Default y+10 w75 g66OK xp+" (TextW / 2) - 38 ,OK
	
	Gui,66:-MinimizeBox
	Gui,66:-MaximizeBox
	
	SoundPlay,*-1

    IniRead, INFO_X, Condor2LK.ini, ScreenPosition, INFO_X
    IniRead, INFO_Y, Condor2LK.ini, ScreenPosition, INFO_Y

	Gui,66:Show,%INFO_X% %INFO_Y%,%Title%
	
	Gui,66:+LastFound
	WinWaitClose
	Gui,66:Destroy
	return
	
	66OK:
	Gui,66:Destroy
	return
}

CountDown(Secs) {
    SetTimer, CountDown, 1000
    MsgBox, 0, Start LK8000, Start LK8000 in %Secs%?, %Secs%
    SetTimer, CountDown, Off
    return

    CountDown:
    Secs -= 1
    ControlSetText,Static1,Start LK8000 in %Secs%?,Start LK8000 ahk_class #32770
    Return
}

StartLK8000(param1, param2) {
    ;MmsgBox % param1 "`n" param2
    
    Sleep, 1000

    CountDown(10)

    Run, C2LK.exe
    WinWait  , ahk_exe C2LK.exe
    Sleep, 500
    ControlClick, Button3 , ahk_exe C2LK.exe

    IniRead, LKTaskDir, Condor2LK.ini, LKTaskDir, LKTaskDir
    SplitPath, LKTaskDir,, dirapp
    SplitPath, dirapp,, dirLK

    Run %dirLK%\LK8000-PC.exe -x=960 -y=576
    WinWait  , ahk_exe LK8000-PC.exe
    IniRead, LK8000_X, Condor2LK.ini, ScreenPosition, LK8000_X
    IniRead, LK8000_Y, Condor2LK.ini, ScreenPosition, LK8000_Y
    WinMove  %LK8000_X%,  %LK8000_Y%
    Sleep, 500 
    ControlClick, FLY , ahk_exe LK8000-PC.exe
    Sleep, 5000 
    ControlClick  x500 Y250, ahk_exe LK8000-PC.exe
    ;Sleep, 500 
    

    IniRead, StartHeight, TaskDir, Task, TPHeight1
    IniRead, WindDir, TaskDir, Weather, WindDir
    IniRead, WindSpeed, TaskDir, Weather, WindSpeed
    IniRead, Inversion, TaskDir, Weather, ThermalsInversionheight
    IniRead, Strength, TaskDir, Weather, ThermalsStrength


    ;MsgBox, 0, StartHeight, %StartHeight%
    CustomMsgBox("StartHeight",StartHeight, Round(WindDir), Round(WindSpeed*3.6), Round(Inversion),  Strength,"cRed")
    ExitApp

}


;MsgBox, done
;WinMove A,, 10, 10, A_ScreenWidth+20, A_ScreenHeight-20
