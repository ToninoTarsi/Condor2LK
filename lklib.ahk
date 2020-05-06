CustomMsgBox(Title,StartHeight, WindDir , WindSpeed, Inversion, Strength, RaceStartDelay, StartTimeWindow,   FontOptions="",WindowColor="")
{
	Gui,66:Destroy
	Gui,66:Color,%WindowColor%
	
    Gui,66:Font,S24 CDefault
	Gui,66:Add,Text,,StartHeight= %StartHeight% m
    Gui,66:Add,Text,,WindDir= %WindDir% deg
    Gui,66:Add,Text,,WindSpeed= %WindSpeed% kmh
    Gui,66:Add,Text,,Inversion= %Inversion% m
    Gui,66:Add,Text,,Strength= %Strength% 

    Gui,66:Add,Text,,RaceStartDelay= %RaceStartDelay% 
    Gui,66:Add,Text,,StartTimeWindow= %StartTimeWindow% 

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

SetBalaset() {
    delay := 1
   ; Balast
    Sleep, %delay% 
    ControlClick  x930 Y550, ahk_exe LK8000-PC.exe
    Sleep, %delay%
    ControlClick  x866 Y300, ahk_exe LK8000-PC.exe
    Sleep, %delay%
    ControlClick  x100 Y550, ahk_exe LK8000-PC.exe
    Sleep, %delay%
    ControlClick  x300 Y150, ahk_exe LK8000-PC.exe
    Sleep, %delay%
    ControlClick  x930 Y570, ahk_exe LK8000-PC.exe
    Sleep, %delay%
    ControlClick  x930 Y570, ahk_exe LK8000-PC.exe
    Sleep, %delay%
    ControlClick  x930 Y570, ahk_exe LK8000-PC.exe
    Sleep, %delay%
    ControlClick  x930 Y570, ahk_exe LK8000-PC.exe
    Sleep, %delay%
    ControlClick  x930 Y570, ahk_exe LK8000-PC.exe
    Sleep, %delay%
    ControlClick  x930 Y570, ahk_exe LK8000-PC.exe
    Sleep, %delay%
    ControlClick  x930 Y570, ahk_exe LK8000-PC.exe
    Sleep, %delay%
    ControlClick  x930 Y570, ahk_exe LK8000-PC.exe
    Sleep, %delay%
    ControlClick  x930 Y570, ahk_exe LK8000-PC.exe
    Sleep, %delay%
    ControlClick  x930 Y570, ahk_exe LK8000-PC.exe
    Sleep, %delay%
    ControlClick  x930 Y570, ahk_exe LK8000-PC.exe
    Sleep, %delay%
    ControlClick  x930 Y570, ahk_exe LK8000-PC.exe
    Sleep, %delay%
    ControlClick  x930 Y570, ahk_exe LK8000-PC.exe
    Sleep, %delay%
    ControlClick  x930 Y570, ahk_exe LK8000-PC.exe
    Sleep, %delay%

    ControlClick  x500 Y590, ahk_exe LK8000-PC.exe
    Sleep, %delay%
    ControlClick  x100 Y350, ahk_exe LK8000-PC.exe
    Sleep, %delay%
    ControlClick  x600 Y520, ahk_exe LK8000-PC.exe
    Sleep, %delay%
}

SetWind(dir,wind) {
    delay := 1
    ;MsgBox ,%delay% 
    ControlClick  x930 Y550, ahk_exe LK8000-PC.exe
    Sleep, %delay% 
    ControlClick  x866 Y300, ahk_exe LK8000-PC.exe
    Sleep, %delay%
    ControlClick  x320 Y550, ahk_exe LK8000-PC.exe
    Sleep, %delay%

    ControlClick  x375 Y130, ahk_exe LK8000-PC.exe
    Sleep, %delay%
    Loop, Parse, wind
    {
        ClickNumber( A_LoopField)
    }
    ControlClick  x650 Y550, ahk_exe LK8000-PC.exe
    Sleep, %delay%
    ControlClick  x375 Y230, ahk_exe LK8000-PC.exe
    Sleep, %delay%
    Loop, Parse, dir
    {
        ClickNumber( A_LoopField)
    }
    ControlClick  x650 Y550, ahk_exe LK8000-PC.exe
    Sleep, %delay%
    ControlClick  x430 Y500, ahk_exe LK8000-PC.exe
    Sleep, %delay%

}    
 
ClickNumber(n) {
    delay := 1
    if (n==1)
        ControlClick  x100 Y200, ahk_exe LK8000-PC.exe
    if ( n==2)
        ControlClick  x300 Y200, ahk_exe LK8000-PC.exe
    if ( n==3)
        ControlClick  x500 Y200, ahk_exe LK8000-PC.exe
    if ( n==4)
        ControlClick  x100 Y300, ahk_exe LK8000-PC.exe
    if ( n==5)
        ControlClick  x300 Y300, ahk_exe LK8000-PC.exe 
    if ( n==6)
        ControlClick  x500 Y300, ahk_exe LK8000-PC.exe
    if ( n==7)
        ControlClick  x100 Y450, ahk_exe LK8000-PC.exe
    if ( n==8)
        ControlClick  x300 Y450, ahk_exe LK8000-PC.exe
    if ( n==9)
        ControlClick  x500 Y450, ahk_exe LK8000-PC.exe
    if ( n==0)
        ControlClick  x650 Y200, ahk_exe LK8000-PC.exe 
   Sleep, %delay%
} 


IsNum( str ) {
	if str is number
		return true
	return false
}

StartLK8000(theDelay) {
    delay := 100
    ;MsgBox %theDelay%
    
    Sleep, 100

    if (IsNum(theDelay) ) {
                ;MsgBox "is number" 

        CountDown(theDelay)
    }
    else {
                ;MsgBox " not is number" 

        CountDown(15)
    }

    Run, C2LK.exe
    WinWait  , ahk_exe C2LK.exe
    Sleep, %delay%
    ControlClick, Button4 , ahk_exe C2LK.exe

    IniRead, LKTaskDir, Condor2LK.ini, LKTaskDir, LKTaskDir
    SplitPath, LKTaskDir,, dirapp
    SplitPath, dirapp,, dirLK

    Run %dirLK%\LK8000-PC.exe -x=960 -y=576
    WinWait  , ahk_exe LK8000-PC.exe
    IniRead, LK8000_X, Condor2LK.ini, ScreenPosition, LK8000_X
    IniRead, LK8000_Y, Condor2LK.ini, ScreenPosition, LK8000_Y
    WinMove  %LK8000_X%,  %LK8000_Y%
    Sleep, %delay% 
    ControlClick, FLY , ahk_exe LK8000-PC.exe
    
    Sleep, %delay%00 
    
    ; ControlClick  x500 Y250, ahk_exe LK8000-PC.exe
    ; Sleep, %delay%0 


    SetBalaset()



    IniRead, TaskDir, Condor2LK.ini, TaskDir, TaskDir
    IniRead, StartHeight, %TaskDir%, Task, TPHeight1
    IniRead, WindDir, %TaskDir%, Weather, WindDir
    IniRead, WindSpeed, %TaskDir%, Weather, WindSpeed
    IniRead, Inversion, %TaskDir%, Weather, ThermalsInversionheight
    IniRead, Strength, %TaskDir%, Weather, ThermalsStrength

    IniRead, RaceStartDelay, %TaskDir%, GameOptions, RaceStartDelay
    IniRead, StartTimeWindow, %TaskDir%, GameOptions, StartTimeWindow

    
    SetWind(Round(WindDir),Round(WindSpeed*3.6)) 

    ControlClick  x500 Y250, ahk_exe LK8000-PC.exe
    Sleep, %delay%0 


    ; SetWorkingDir,D:/Condor2/Tools/CoTASAV21/
    ; Run, D:/Condor2/Tools/CoTASAV21/CoTASA.exe
    ; SetWorkingDir %A_ScriptDir%

    CustomMsgBox("StartHeight",StartHeight, Round(WindDir), Round(WindSpeed*3.6), Round(Inversion), Strength, Round(RaceStartDelay*60), Round(StartTimeWindow*60) ,"cRed")

    ExitApp

}
