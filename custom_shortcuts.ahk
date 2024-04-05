#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir, C:\Users\paul-louis.rossigno  ; Ensures a consistent starting directory.
^!t:: Run wt ; Launch a windows terminal instance

^LWin:: ;Ctrl + left Win key ; Hide/reveal windows taskbar
If WinExist("ahk_class Shell_TrayWnd")
{
	WinHide, ahk_class Shell_TrayWnd
	WinHide, ahk_class Shell_SecondaryTrayWnd
}
Else
{
	WinShow, ahk_class Shell_TrayWnd
	WinShow, ahk_class Shell_SecondaryTrayWnd
}
