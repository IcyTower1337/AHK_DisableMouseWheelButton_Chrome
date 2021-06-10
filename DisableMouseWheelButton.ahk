#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance 
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Active := 1

OnMessage(0x404, "AHK_NOTIFYICON")
AHK_NOTIFYICON(wParam, lParam, uMsg, hWnd)
{
global
	if (lParam = 0x201) ;WM_LBUTTONDOWN := 0x201
	{
		Active := !Active
		MsgBox, %Active%
		checkIconState()
	}
	
}

checkIconState()
{
global
	if Active
	{
		Menu, Tray, Icon, iconON.png
	}
	if not Active
	{
		Menu, Tray, Icon, iconOFF.png
	}
	return
}

#IfWinActive ahk_exe chrome.exe
MButton::
return

#IfWinActive ahk_exe chrome.exe
^MButton::
Send {MButton}
return
