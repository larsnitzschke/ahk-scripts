#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir% 
;<<<<<<<<<<<<<<<|||||||||||||||||>>>>>>>>>>>>>>>;
;<<<<<<<<<<<<<<<||||||Setup||||||>>>>>>>>>>>>>>>;
;<<<<<<<<<<<<<<<|||||||||||||||||>>>>>>>>>>>>>>>;
#SingleInstance force
Menu, Tray, Icon, C:\Users\Lars\Documents\ahk-scripts\Icons\firefoxAHK_16.png
OnMessage(0xF000, "TURN_OFF")
OnMessage(0xF001, "RELOAD")
;<<<<<<<<<<<<<<<|||||||||||||||||>>>>>>>>>>>>>>>;
;<<<<<<<<<<<<<<<|||||Macros||||||>>>>>>>>>>>>>>>;
;<<<<<<<<<<<<<<<|||||||||||||||||>>>>>>>>>>>>>>>;


    ; The Macros are supposed to be here


;<<<<<<<<<<<<<<<|||||||||||||||||>>>>>>>>>>>>>>>;
;<<<<<<<<<<<<<<<||ToolTip-Maker||>>>>>>>>>>>>>>>;
;<<<<<<<<<<<<<<<|||||||||||||||||>>>>>>>>>>>>>>>;
Tippy(tipsHere, wait:=1000){
	ToolTip, %tipsHere%,,,8
	SetTimer, noTip, %wait%
}
noTip:
	ToolTip,,,,8
	;removes the tooltip
return
;<<<<<<<<<<<<<<<|||||||||||||||||>>>>>>>>>>>>>>>;
;<<<<<<<<<<<<<<<|||Reload/Stop|||>>>>>>>>>>>>>>>;
;<<<<<<<<<<<<<<<|||||||||||||||||>>>>>>>>>>>>>>>;
TURN_OFF(){
    ExitApp
}
RELOAD(){
    Tippy("Reloading FirefoxScript")
    Sleep 500
    Reload
}
;<<<<<<<<<<<<<<<|||||||||||||||||>>>>>>>>>>>>>>>;
