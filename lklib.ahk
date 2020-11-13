CustomMsgBox(Title,StartHeight, WindDir , WindSpeed, Inversion, Strength, RaceStartDelay, StartTimeWindow,  CloudBase="", ThermalsWidth="", ThermalsActivity="", ThermalsFlatsActivity="", PenaltyCloudFlying="", IconsVisibleRange="", altMsg="", FontOptions="", WindowColor="")
{
	Gui,66:Destroy
	Gui,66:Color,%WindowColor%
	
    Gui,66:Font,S12 CDefault
	Gui,66:Add,Text,,StartHeight= %StartHeight% m
    Gui,66:Add,Text,,RaceStartDelay= %RaceStartDelay% 
    Gui,66:Add,Text,,StartTimeWindow= %StartTimeWindow% 
    if	(altMsg ) {
        Gui,66:Add,Text,,TP= %altMsg% 
    }



    Gui,66:Add,Text,,------------------------------------
    Gui,66:Add,Text,,WindSpeed= %WindSpeed% 
    Gui,66:Add,Text,,WindDir= %WindDir%
    Gui,66:Add,Text,,CloudBase= %CloudBase%
    Gui,66:Add,Text,,Inversion= %Inversion% m
    Gui,66:Add,Text,,ThermalsStrength= %Strength% 
    Gui,66:Add,Text,,ThermalsWidth= %ThermalsWidth% 
    Gui,66:Add,Text,,ThermalsActivity= %ThermalsActivity% 
    Gui,66:Add,Text,,ThermalsFlatsActivity= %ThermalsFlatsActivity% 
    Gui,66:Add,Text,,------------------------------------
    Gui,66:Add,Text,,PenaltyCloudFlying= %PenaltyCloudFlying% 
    Gui,66:Add,Text,,IconsVisibleRange= %IconsVisibleRange% 



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
    delay := 100
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
    delay := 100
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
    Sleep, 1000
    ControlClick, Button4 , ahk_exe C2LK.exe
    Sleep, 1000
    ControlClick, Button4 , ahk_exe C2LK.exe

    IniRead, LKTaskDir, Condor2LK.ini, LKTaskDir, LKTaskDir
    IniRead, LK8000_SX, Condor2LK.ini, ScreenPosition, LK8000_SX
    IniRead, LK8000_SY, Condor2LK.ini, ScreenPosition, LK8000_SY
    SplitPath, LKTaskDir,, dirapp
    SplitPath, dirapp,, dirLK

    Run %dirLK%\LK8000-PC.exe -x=%LK8000_SX% -y=%LK8000_SY%
    WinWait  , ahk_exe LK8000-PC.exe
    IniRead, LK8000_X, Condor2LK.ini, ScreenPosition, LK8000_X
    IniRead, LK8000_Y, Condor2LK.ini, ScreenPosition, LK8000_Y
    WinMove  %LK8000_X%,  %LK8000_Y%
    Sleep, %delay% 
    ControlClick, FLY , ahk_exe LK8000-PC.exe
    
    Sleep, 15000 
    
    ; ControlClick  x500 Y250, ahk_exe LK8000-PC.exe
    ; Sleep, %delay%0 


    IniRead, TaskDir, Condor2LK.ini, TaskDir, TaskDir
    IniRead, StartHeight, %TaskDir%, Task, TPHeight1
    IniRead, WindDir, %TaskDir%, Weather, WindDir
    IniRead, WindSpeed, %TaskDir%, Weather, WindSpeed
    IniRead, Inversion, %TaskDir%, Weather, ThermalsInversionheight
    IniRead, Strength, %TaskDir%, Weather, ThermalsStrength
    IniRead, ThermalsWidth, %TaskDir%, Weather, ThermalsWidth
    IniRead, ThermalsActivity, %TaskDir%, Weather, ThermalsActivity
    IniRead, ThermalsFlatsActivity, %TaskDir%, Weather, ThermalsFlatsActivity

    IniRead, ThermalsStrengthVariation, %TaskDir%, Weather, ThermalsStrengthVariation
    IniRead, ThermalsWidthVariation, %TaskDir%, Weather, ThermalsWidthVariation
    IniRead, ThermalsTempVariation, %TaskDir%, Weather, ThermalsTempVariation
    IniRead, WindDirVariation, %TaskDir%, Weather, WindDirVariation
    IniRead, WindSpeedVariation, %TaskDir%, Weather, WindSpeedVariation

    IniRead, PenaltyCloudFlying, %TaskDir%, GameOptions, PenaltyCloudFlying
    IniRead, IconsVisibleRange, %TaskDir%, GameOptions, IconsVisibleRange

    IniRead, Count, %TaskDir%, Task, Count
    Count := Count - 1
    a := 2
    altMsg := ""

    while a <= count
	{
        IniRead, TPWidth, %TaskDir%, Task, TPWidth%a%
        IniRead, TPHeight, %TaskDir%, Task, TPHeight%a%
        index := a-1
        if ( a == count ) {
            index = F
        }
        if (TPWidth != 0 ) {
            altMsg := altMsg " TP"index "min:" TPWidth " - "
        }
        if (TPHeight < 10000 ) {
            altMsg := altMsg " TP"index "max:" TPHeight " - "
        }
        a := a + 1
    }
    ;MsgBox, %altMsg%
 


    IniRead, ThermalsDew, %TaskDir%, Weather, ThermalsDew
    IniRead, ThermalsTemp, %TaskDir%, Weather, ThermalsTemp

    if (Strength==0) 
        Strength := "Very Week"
    else if  (Strength==1) 
        Strength := "Week"
    else if  (Strength==2) 
        Strength := "Moderate"
    else if  (Strength==3) 
        Strength := "Strong"
    else if  (Strength==4) 
        Strength := "Very Strong"

    if (ThermalsWidth==0) 
        ThermalsWidth := "Very Norrow"
    else if  (ThermalsWidth==1) 
        ThermalsWidth := "Norrow"
    else if  (ThermalsWidth==2) 
        ThermalsWidth := "Normal"
    else if  (ThermalsWidth==3) 
        ThermalsWidth := "Wide"
    else if  (ThermalsWidth==4) 
        ThermalsWidth := "Very Wide"
        

    if (ThermalsActivity==0) 
        ThermalsActivity := "None"
    else if  (ThermalsActivity==1) 
        ThermalsActivity := "Very Low"
    else if  (ThermalsActivity==2) 
        ThermalsActivity := "Low"
    else if  (ThermalsActivity==3) 
        ThermalsActivity := "Normal"
    else if  (ThermalsActivity==4) 
        ThermalsActivity := "High"

if  (ThermalsFlatsActivity==0) 
        ThermalsFlatsActivity := "Very Low"
    else if  (ThermalsFlatsActivity==1) 
        ThermalsFlatsActivity := "Low"
    else if  (ThermalsFlatsActivity==2) 
        ThermalsFlatsActivity := "Normal"
    else if  (ThermalsFlatsActivity==3) 
        ThermalsFlatsActivity := "High"


    if (ThermalsStrengthVariation==0) 
        ThermalsStrengthVariation := "None"
    else if  (ThermalsStrengthVariation==1) 
        ThermalsStrengthVariation := "Very Low"
    else if  (ThermalsStrengthVariation==2) 
        ThermalsStrengthVariation := "Low"
    else if  (ThermalsStrengthVariation==3) 
        ThermalsStrengthVariation := "Medium"
    else if  (ThermalsStrengthVariation==4) 
        ThermalsStrengthVariation := "High"
    else if  (ThermalsStrengthVariation==5) 
        ThermalsStrengthVariation := "Very High"

    if (ThermalsWidthVariation==0) 
        ThermalsWidthVariation := "None"
    else if  (ThermalsWidthVariation==1) 
        ThermalsWidthVariation := "Low"
    else if  (ThermalsWidthVariation==2) 
        ThermalsWidthVariation := "Medium"
    else if  (ThermalsWidthVariation==3) 
        ThermalsWidthVariation := "High"

    if (ThermalsTempVariation==0) 
        ThermalsTempVariation := "None"
    else if  (ThermalsTempVariation==1) 
        ThermalsTempVariation := "Low"
    else if  (ThermalsTempVariation==2) 
        ThermalsTempVariation := "Medium"
    else if  (ThermalsTempVariation==3) 
        ThermalsTempVariation := "High"

    if (WindDirVariation==0) 
        WindDirVariation := "None"
    else if  (WindDirVariation==1) 
        WindDirVariation := "Low"
    else if  (WindDirVariation==2) 
        WindDirVariation := "Medium"
    else if  (WindDirVariation==3) 
        WindDirVariation := "High"

    if (WindSpeedVariation==0) 
        WindSpeedVariation := "None"
    else if  (WindSpeedVariation==1) 
        WindSpeedVariation := "Low"
    else if  (WindSpeedVariation==2) 
        WindSpeedVariation := "Medium"
    else if  (WindSpeedVariation==3) 
        WindSpeedVariation := "High"


    ws := WindSpeed
    wd := WindDir

    Strength := Strength " (" ThermalsStrengthVariation  ")"
    ThermalsWidth := ThermalsWidth " (" ThermalsWidthVariation  ")"
    CloudBase := Round((ThermalsTemp-ThermalsDew)*125)
    CloudBase := CloudBase " m (" ThermalsTempVariation  ")"
    WindDir := Round(WindDir) " deg (" WindDirVariation  ")"
    WindSpeed := Round(WindSpeed*3.6) " kmh (" WindSpeedVariation  ")"

    IniRead, RaceStartDelay, %TaskDir%, GameOptions, RaceStartDelay
    IniRead, StartTimeWindow, %TaskDir%, GameOptions, StartTimeWindow

    IniRead, Water, %TaskDir%, Plane, Water

    ;MsgBox , %Water%
    ; if ( Water > 0  ) {
    ;     SetBalaset()
    ; }
    
    ;SetWind(Round(wd),Round(ws*3.6)) 

    ControlClick  x500 Y250, ahk_exe LK8000-PC.exe
    Sleep, 1000


    SetWorkingDir,D:/Condor2/Tools/CoTASAV22/
    Run, D:/Condor2/Tools/CoTASAV22/CoTASA.exe
    SetWorkingDir %A_ScriptDir%

    CustomMsgBox("StartHeight",StartHeight, WindDir, WindSpeed, Round(Inversion), Strength, Round(RaceStartDelay*60), Round(StartTimeWindow*60) ,CloudBase,ThermalsWidth,ThermalsActivity,ThermalsFlatsActivity,PenaltyCloudFlying, IconsVisibleRange , altMsg,"cRed")

    ExitApp

}
