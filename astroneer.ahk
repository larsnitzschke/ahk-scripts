#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir% 
;<<<<<<<<<<<<<<<|||||||||||||||||>>>>>>>>>>>>>>>;
;<<<<<<<<<<<<<<<||||||Setup||||||>>>>>>>>>>>>>>>;
;<<<<<<<<<<<<<<<|||||||||||||||||>>>>>>>>>>>>>>>;
#SingleInstance force
;Menu, Tray, Icon, D:\AHK\Icons\?.png
OnMessage(0xF000, "TURN_OFF")
OnMessage(0xF001, "RELOAD")
;<<<<<<<<<<<<<<<|||||||||||||||||>>>>>>>>>>>>>>>;
;<<<<<<<<<<<<<<<|||||Macros||||||>>>>>>>>>>>>>>>;
;<<<<<<<<<<<<<<<|||||||||||||||||>>>>>>>>>>>>>>>;

XButton2::
Send F
return

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