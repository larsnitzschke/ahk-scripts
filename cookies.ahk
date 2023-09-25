#NoEnv
#SingleInstance force
#WinActivateForce

onOff = True
SetTimer ClickIt, 10

F1::
    if (%onOff% = True){
        onOff = False
    } else {
        onOff = True
    }
    ; Alternative: Pause- Befehl pausiert den aktuellen Thread
return

ClickIt:
    if (%onOff% = True) {
        return
    } else {
        Send {Click}
    }
return