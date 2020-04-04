SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#NoEnv
#SingleInstance force
#Persistent
SendMode Input  
SetBatchLines -1
Menu, Tray, Icon, search_32.png
CoordMode Mouse, Screen
;RegRead, LastScaleFactor, HKEY_LOCAL_MACHINE\SOFTWARE\ninjMag, LastScaleFactor
;Zoom:=LastScaleFactor
Zoom=3
Paused =1
FPS = 4
RefreshInterval:=(1000/FPS)
Antialiasing = 0
Gui +AlwaysOnTop +Resize +ToolWindow
;Gui, Add, Slider, vMySlider, 1
Rx = 128 									; half vertical/horizontal side of ninjMag window
Ry = 128
Zx := Rx/Zoom 							; frame x/y size
Zy := Ry/Zoom
OnExit GuiClose 

#x::
GuiClose:
	{
	DllCall("gdi32.dll\DeleteDC", UInt,hdc_frame )
	DllCall("gdi32.dll\DeleteDC", UInt,hdd_frame )
	RegWrite, REG_SZ, HKEY_LOCAL_MACHINE\SOFTWARE\ninjMag, LastScaleFactor, %Zoom%
	ExitApp
	}

#M::
   if Paused = 
		{ 
		Gui, 2:Hide 
        Gui, Hide 
        SetTimer, Repaint, Off
        Paused = 1
		}
   else
		{
		Gui Show, % "w" 2*Rx "h" 2*Ry "x3570 y905", ninjMag
		WinGet ninjMagID, id, ninjMag
		WinSet Transparent, 254, ninjMag ; makes the window invisible to magnification
		WinGet PrintSourceID, ID
		hdd_frame := DllCall("GetDC", UInt, PrintSourceID)
		hdc_frame := DllCall("GetDC", UInt, ninjMagID)
		SetTimer, Repaint, %RefreshInterval%
		Paused =
		}
SetTimer Repaint, %RefreshInterval%  

#if WinExist("ninjMag") 	; Conditional pass through
	{
	^+Up::							; Ctrl+Shift+ WHEEL or ARROW to Zoom
	^+Down::	 							
	^+WheelUp::                      
	^+WheelDown::                    	
	If (Zoom < 39 and ( A_ThisHotKey = "^+WheelUp" or A_ThisHotKey = "^+Up" ))
		Zoom *= 1.189207115         ; sqrt of (sqrt of 2))
	If (Zoom >  1 and ( A_ThisHotKey = "^+WheelDown" or A_ThisHotKey = "^+Down" ))
		Zoom /= 1.189207115
		Zx := Rx/zoom
		Zy := Ry/zoom
	Return
	}
if Zoom	
MouseGetPos, x, y
		ToolTip, MAG: %Zoom% Percent
		Sleep, 1000
 	
    
Repaint:
	{
	MouseGetPos x, y
	xz := In(x-Zx-6,0,A_ScreenWidth-2*Zx) ; keep the frame on screen
	yz := In(y-Zy-6,0,A_ScreenHeight-2*Zy) ; 
	WinMove Frame,,%xz%, %yz%, % 2*Zx, % 2*Zy  ;*****WILL SCOPE
	DllCall("gdi32.dll\StretchBlt", UInt,hdc_frame, Int,0, Int,0, Int,2*Rx, Int,2*Ry, UInt,hdd_frame, UInt,xz, UInt,yz, Int,2*Zx, Int,2*Zy, UInt,0xCC0020)        
	; SRCCOPY
Return
	}

GuiSize:
   Rx := A_GuiWidth/2
   Ry := A_GuiHeight/2
   Zx := Rx/Zoom
   Zy := Ry/Zoom
Return	

In(x,a,b) 
	{ 
     IfLess x,%a%, Return a
   IfLess b,%x%, Return b
   Return x
	}





