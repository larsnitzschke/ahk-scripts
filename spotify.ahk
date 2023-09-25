#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir% 
;<<<<<<<<<<<<<<<|||||||||||||||||>>>>>>>>>>>>>>>;
;<<<<<<<<<<<<<<<||||||Setup||||||>>>>>>>>>>>>>>>;
;<<<<<<<<<<<<<<<|||||||||||||||||>>>>>>>>>>>>>>>;
#SingleInstance force
Menu, Tray, Icon, D:\ahk-scripts\Icons\spotifyAHK_16.png
OnMessage(0xF000, "TURN_OFF")
OnMessage(0xF001, "RELOAD")
;<<<<<<<<<<<<<<<|||||||||||||||||>>>>>>>>>>>>>>>;
;<<<<<<<<<<<<<<<|||||Macros||||||>>>>>>>>>>>>>>>;
;<<<<<<<<<<<<<<<|||||||||||||||||>>>>>>>>>>>>>>>;
~F24::
FileRead, key, D:\ahk-scripts\luaMacros2AHKBridge\keypressed.txt
tippy(You have pressed %key%) ;<--- this function will just launch a quick tooltip that shows you what key you pressed. OPTIONAL.

if (key = "delete"){
	if (WinActive("ahk_exe spotify.exe")){
        BlockInput, On
        Click, right
	    Sleep 50
	    Send {Down}
		Sleep 50
		Send {Down}
		Sleep 50
		Send {Enter}
		Sleep 10
        BlockInput, Off
    }
}
else if (key = "num1"){
	AddToPlaylist(1,-1) ;MusikiHasi
}
else if (key = "num2"){
	AddToPlaylist(2,2) ;Electronic Reloaded
}
else if (key = "num3"){
	AddToPlaylist(2,3) ;Electronic Holding
}
else if (key = "num4"){
	AddToPlaylist(3,-1) ;Warteschlange
}
else if (key = "num5"){
	AddToPlaylist(4,-1) ;Background
}
else if (key = "num6"){
	AddToPlaylist(5,-1) ;Epic Music
}
else if (key = "num7"){
	AddToPlaylist(2,4) ;Electronic Relived
}
else if (key = "num8"){
	AddToPlaylist(2,5) ;Electronic Reflected
}
else if (key = "num9"){
	AddToPlaylist(2,6) ;Electronic Regarded
}
else if (key = "insert"){
	Send {Media_Prev}
}
else if (key = "end"){
	Send {Media_Play_Pause}
}
else if (key = "pagedown"){
	Send {Media_Next}
}

AddToPlaylist(numPlaylist, numSubPlaylist){
/*
	@param numPlaylist : The number of the playlist or folder (see below)
	@param numSubPlaylist : If numplaylist was a folder this is the number for choosing the sub-playlist
	Can change, if order changes in Spotify
	1 -> MusikiHasi
	2 -> Electronic
		2,1 -> Released
		2,2 -> Reloaded
		2,3 -> Holding
		2,X -> Remixed (Coming some time in the future)
	3 -> Warteschlange
	4 -> Background
	5 -> Epic Music
	6 -> Random xD
	7 -> Overwerk
	11 -> Meine Shazam-Titel
	12 -> DiscordListenTogether
*/
	Deactivated := false
	WinGetActiveTitle, Titel

	if (!WinActive("ahk_exe spotify.exe")){
		if (WinExist("ahk_exe spotify.exe")){
			Deactivated := true
            BlockInput, On
			WinActivate, ahk_exe spotify.exe
			WinGetPos, X, posY, Breite, Hoehe, A
			posX := X + 50
			MouseGetPos, mouseX, mouseY
			Click, %posX%, %posY%
			MouseMove, mouseX, mouseY, 0
            BlockInput, Off
		}
		else {
			return
		}
	}

	Sleep 50
    BlockInput, On
	MouseGetPos, mouseX, mouseY
	WinGetPos, X, Y, Breite, Hoehe, A
	;Clicking on the current song
	if (X>=0 && Y>=0 && Breite<=1920 && Hoehe<=1040) {
		variableX := Hoehe - 68
		Click, right, 120, %variableX%
	}
	else if (X==-9 && Y==-9 && Breite==3458 && Hoehe==1408) {
		;Vollbildmodus
		variableY := Hoehe - 78
		Click, right, 128, %variableY%
	}
	Sleep 35

	Send {Down}{Right}
	Sleep 20
	i:=-1 ;-1 because of search bar
	while (i < numPlaylist){
		Send {Down}
		i++ 
	}
	if (numSubPlaylist != -1) {
		Send {Right}
		sleep 20
		j:=0
		while (j < numSubPlaylist) {
			Send {Down}
			j++ 
		}
		Sleep 35
	}
	Send {Enter}
	; Skip Pop-up if song is already in the playlist
	Sleep 400
	Send {Esc}

	Sleep 30
	;Moving the mouse back to where it was
	MouseMove, mouseX, mouseY, 0
	sleep 35
	if (Deactivated){
		WinActivate, %Titel%
	}
    BlockInput, Off
}

#IfWinActive ; This code works in any application
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
    Tippy("Reloading SpotifyScript")
    Sleep 500
    Reload
}
;<<<<<<<<<<<<<<<|||||||||||||||||>>>>>>>>>>>>>>>;
