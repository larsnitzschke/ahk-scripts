#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir% 
;<<<<<<<<<<<<<<<|||||||||||||||||>>>>>>>>>>>>>>>;
;<<<<<<<<<<<<<<<||||||Setup||||||>>>>>>>>>>>>>>>;
;<<<<<<<<<<<<<<<|||||||||||||||||>>>>>>>>>>>>>>>;
#SingleInstance force
Menu, Tray, Icon, C:\Users\Lars\Documents\ahk-scripts\Icons\spotifyAHK_16.png
OnMessage(0xF000, "TURN_OFF")
OnMessage(0xF001, "RELOAD")
;<<<<<<<<<<<<<<<|||||||||||||||||>>>>>>>>>>>>>>>;
;<<<<<<<<<<<<<<<|||||Macros||||||>>>>>>>>>>>>>>>;
;<<<<<<<<<<<<<<<|||||||||||||||||>>>>>>>>>>>>>>>;
#IfWinActive, ahk_exe spotify.exe
NumpadDot::
	if (WinActive("ahk_exe spotify.exe")){
        BlockInput, On
        Click, right
	    Sleep 50
	    Send {Up}
		Sleep 10
		Send {Up}
		Sleep 10
		Send {Up}
		Sleep 10
		Send {Enter}
		Sleep 10
        BlockInput, Off
    }
return
Numpad1::
	AddToPlaylist(1,-1) ;MusikiHasi
return
Numpad2:
	AddToPlaylist(2,2) ;Electronic Reloaded
return
Numpad3::
	AddToPlaylist(2,3) ;Electronic Holding
return
Numpad4::
	AddToPlaylist(3,-1) ;Warteschlange
return
Numpad5::
	AddToPlaylist(4,-1) ;Background
return
Numpad6::
	AddToPlaylist(5,-1) ;Epic Music
return
#IfWinActive
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
		variableX := Hoehe - 100
		Click, right, 100, %variableX%
	}
	else if (X==-9 && Y==-9 && Breite==1938 && Hoehe==1048) {
		;Vollbildmodus
		variableX := Hoehe - 100
		Click, right, 120, %variableX%
	}
	Sleep 35

	Send {Up 2}{Right}
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
	;Sleep 100
	;Send {Enter}

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
