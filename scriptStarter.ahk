#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
;<<<<<<<<<<<<<<<|||||||||||||||||>>>>>>>>>>>>>>>;
;<<<<<<<<<<<<<<<||||||Setup||||||>>>>>>>>>>>>>>>;
;<<<<<<<<<<<<<<<|||||||||||||||||>>>>>>>>>>>>>>>;
#SingleInstance force
Menu, Tray, Icon, C:\Users\Lars\Documents\ahk-scripts\Icons\ScriptStarterAHK_16.png
SetTimer, spotify, 500
;SetTimer, firefox, 500 ;FirefoxScript won't start, if this line is a comment
Run AutoHotkey macros.ahk
Tippy("ScriptStarter is now running")
;<<<<<<<<<<<<<<<|||||||||||||||||>>>>>>>>>>>>>>>;
;<<<<<<<<<<<<<<<|||||Spotify|||||>>>>>>>>>>>>>>>;
;<<<<<<<<<<<<<<<|||||||||||||||||>>>>>>>>>>>>>>>;
spotify:
    if (WinActive("ahk_exe spotify.exe")){
        SetTimer, spotify, Off
        Run AutoHotkey spotify.ahk
        SetTimer, spotifyOff, 500 ; On
    }
Return
spotifyOff:
    if (!WinExist("ahk_exe spotify.exe")){
        SetTimer, spotifyOff, Off
        SetTitleMatchMode 2
        DetectHiddenWindows On
        PostMessage, 0xF000, , , , spotify.ahk - AutoHotkey v
        DetectHiddenWindows Off
        SetTimer, spotify, 500 ; On
    }
Return
;<<<<<<<<<<<<<<<|||||||||||||||||>>>>>>>>>>>>>>>;
;<<<<<<<<<<<<<<<|||||Firefox|||||>>>>>>>>>>>>>>>;
;<<<<<<<<<<<<<<<|||||||||||||||||>>>>>>>>>>>>>>>;
firefox:
    if (WinActive("ahk_exe firefox.exe")){
        SetTimer, firefox, Off
        Run AutoHotkey firefox.ahk
        SetTimer, firefoxOff, 500 ; On
    }
Return
firefoxOff:
    if (!WinExist("ahk_exe firefox.exe")){
        SetTimer, firefoxOff, Off
        SetTitleMatchMode 2
        DetectHiddenWindows On
        PostMessage, 0xF000, , , , firefox.ahk - AutoHotkey v
        DetectHiddenWindows Off
        SetTimer, firefox, 500 ; On
    }
Return
;<<<<<<<<<<<<<<<|||||||||||||||||>>>>>>>>>>>>>>>;
;<<<<<<<<<<<<<<<||ToolTip-Maker||>>>>>>>>>>>>>>>;
;<<<<<<<<<<<<<<<|||||||||||||||||>>>>>>>>>>>>>>>;
Tippy(tipsHere, wait:=1000){
	ToolTip, %tipsHere%,,,8
	SetTimer, noTip, %wait%
}
noTip:
	ToolTip,,,,8 ;removes the tooltip
return
;<<<<<<<<<<<<<<<|||||||||||||||||>>>>>>>>>>>>>>>;
;<<<<<<<<<<<<<<<|||Reload/Stop|||>>>>>>>>>>>>>>>;
;<<<<<<<<<<<<<<<|||||||||||||||||>>>>>>>>>>>>>>>;
F8::
    ;Reloading all child-scripts
    SetTitleMatchMode, 2
    DetectHiddenWindows On
    PostMessage, 0xF001, , , , macros.ahk - AutoHotkey v
    Sleep 1000
    PostMessage, 0xF001, , , , spotify.ahk - AutoHotkey v
    Sleep 1000
    PostMessage, 0xF001, , , , firefox.ahk - AutoHotkey v
    DetectHiddenWindows Off
    Sleep 1000
    ;Reloading this Script
    Tippy("Reloading SciptStarter")
    Sleep 500
    Reload
Return
+F8::
    Tippy("Reloading SciptStarter")
    Sleep 500
    Reload
Return
^F8::
    SetTimer, spotify, Delete
    SetTimer, spotifyOff, Delete
    SetTimer, firefox, Delete
    SetTimer, firefoxOff, Delete
    ExitApp
Return
;<<<<<<<<<<<<<<<|||||||||||||||||>>>>>>>>>>>>>>>;
