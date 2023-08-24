#NoEnv
SendMode Input
#InstallKeybdHook
#UseHook On
#MaxHotkeysPerInterval 2000
#WinActivateForce ;https://autohotkey.com/docs/commands/_WinActivateForce.htm
;<<<<<<<<<<<<<<<|||||||||||||||||>>>>>>>>>>>>>>>;
;<<<<<<<<<<<<<<<||||||Setup||||||>>>>>>>>>>>>>>>;
;<<<<<<<<<<<<<<<|||||||||||||||||>>>>>>>>>>>>>>>;
#SingleInstance force ;only one instance of this script may run at a time!
Menu, Tray, Icon, shell32.dll, 283 ; this changes the tray icon to a little keyboard!
OnMessage(0xF001, "RELOAD")
;<<<<<<<<<<<<<<<|||||||||||||||||>>>>>>>>>>>>>>>;
;<<<<<<<<<<<<<<<||2nd Keyboard|||>>>>>>>>>>>>>>>;
;<<<<<<<<<<<<<<<|using LuaMacros|>>>>>>>>>>>>>>>;
;<<<<<<<<<<<<<<<|||||||||||||||||>>>>>>>>>>>>>>>;


#IfWinActive ;ANY Application

global UnicodeVar = 0x1F600 ; Var for printing Emojis with F11
F4:: ; Reloading this script
	Tippy("Reloading macros.ahk")
	Sleep 500
	Reload
Return

!B::
	Send \box+{space}
Return

!D::
	Send \diamond+{space}
Return

~F24:: ; F24 key, virtually pressed by LuaMacros. The actual key pressed is saved in keypressed.txt
FileRead, key, D:\AHK\luaMacros2AHKBridge\keypressed.txt
;Var := "You have pressed" . key
tippy("You have pressed " . key) ;<--- this function will just launch a quick tooltip that shows you what key you pressed. OPTIONAL.

if (key = "u"){ ;Windows Explorer: D:/Uni/
	Send, #r
	Sleep, 40
	Send, D:\UNI {enter}
}
; Switching between Desktops
else if (key = "left"){
	Send ^#{Left}
}
else if (key = "right"){
	Send ^#{Right}
}
; Emoji-Part
else if (key = "F10"){
	UnicodeVar = 0x1F600
}
else if (key = "F11"){
	Send {U+ %UnicodeVar%}
	SetFormat, IntegerFast, hex
	UnicodeVar += 1
	UnicodeVar .= ""
	SetFormat, IntegerFast, d
}
else if (key = "F12"){
	MsgBox, UnicodeVar: %UnicodeVar%
}
;END
Return ;from luamacros F24

^!+W:: ;Zu Adobe Reader oder VLC wechseln 
	if ((WinActive("ahk_exe AcroRd32.exe") && WinExist("ahk_exe vlc.exe")) || !WinExist("ahk_exe AcroRd32.exe")){
		WinActivate, ahk_exe vlc.exe
	}
	else {
		WinActivate, ahk_exe AcroRd32.exe
	}
Return

^!+E:: ;Zu Firefox wechseln bzw. Starten
	if (!WinExist("ahk_exe firefox.exe")){
		Run, "C:\Program Files\Mozilla Firefox\firefox.exe"
	} else {
		WinActivate, ahk_exe firefox.exe
	}
Return

^!+R:: ;Zu Spotify wechseln bzw. Starten
	if (!WinExist("ahk_exe spotify.exe")){
		Run, "C:\Users\Lars\AppData\Roaming\Spotify\Spotify.exe"
	} else {
		WinActivate, ahk_exe spotify.exe
	}
Return

^!+T:: ;Zu Code wechseln bzw. Starten
	if (!WinExist("ahk_exe Code.exe")){
		Run, "E:\Microsoft VS Code\Code.exe"
	} else {
		WinActivate, ahk_exe Code.exe
	}
Return

^!+Z:: ;Zu Discord wechseln bzw. Starten
	if (!WinExist("ahk_exe Discord.exe")){
		Run, "C:\Users\Lars\AppData\Local\Discord\app-0.0.306\Discord.exe"
	} else {
		WinActivate, ahk_exe Discord.exe
	}
Return

;<<<<<<<<<<<<<<<|||||||||||||||||>>>>>>>>>>>>>>>;
;<<<<<<<<<<<<<<<Testing Functions>>>>>>>>>>>>>>>;
;<<<<<<<<<<<<<<<|||||||||||||||||>>>>>>>>>>>>>>>;
; -- Methode, die zum Spotify-Fenster und zurück wechselt
SwitchWindows(){
	if (!WinActive("ahk_exe spotify.exe") && WinExist("ahk_exe spotify.exe")){
		WinGetActiveTitle, Titel
		WinActivate, ahk_exe spotify.exe
		WinGetPos, X, posY, Breite, Hoehe, A
		posX := X + 50
		MouseGetPos, mouseX, mouseY
		Click, %posX%, %posY%
		MouseMove, mouseX, mouseY, 0
		Sleep 3000		
		WinActivate, %Titel%
	}
}
; -- Methode zum auslesen von Daten des aktuellen Fensters
ActiveWindowData(){
	WinGetActiveTitle, Titel
	WinGetPos, X, Y, Breite, Hoehe, A
	MsgBox, Das aktive Fenster ist "%Titel%" und `n liegt bei %X%`,%Y% mit den Maßen %Breite%`,%Hoehe% .
}
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
    Tippy("Reloading MacroScript")
    Sleep 500
    Reload
}
;<<<<<<<<<<<<<<<|||||||||||||||||>>>>>>>>>>>>>>>;
