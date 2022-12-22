#NoEnv
#include C:\Script\AHK\- _ _ LiB\GDI+_All.ahk ;ninjMag, Matthew Wolff c.[2019-2022];
#include C:\Script\AHK\- _ _ LiB\Win_Move.ahk
#include C:\Script\AHK\- _ _ LiB\msgb0x.ahk
#include C:\Script\AHK\- _ _ LiB\Send_WMCOPYDATA.ahk
#include C:\Script\AHK\- _ _ LiB\SendWM_COPYDATA.ahk
#include C:\Script\AHK\- _ _ LiB\ico2hicon.ahk	
#include C:\Script\AHK\- _ _ LiB\Open_ScriptDir.ahk
#SingleInstance force	;	+#M:: Shif And M
Setcontroldelay -1		;	suggested to init from elevated script for hotkeys as below
SetBatchLines -1		;	suggested to init from UIA script for uiband as below
SetWinDelay -1			;	run % Mag_Path,
ListLines,Off
DetectHiddenWindows,On
DetectHiddenText,	On
SetTitleMatchMode,	2
SetTitleMatchMode,	Slow
SendMode,Input
CoordMode,Mouse,Screen
IniRead,LastScaleFactor,zoom.ini,LastScaleFactor,LastScaleFactor,4
icondll:= "C:\Script\AHK\Z_MIDI_IN_OUT\icons.DLL"
Img_UnC:= "C:\Script\AHK\GDI\images\GDI_Raster_(899).png"
menu,tray,noStandard
menu,tray,Icon,	C:\Script\AHK\Working\search_32.ico
menu,tray,add,	Open script location,Open_ScriptDir
menu,tray,icon,	Open script location,% icondll,7
menu,tray,Add,	Inverted,invert
menu,tray,icon,	Inverted,C:\Icon\32\9047532_2.ico,,32
menu,tray,Add,	TrayKillIcon,TrayKillIcon
menu,tray,standard
OnMessage(0x4a,"Receive_WM_COPYDATA")
gosub,Varz
optfollowcaret:= true 
onexit("guifade_tst")
mouseGetPos,x,y
OFFSet_:= (zoom *1.5)
wm_allow()
Init_gui:
Visible:= True
gui,BackMain:	New,-DPIScale +toolwindow +owner -SysMenu +AlwaysOnTop ;+E0x80000  ;+e0x20
gui,BackMain:+LastFound +HwndMainhWnd -Caption +AlwaysOnTop 
winset,transparent,1,ahk_id %MainhWnd%
;winset,transcolor,000000 
winSet,Region,	0-0 W%MagSize% H%MagSize% R%MagSize%-%MagSize%,
gui,BackMain: 	Show,na x-300 y-300 w%magsize% h%magsize%
gui,pic: 		New,-DPIScale +hwndhpic +parentBackMain +E0x80000 +AlwaysOnTop +ToolWindow
	gui,pic:+LastFound -Caption -SysMenu +OwnDialogs
	gui,pic:color,0f00f0
gui,VP:			New,+LastFound +HwndvphWnd -DPIScale -Caption -SysMenu +E0x20
winset,transparent,1,ahk_id %vphWnd%
gui,ss:			New,	+LastFound -Caption +hwndsswnd +parentBackMain -SysMenu +OwnDialogs
 gui,ss:color,000000 ;winSet,Transcolor,ff00ff
winset,transparent,1,ahk_id %MainhWnd%
gui,lens: 		New,-Caption -DPIScale +e0x20
gui,lens:+LastFound +hWndNinjMagiD	+disabled +AlwaysOnTop -SysMenu +ToolWindow +owndialogs
winSet,Region,0-0 W%MagSize% H%MagSize% R%MagSize%-%MagSize%,
gui,lens:color,000000
winset,transparent,1,ahk_id %NinjMagiD%
winset,transparent,1,ahk_id %MainhWnd%
(!Resize_complete? gsub("Region_set"))

Init:
mouseGetPos,x,y
OFFSet_:= Zoom*1.5m
,DesktopDC:=	DllCall("GetDC","UInt",maindevicecontextblabla)
,HDC_Frame:=	DllCall("GetDC","UInt",NinjMagiD)
,VP_Frame:=	DllCall("GetDC","UInt",vphwnd)

if(!Init_complete) {
	pToken:= Gdip_Startup()
	img_[(i>img_maxi? (i:= 1):i)]
	mouseGetPos,x,y
	 _x_:= round(Area_offset +(x-magoffset))
	,_y_:= round(Area_offset +(y-magoffset))
	(_x_<0? _x_:=0),			(_y_<0? _y_:=0)
	(_y_<0.5*magsize?			_x_-=30)
	(_x_<0? ((_x_>(x-(0.5*magsize +(0.5*magsize*0.25))))
	? (_x_:= abs(_x_ -30),		_y_:= abs(_y_))))
	Zx:= Zy:= 300/Zoom,			ViewX:= 2*Zx,ViewY:= 2*Zy
	(ViewY<0? ViewY:= 0),		(ViewX<0? ViewX:= 0)
	ViewPos_X:= x-zx,			ViewPos_Y:= y-zy
	(ViewPos_X<0? ViewPos_X=0),	(ViewPos_Y<0? ViewPos_Y=0)
	Initial_X:=_x_,		Initial_Y_y_:=_y_
	WinMove(MainhWnd,_x_,_y_,MagSize,MagSize) ;SWP_NOZORDER|SWP_NOACTIVATE;
	,testmaskDC:= DllCall("GetDC","UInt",hpic)
	,mdc:= DCStuff(Img_UnC) 
	,hSS_Frame:=	DllCall("GetDC","UInt",sswnd)
	,fade_decr:= 0x0
		BitBlt(vp_Frame,0,0,ViewX,Viewy,DesktopDC,ViewPos_X,ViewPos_y,srccopy)

	 gui,VP:	show,na x-150 y-150 w%ViewX% h%Viewy%
	gui,pic:	show,na x0 y0 w%magsize% h%magsize% ;gui,ss:show,na x0 y0 w%magsize% h%magsize%;gui,ss:hide
	gui,lens:	show,na x0 y0 w%magsize% h%magsize% ;gui,ss:show,na x0 y0 w%magsize% h%magsize%;gui,ss:hide
	gui,pic:	hide
	DllCall("UpdateLayeredWindow","UInt",ninjmagid,"UInt",0,"UInt",0,"Int64P",magsize|magsize<<32
	,		"UInt",mDC,"Int64P",0,"UInt",0,"IntP",1<<16|1<<24,"UInt",3)  
	DllCall("gdi32.dll\SetStretchBltMode","Uptr",HDC_Frame,"UInt",3)
	DllCall("gdi32.dll\SetStretchBltMode","Uptr",Hss_Frame,"UInt",3)
	DllCall("gdi32.dll\SetStretchBltMode","Uptr",VP_Frame,"UInt",3)
}

Init_complete:= 1
settimer,guiClose,-144000
StartTime:= A_TickCount
SetStretchBltMode(HDC_Frame,iStretchMode:=3)
SetStretchBltMode(mdc,iStretchMode:=3)

 
; WinMove(vphwnd,"","","","","NOSIZE,NOZORDER,NOACTIVATE,R,A")
WinMove(vphwnd,"","","","")

CaretXold:= A_CaretX, CaretYold:= A_CaretY
		BitBlt(HDC_Frame,0,0,ViewX,Viewy,DesktopDC,ViewPos_X,ViewPos_y,srccopy)
DllCall("UpdateLayeredWindow","UInt",NinjMagiD,"UInt",0,"UInt",0,"Int64P"
,	viewx|viewy<<32,"UInt",DesktopDC,"Int64P",ViewPos_X,"UInt",y,"IntP",1<<16|1<<24,"UInt",2)
;winhide,ahk_id %mainhwnd%
gui,pic: show,x%ViewPos_X% y%ViewPos_y% h%magsize% w%magsize%
gui,lens: show,x%ViewPos_X% y%ViewPos_y% h%magsize% w%magsize%
gui,ss: show,x%ViewPos_X% y%ViewPos_y% h%magsize% w%magsize%
;gui,BackMain: show,x%ViewPos_X% y%ViewPos_y% h%magsize% w%magsize%
	BitBlt(vp_Frame,0,0,ViewX,Viewy,DesktopDC,ViewPos_X,ViewPos_y,srccopy)
	DllCall("gdi32.dll\StretchBlt","UInt",Hss_Frame,"Int",0,"Int",0,"Int"
	,	magsize,"Int",magsize,"UInt",vp_Frame,"UInt"
	,	0,"UInt",0,"Int",ViewX,"Int",ViewY,"UInt",srccopy)
DllCall("gdi32.dll\StretchBlt","UInt",Hss_Frame,"Int",0,"Int",0,"Int"
	,	magsize,"Int",magsize,"UInt",vp_Frame,"UInt"
	,	0,"UInt",0,"Int",ViewX,"Int",ViewY,"UInt",srccopy)
;	gui,ss:		show,na x0 y0 w%magsize% h%magsize%
;gui,pic:	show,na x0 y0 w%magsize% h%magsize%
;win_animate(sswnd,"activate blend",2000)

sleep,20
	SetWinDelay,-1

loop, {
	if(a_index=2) {
		gosub,fadein
		FPStest:=true
		(FPS_test? Frame_i:= 0, TimeS:= a_tickcount)
	}
	Frame_i++
	((Frame_i=200)&&FPStest? FPS_:=((((a_tickcount-TimeS)*.002)**-1)*1000)) ; / Frame_i
	(FPS_?(tt(FPS_,ViewX,ViewY,4),FPS_:=0))
	((toggling||Paused)? return())
	(!Resize_complete? gsub("Region_set"))
	mouseGetPos,x,y
	if(!(CaretXold=A_CaretX&&CaretYold=A_CaretY)) 
	&& (!(A_CaretX=0||A_CaretX="")&&!(A_CaretY=0||A_CaretY="")&&(50<A_timeidlemouse)) {
		xold:= x, yold:= y, icobz:= true
		, mpos:= wingetpos(winexist("a"))
		c_x:= mpos.x-80, c_y:= mpos.y-172
	}	
	_x_:= round((x -magoffset) +Area_offset), _y_:= round((y -magoffset) +Area_offset)
	(	 _x_<0?		_x_:= 0)
	 (( _y_<0 )? _y_=0, (_x_>(x -(magsize +(magsize*.334))))? _x_:= _x_ -30, (_x_<0? _x_=0))
	Zx:= Zy:= magsize*(Zoom**-1), ViewX:= ViewY:= 2*Zy
	(ViewY<0? ViewY:= 0), (ViewX<0? ViewX:= 0)
	(ViewPos_X<0? ViewPos_X=0),	(ViewPos_Y<0? ViewPos_Y=0)
	if(icobz&&optfollowcaret) {
		CaretXold:= A_CaretX, CaretYold:= A_CaretY
	,	ViewPos_X:= c_x+A_CaretX, ViewPos_Y:= c_x+A_CaretY
	} else,ViewPos_X:= x -zx, ViewPos_Y:= y -zy 
	(!(x=xold||y=yold)? icobz:= false)
	WinMove(MainhWnd,_x_,_y_,MagSize,MagSize) ; SWP_NOZORDER + SWP_NOACTIVATE
;	BitBlt(vp_Frame,0,0,ViewX,Viewy,DesktopDC,ViewPos_X,ViewPos_y,srccopy)
	DllCall("gdi32.dll\StretchBlt","UInt",Hss_Frame,"Int",0,"Int",0,"Int"
	,	magsize,"Int",magsize,"UInt",DesktopDC,"UInt"
	,	ViewPos_X ,"UInt",ViewPos_Y,"Int",ViewX,"Int",ViewY,"UInt",srccopy)
	;DllCall("gdi32.dll\StretchBlt","UInt",Hss_Frame,"Int",0,"Int",0,"Int"
	;,	magsize,"Int",magsize,"UInt",vp_Frame,"UInt"
	;,	0,"UInt",0,"Int",ViewX,"Int",ViewY,"UInt",srccopy)
	;winset,transparent,off,ahk_id %mainhwnd%
}


fadein:
if(the_end){
	msgb0x()
	return,
}
gui,ss:		show,na x0 y0 w%magsize% h%magsize%
gui,pic:	show,na x0 y0 w%magsize% h%magsize%
;win_animate(mainhwnd,"activate blend",2000)

mouseGetPos,x,y
Zx:= Zy:= 300/Zoom, ViewX:= 2*Zx, ViewY:= 2*Zy
(ViewY<0? ViewY:= 0), (ViewX<0? ViewX:= 0)
DllCall("UpdateLayeredWindow","UInt",hpic,"UInt",0,"UInt",0,"Int64P",magsize|magsize<<32
,	"UInt",mDC,"Int64P",0,"UInt",0,"IntP",255<<16|1<<24,"UInt",2), fade_decr:= 1
winset,transparent,%fade_decr%,ahk_id %MainhWnd%
WinMove(MainhWnd,_x_,_y_,MagSize,MagSize) ; SWP_NOZORDER + SWP_NOACTIVATE
loop,64 {
	mouseGetPos,x,y ;_x_:=Area_offset+(x-magoffset), ;_y_:=Area_offset+(y-magoffset)
	 _x_:= round(Area_offset +(x-magoffset))
	,_y_:= round(Area_offset +(y-magoffset))
	loop,700 {
		sleep -1
		sleep -1 
		sleep,-1
		sleep,-1
		sleep,-1
		sleep,-1
		sleep,-1
		sleep,-1
		sleep,-1
	}
;	BitBlt(HDC_Frame,0,0,ViewX,Viewy,DesktopDC,ViewPos_X,ViewPos_y,srccopy)
;	DllCall("UpdateLayeredWindow","UInt",hpic,"UInt",0,"UInt",0,"Int64P",magsize|magsize<<32
;	,	"UInt",DesktopDC,"Int64P",0,"UInt",0,"IntP",Format("{:#x}",fade_decr)<<16|1<<24,"UInt",2)
	winset,transparent,%fade_decr%,ahk_id %MainhWnd%
	DllCall("UpdateLayeredWindow","UInt",sswnd,"UInt",0,"UInt",0,"Int64P",magsize|magsize<<32
,	"UInt",mDC,"Int64P",0,"UInt",0,"IntP",Format("{:#x}",fade_decr)<<16|1<<24,"UInt",3)
	DllCall("UpdateLayeredWindow","UInt",sswnd,"UInt",0,"UInt",0,"Int64P",magsize|magsize<<32
,	"UInt",mDC,"Int64P",0,"UInt",0,"IntP",Format("{:#x}",fade_decr)<<16|1<<24,"UInt",3)
	winset,transparent,%fade_decr%,ahk_id %MainhWnd%
	Win_Move(MainhWnd,_x_,_y_,"","") ; SWP_NOZORDER + SWP_NOACTIVATE
	fade_decr+= 4
}
The_End:= 1
return,

WinMove(hWnd="",X="",Y="",W="",H="") { ;,Flags=""
	return,DllCall("SetWindowPos","uint",hWnd,"uint",0,"int",x,"int",y,"int",w,"int",h,"uint",16388)
}

DCStuff(Img) {
	global
	pBitmap:= Gdip_CBitmapFromFile(Img), CURRENT_W:= Gdip_GetImage_W(pBitmap)
	, CURRENT_H:= Gdip_GetImage_H(pBitmap), pImage:= Gdip_CreateBMP(CURRENT_W*wscale:= 1
	, CURRENT_H *hscale:= 1), G2:= Gdip_GfxFromImage(pImage)
	Gdip_DrawImgfast(G2,pBitmap,0,0), Gdip_Set_InterpolationMode(G2,1), Gdip_Set_SmoothingMode(G2,1)
	, mDC:= Gdi_CreateDC(0), mBM:= Gdi_Create_DIB((mDC), CURRENT_W,CURRENT_H,32)
	, oBM:= Gdi_Select_Obj(mDC,mBM), pGFX:= Gdip_Pgfx_From_HDC(mDC)
	try,Gdip_DrawImgRect(pGFX,pImage,0,0,CURRENT_W,CURRENT_H)
		DllCall("UpdateLayeredWindow","UInt",hpic,"UInt",0,"UInt",0,"Int64P",magsize|magsize<<32
,	"UInt",mDC,"Int64P",0,"UInt",0,"IntP",0xFF<<16|1<<24,"UInt",2)
	return,mDC
}

gui(byref guiname="",byref command1="",byref command2="") {
	global
	( !command1? command1:= guiname : guiname:= "_")
	(	!guiname?  guiname:= "_" : ("") )
	gui,% guiname ": " command1 (!(command2="")?(,command2:="_") : (""))
	return,
}

t_t(TxT="",x:="",y="",dur="") {
	listlines,off
	(TxT=""? TxT:= A_now)
	if(x && !isInt(x)) { ;allow2declare a_LocStr
		isInt(y)? (y? dur:= y) ;transpose potential arg
		somethingElseThatMightBeDeclarableLater:= dur? dur : () 
		switch (tt_loc:= X)	{
			case "center" : x:=	(A_screenwidth *.5) -80,y:= (A_screenheight*.5) -35
			case "tray"	  : x:= A_screenwidth-10,		y:=	45
			case "!tray"  : x:=	A_screenwidth-10,		y:= A_screenheight -10
		}
	} else (!y&&!dur? dur:= (x? x:-880)) ;def T/0 880 ms
	((dur&&!dur=0)? (dur<100&&-100<dur)? (dur *=1000)) ;(t_o as param.2 (Int||str))
	ToolTip,% TxT,% (x&&y? x:""),% (x&&y? y:""),1 ;(y="center"? y:= (A_screenheight*.5)-35)
	SetTimer,t_o,% ((instr(dur,"-")||(dur<0))? dur : ("-" . dur))
	return,~errOrlevel
} ; (x="center"?Dur:=y, x:=(A_screenwidth*0.5)-80, y:=(A_screenheight*.5)-35,)

t_o:
listlines,off
tooltip,
return,


Region_set:
sleep,100
winSet,Region,0-0 W%MagSize% H%MagSize% R%MagSize%-%MagSize%,ahk_id %NinjMagiD%
Resize_complete:= 1
return,

T_det:
if(ElapsedTime:= A_TickCount -StartTime)>1000
	if KeyIsDown:= GetKeyState("LWin","P")
		if(KeyIsDown:= GetKeyState("m","P"))
			Paused:= 1, Resize_complete:= False
			,gui("lens","Hide"), toggling:= True ;gui,2:Hide
return,

TrayKillIcon:
menu,tray,NoIcon
visible:= !(toggling:= Paused:= true)
return, ;//gui,ss:hide;gui,BackMain:hide IniWrite,%Zoom%,zoom.ini,LastScaleFactor,LastScaleFactor

guiClose:
gosub,Cleanup
exitapp,

Cleanup:
menu,tray,noicon ; visible:= false;toggling:= (Paused:= true); gui,"lens":"hide"
return,

Clear_up_gdi:
DllCall("gdi32.dll\DeleteDC",UInt,HDC_Frame )
DllCall("gdi32.dll\DeleteObject",UInt,HDC_Frame)
DllCall("gdi32.dll\DeleteDC",UInt,DesktopDC )
DllCall("gdi32.dll\DeleteObject",UInt,DesktopDC)
exitapp,
return,

guifade_tst() { ;DllCall("SetParent","UInt",hpic,"UInt",MainhWnd) ;gui,ss:hide ;Win_Animate(MainhWnd,"hide blend",999)
	global
	loop,255 {
		winset,transparent,%fade_decr%,ahk_id %sswnd%
		DllCall("gdi32.dll\SetStretchBltMode","Uptr",HDC_Frame,"UInt",3)
		DllCall("gdi32.dll\SetStretchBltMode","Uptr",Hss_Frame,"UInt",3)
		DllCall("UpdateLayeredWindow","UInt",sswnd ,"UInt",0,"UInt",0,"Int64P",magsize|magsize<<32
	,	"UInt",mDC,"Int64P",0,"UInt",0,"IntP",(ssds:=Format("{:#x}",fade_decr))<<16|1<<24,"UInt",3)
		sleep,-1
		DllCall("UpdateLayeredWindow","UInt",sswnd ,"UInt",0,"UInt",0,"Int64P",magsize|magsize<<32
	,	"UInt",mDC,"Int64P",0,"UInt",0,"IntP",(aaa:=Format("{:#x}",fade_decr))<<16|1<<24,"UInt",3) 
		DllCall("UpdateLayeredWindow","UInt",sswnd ,"UInt",0,"UInt",0,"Int64P",magsize|magsize<<32
	,	"UInt",mDC,"Int64P",0,"UInt",0,"IntP",(ssds:=Format("{:#x}",fade_decr))<<16|1<<24,"UInt",3)
		sleep,-1
		DllCall("UpdateLayeredWindow","UInt",sswnd ,"UInt",0,"UInt",0,"Int64P",magsize|magsize<<32
	,	"UInt",mDC,"Int64P",0,"UInt",0,"IntP",(aaa:=Format("{:#x}",fade_decr))<<16|1<<24,"UInt",3)
		DllCall("UpdateLayeredWindow","UInt",sswnd ,"UInt",0,"UInt",0,"Int64P",magsize|magsize<<32
	,	"UInt",mDC,"Int64P",0,"UInt",0,"IntP",(ssds:=Format("{:#x}",fade_decr))<<16|1<<24,"UInt",3)
		sleep,-1
		DllCall("UpdateLayeredWindow","UInt",sswnd ,"UInt",0,"UInt",0,"Int64P",magsize|magsize<<32
	,	"UInt",mDC,"Int64P",0,"UInt",0,"IntP",(aaa:=Format("{:#x}",fade_decr))<<16|1<<24,"UInt",3) 
		DllCall("UpdateLayeredWindow","UInt",sswnd ,"UInt",0,"UInt",0,"Int64P",magsize|magsize<<32
	,	"UInt",mDC,"Int64P",0,"UInt",0,"IntP",(ssds:=Format("{:#x}",fade_decr))<<16|1<<24,"UInt",3)
		sleep,-1
		DllCall("UpdateLayeredWindow","UInt",sswnd ,"UInt",0,"UInt",0,"Int64P",magsize|magsize<<32
	,	"UInt",mDC,"Int64P",0,"UInt",0,"IntP",(aaa:=Format("{:#x}",fade_decr))<<16|1<<24,"UInt",3)
		fade_decr--
	}
	gsub("Cleanup"), gsub("Clear_up_gdi")
}
;==========BINDZ================================BINDZ======================================BINDZ====
#q:: Gosub("fad3out")
~#B:: ; Inverted Mag-Colour Toggle
 Invert:
(Invert:= !Invert)? SRCCOPY:=NOTSRCCOPY : SRCCOPY:="0x00CC0020"
return,

#z::
t_t(aa)
(aa<img_maxi)?():aa:=1
mdc:= DCStuff(Img_[aa++])
return,

#,::
mode1:=blitmodes[Numm--]
tooltip,% mode1 " " Numm
settimer,tooloff,-500
return,

#.::
Numm++
mode1:=blitmodes[Numm]
tooltip,% mode1 " " Numm
settimer,tooloff,-500
return,

^+Left::(MagSize:= (MagSize +4), MagOffset:= (MagOffset +4),Resize_complete:= "")

^+Right:: (MagSize:= (MagSize -4), MagOffset:= (MagOffset -4), Resize_complete:= "")

^+p:: ; #ifWinExist("ninjMag")
^+d:: ;; CTRL-&-SHIFT-&-M_WHEEL_D/U;
^+Up::		;	||KB_ARROW L/R 2Zoom	;		;
^+Down::	;		||ArrowKeys D/U		;		;
; ^+WheelUp::
; ^+WheelDown::
if(Zoom<24 && (A_ThisHotKey="^+p"||A_ThisHotKey="^+Up")) {
	(Zoom:= round(Zoom*=1.189))++ ;(cuberoot 2)
	; switch Zoom {
		; case 3 : Zoom=4
		; case 5 : Zoom=6
		; case 7 : Zoom=8
		; case 9 : Zoom=10
	; }
} else,if(Zoom>1.0&&(A_ThisHotKey="^+d"||A_ThisHotKey="^+Down")) {	;Zoom:= round(Zoom /= 1.189)
	(Zoom:= floor(Zoom*=0.811))--
	; switch,Zoom {
		; case 3 : Zoom=4
		; case 5 : Zoom=4
		; case 7 : Zoom=6
		; case 9 : Zoom=8
}	;}
Area_offset:= round(1.2 *zoom)
return,

Receive_WM_COPYDATA(wParam,lParam) {
	CopyOfData:= StrGet(NumGet(lParam +(2* A_PtrSize)))
	gosub,% CopyOfData
	return,TT(CopyOfData)
	;return,True
}

fad3out:
msgbox grg
Win_Animate(MainhWnd,"hide blend",999)
sleep,1000
exitapp,
return,

gsub(label){ ;obv?.
	if(strlen(label)<1)
		return,msgb0x("bad label")
	else,if(islabel(label))
		gosub,%label%
	else,return,msgb0x("bad label: " label)
	return,1
}

~esc::
exitapp,
return,

;==END OF BINDS====END OF BINDS====END OF BINDS====END OF BINDS=;

;	;	G-Dip-f0nx	;	;	G-Dip-f0nx	;	;	G-Dip-f0nx	;	;
Gdip_CBitmapFromFile(sFile,IconNumber:=1,IcoSz:="",useICM:=0) {
	pBitmap:= pBitmapOld:= hIcon:= 0
	SplitPath,sFile,,,Extension
	if(RegExMatch(Extension,"^(?i:exe|dll)$")) {
		Sizes:= IcoSz? IcoSz : 256 "|" 128 "|" 64 "|" 48 "|" 32 "|" 16
		,SzBuf:= 16 +(2*A_PtrSize)
		,VarSetCapacity(buf,SzBuf,0)
		For,eachSize,Size in StrSplit( Sizes,"|" )
		{
			DllCall("PrivateExtractIcons","str",sFile,"Int",IconNumber-1,"Int"
			,		Size,"Int",Size,"UPtr*",hIcon,"UPtr*",0,"UInt",1,"UInt",0)
			if(!hIcon)
				continue,
			if(!DllCall("GetIconInfo","UPtr",hIcon,"UPtr",&buf)) {
				DestroyIcon(hIcon)
				continue,
			}
			hbmMask:= NumGet(buf,12 +(A_PtrSize -4))
			, hbmColor:= NumGet(buf,12 +(A_PtrSize -4) +A_PtrSize)
			if(hbmColor && DllCall("GetObject","UPtr",hBmColor,"Int",SzBuf,"UPtr",&buf)) {
				DestroyIcon(hIcon)
				continue,
			}
			break,
		}
		if(!hIcon)
			return,-1
		Width:= NumGet(buf,4,"Int"), Height:= NumGet(buf,8,"Int")
		hBm:= CreateDIBSection(Width,-Height), hdc:= CreateCompatibleDC()
		, obm:= SelectObject(hdc,hBm)
		if(!DllCall("DrawIconEx","UPtr",hdc,"Int",0,"Int",0,"UPtr"
		,hIcon,"UInt",Width,"UInt",Height,"UInt",0,"UPtr",0,"UInt",3)) {
			SelectObject(hdc,obm)
			DeleteObject(hBm), DeleteDC(hdc)
			DestroyIcon(hIcon), buf:= ""
			return,-2
		}

		VarSetCapacity(dib,104)
		DllCall("GetObject","UPtr",hBm,"Int",A_PtrSize=8? 104:84,"UPtr",&dib)
		Stride:= NumGet(dib,12,"Int") ;sizeof(DIBSECTION)=76+2*(A_PtrSize=8?4:0)+2*A_PtrSize
		Bits:= NumGet(dib,20 +(A_PtrSize=8? 4:0)) ;padding
		pBitmapOld:= Gdip_CreateBMP(Width,Height,0,Stride,Bits)
		pBitmap:= Gdip_CreateBMP(Width,Height)
		_G:= Gdip_GfxFromImage(pBitmap)
		Gdip_DrawImage(_G,pBitmapOld,0,0,Width,Height,0,0,Width,Height)
		SelectObject(hdc,obm)
		DeleteObject(hBm)
		DeleteDC(hdc)
		Gdip_DeleteGraphics(_G)
		Gdip_DisposeImage(pBitmapOld)
		DestroyIcon(hIcon)
		dib:= "", buf:= ""
	} else {
		function2call:= (useICM=1)? "ICM":""
		gdipLastError:= DllCall("gdiplus\GdipCreateBitmapFromFile" function2call,"WStr",sFile,"UPtr*",pBitmap)
	}
	Return,pBitmap
}
Gdip_CreateBMP(Width,Height,PixelFormat:=0,Stride:=0,Scan0:=0) { ; By default, this function creates a new 32-ARGB bitmap.
	pBitmap:= 0 ; modified by Marius Șucadik
	((!PixelFormat)? PixelFormat:= 0x26200A)	; 32-ARGB
	DllCall("gdiplus\GdipCreateBitmapFromScan0"
		,"Int",		Width
		,"Int",		Height
		,"Int",		Stride
		,"Int",		PixelFormat
		,"UPtr",	Scan0
		,"UPtr*",	pBitmap)
	Return,pBitmap
}
Gdip_GetImage_W(pBitmap) {
	Width:= 0
	gdipLastError:= DllCall("gdiplus\GdipGetImageWidth","UPtr",pBitmap,"UInt*",Width)
	Return,Width
}
Gdip_GetImage_H(pBitmap) {
	Height:= 0
	gdipLastError:= DllCall("gdiplus\GdipGetImageHeight","UPtr",pBitmap,"UInt*",Height)
	Return,Height
}
Gdip_GfxFromImage(pBitmap,InterpolationMode:="",SmoothingMode:="",PageUnit:="",CompositingQuality:="") {
	pGraphics:= 0, gdipLastError:= DllCall("gdiplus\GdipGetImageGraphicsContext","UPtr",pBitmap,"UPtr*",pGraphics)
	((gdipLastError=1&&A_LastError=8)? gdipLastError:= 3) ;out of memory
	if(pGraphics && !gdipLastError) {
		((InterpolationMode!="")? Gdip_Set_InterpolationMode(pGraphics,InterpolationMode))
		((SmoothingMode!="")? Gdip_Set_SmoothingMode(pGraphics,SmoothingMode))
		((PageUnit!="")? Gdip_SetPageUnit(pGraphics,PageUnit))
		((CompositingQuality!="")? Gdip_SetCompositingQuality(pGraphics,CompositingQuality))
	}
	Return,pGraphics
}
gdip_DrawImg(pGraphics,pBitmap,dx:="",dy:="",dw:="",dh:="",sx:="",sy:="",sw:="",sh:="",Matrix:=1,Unit:=2,ImageAttr:=0) {
	Static Ptr:= "UPtr"
	if(!ImageAttr) {
		if(!IsNumber(Matrix))
			ImageAttr:= Gdip_SetImageAttributesColorMatrix(Matrix)
		else,if(Matrix!=1)
			ImageAttr:= Gdip_SetImageAttributesColorMatrix("1|0|0|0|0|0|1|0|0|0|0|0|1|0|0|0|0|0|" Matrix "|0|0|0|0|0|1")
	} else,usrImageAttr:= 1

	if(dx!="" && dy!="" && dw="" && dh="" && sx="" && sy="" && sw="" && sh="") {
		sx:= sy:= 0
	,	sw:= dw:= Gdip_GetImageWidth(pBitmap)
	,	sh:= dh:= Gdip_GetImageHeight(pBitmap)
	} else,if(sx="" && sy="" && sw="" && sh="")	{
		if(dx="" && dy="" && dw="" && dh="") {
		sx:= dx:= 0,sy:= dy:= 0
	,	sw:= dw:= Gdip_GetImageWidth(pBitmap)
	,	sh:= dh:= Gdip_GetImageHeight(pBitmap)
		} else {
			sx:= sy:= 0
		,	Gdip_GetImageDimensions(pBitmap,sw,sh)
	}	}
	_E:= DllCall("gdiplus\GdipDrawImageRectRect"
		,Ptr,pGraphics
		,Ptr,pBitmap
		,"float",dX,"float",dY
		,"float",dW,"float",dH
		,"float",sX,"float",sY
		,"float",sW,"float",sH
		,"Int",Unit
		,Ptr,ImageAttr? ImageAttr:0
		,Ptr,0,Ptr,0)
	((ImageAttr& usrImageAttr!=1)? Gdip_DisposeImageAttributes(ImageAttr))
	Return,_E
}
Gdip_DrawImgFast(pGraphics,pBitmap,X:=0,Y:=0) {
	Return,DllCall("gdiplus\GdipDrawImage"
			,"UPtr",pGraphics
			,"UPtr",pBitmap
			,"float",X
			,"float",Y)
}
Gdip_Set_InterpolationMode(pGraphics,InterpolationMode) {
	if(!pGraphics)
		Return,2
	Return,DllCall("gdiplus\GdipSetInterpolationMode","UPtr",pGraphics,"Int",InterpolationMode)
}
Gdip_Set_SmoothingMode(pGraphics,SmoothingMode) { ; SmoothingMode options : 
;Default=0 HighSpd=1 HighQual=2 None=3 AntiAlias=4 AntiAliasx4=5 AntiAliasx8=6
	if(!pGraphics)
		Return,2
	Return,DllCall("gdiplus\GdipSetSmoothingMode","UPtr",pGraphics,"Int",SmoothingMode)
}
Gdip_DrawImgRect(pGraphics,pImage,nL,nT,nW,nH) {
	Return,DllCall("gdiplus\GdipDrawImageRectI","UInt",pGraphics,"UInt",pImage,"Int",nL,"Int",nT,"Int",nW,"Int",nH)
}

Gdip_Pgfx_From_HDC(hDC) {
	DllCall("gdiplus\GdipCreateFromHDC","UInt",hDC,"UIntP",pGraphics)
	Return,pGraphics
}

Gdi_Create_DIB(hDC,nW,nH,bpp =32,ByRef pBits="") {
	NumPut(VarSetCapacity(bi,40,0),bi)
,	NumPut(nW,bi,4), NumPut(nH,bi,8)
,	NumPut(bpp,NumPut(1,bi,12,"UShort"),0,"Ushort")
	Return,DllCall("gdi32\CreateDIBSection","UInt",hDC,"UInt",&bi,"UInt",DIB_RGB_COLORS:=0,"UIntP",pBits,"UInt",0,"UInt",0)
}
Gdi_Select_Obj(hDC,hGdiObj) {
	Return,DllCall("gdi32\SelectObject","UInt",hDC,"UInt",hGdiObj)
}
Gdi_Del_Obj(hGdiObj) {
	Return,DllCall("gdi32\DeleteObject","UInt",hGdiObj)
}
Gdi_Del_DC(hDC) {
	Return,DllCall("gdi32\DeleteDC","UInt",hDC)
}
Gdi_CreateDC(hDC=0) {
	Return,DllCall("gdi32\CreateCompatibleDC","UInt",hDC)
}

isInt(var) {			; In(x,a,b)	{
	if var is Integer	; IfLess x,%a%,return,a
		 return,1		; IfLess b,%x%,return,b
	else,return,0		; return,x
}						; }

return() {
	exit,
}

;====----
;=======----
varz:	;=-----
;=======----
Img_:= []
loop,files,	C:\Script\AHK\GDI\images\*.png,
,img_maxi:= a_index,img_.push(A_LoopFileLongPath)
global the_end,CaretXold,CaretYold,xold,yold,icobz
,Area_offset:= (1.2 *(Zoom:= LastScaleFactor? LastScaleFactor : 8))
,RefreshInterval:=(1000/(FPS:=60)),MagOffset:=(48+(MagSize:=w:=h:=300))
,Numm:= 1,R_DPI:= A_ScreenDPI/96,aa:=1,icondll:= "C:\Script\AHK\Z_MIDI_IN_OUT\icons.DLL"
,fade_decr:= 255,img_maxi
,_:="Antialias_on,Zoom,FPS,Zoom,MagSize,RefreshInterval,R_DPI,MagOffset,x,y,Area_offset
,magoffset,NinjMagiD,MagSize,rim_,Init_complete,OFFSet_,w,h,mode1,Numm,visible
,Paused,toggling,i,aa,c_x,c_y,optfollowcaret,fade_decr"
loop,parse,% _,`,
	global (%A_loopfield%)
global SS_BITMAP:= 0xE,SS_ICON:= 0x3,STM_SETIMAGE:= 0x172,IMAGE_BITMAP:= 0x0
,	BLACKNESS:= 0x00000042,NOTSRCERASE:= 0x001100A6,NOTSRCCOPY:= 0x00330008
,	DSTINVERT:= 0x00550009,PATINVERT:= 0x005A0049,SRCINVERT:= 0x00660046,SRCAND:= 0x008800C6
,	MERGEPAInt:= 0x00BB0226,MERGECOPY:= 0x00C000CA,SRCCOPY:= 0x00CC0020,SRCPAInt:= 0x00EE0086
,	PATCOPY:= 0x00F00021,PATPAInt:= 0x00FB0A09,WHITENESS:= 0x00FF0062,CAPTUREBLT:= 0x40000000
,	NOMIRRORBITMAP:= 0x80000000,SRCCOPY:= 0x00CC0020,SRCERASE:= 0x00440328

global Rastas:=[]
rastas[IMAGE_BITMAP]:= 0x0,rastas[SRCCOPY]:=	0x00CC0020,rastas[BLACKNESS]:= 0x00000042,
rastas[NOTSRCERASE]:= 0x001100A6,rastas[PATINVERT]:= 0x005A0049,rastas[MERGECOPY]:= 0x00C000CA
rastas[NOTSRCCOPY]:= 0x00330008,rastas[SRCERASE]:= 0x00440328,rastas[DSTINVERT]:= 0x00550009,
rastas[SRCINVERT]:= 0x00660046,rastas[SRCAND]:= 0x008800C6,rastas[MERGEPAInt]:= 0x00BB0226,
rastas[SRCCOPY]:= 0x00CC0020,rastas[SRCPAInt]:= 0x00EE0086,rastas[PATCOPY]:= 0x00F00021,
rastas[PATPAInt]:= 0x00FB0A09,rastas[WHITENESS]:= 0x00FF0062,rastas[CAPTUREBLT]:= 0x40000000,
rastas[NOMIRRORBITMAP]:= 0x80000000,

blitmodes:= [], blitmodes:= [BLACKNESS, NOTSRCERASE, NOTSRCCOPY, SRCERASE, DSTINVERT
, PATINVERT, SRCINVERT, SRCAND, MERGEPAInt, MERGECOPY, SRCCOPY, SRCPAInt, PATCOPY
, PATPAInt, WHITENESS, CAPTUREBLT, NOMIRRORBITMAP]
return,

Open_ScriptDir()
Win_Animate(Hwnd,Type="",Time=100) {
	static AW_ACTIVATE = 0x20000,AW_BLEND=0x80000,AW_CENTER=0x10,AW_HIDE=0x10000
		, AW_HNEG=0x2,AW_HPOS=0x1,AW_SLIDE=0x40000,AW_VNEG=0x8,AW_VPOS=0x4
	       hFlags := 0
	loop,parse,Type,%A_Tab%%A_Space%,%A_Tab%%A_Space%
		ifEqual,A_LoopField,,continue
		else hFlags |= AW_%A_LoopField%

	ifEqual,hFlags,,return "Err: Some of the types are invalid"
	dllcall("AnimateWindow","uint",Hwnd,"uint",Time,"uint",hFlags)
}
; _x_:=round(Area_offset +(x-(magoffset *0.5))) -200, ;_y_:=round(Area_offset +(y-(magoffset *0.5))) -200
	; (_x_<0? _x_:=0),		(_y_<0? _y_:= 0); (_y_<0.5*magsize? _x_-= 30); (_x_<0? ((_x_>(x-(0.5*magsize +(0.5*magsize/4))))
	; ? (_x_:= abs(_x_ -30),	_y_:= abs(_y_))))

;	SS_BITMAP:= 0xE,SS_ICON:= 0x3,STM_SETIMAGE:= 0x172,IMAGE_BITMAP:= 0x0,SRCCOPY:= 0x00CC0020,BLACKNESS:= 0x00000042,NOTSRCERASE:= 0x001100A6,NOTSRCCOPY:= 0x00330008,SRCERASE:= 0x00440328,DSTINVERT:= 0x00550009,PATINVERT:= 0x005A0049,SRCINVERT:= 0x00660046,SRCAND:= 0x008800C6,MERGEPAInt:= 0x00BB0226,MERGECOPY:= 0x00C000CA,SRCCOPY:= 0x00CC0020,SRCPAInt:= 0x00EE0086,PATCOPY:= 0x00F00021,PATPAInt:= 0x00FB0A09,WHITENESS:= 0x00FF0062,CAPTUREBLT:= 0x40000000,NOMIRRORBITMAP:= 0x80000000,

;	DllCall("UpdateLayeredWindow","UInt",vphwnd,"UInt",0,"UInt",0,"Int64P"
;,viewx|viewy<<32,"UInt",DesktopDC,"Int64P",ViewPos_X,"UInt",y,"IntP",0xFF<<16|1<<24,"UInt",2)
;	DllCall("UpdateLayeredWindow","UInt",vphwnd,"UInt",0,"UInt",0,"Int64P"
;,viewx|viewy<<32,"UInt",vp_Frame,"Int64P",ViewPos_X,"UInt",y,"IntP",0xFF<<16|1<<24,"UInt",2)

;	DllCall("gdi32.dll\StretchBlt",UInt,vp_Frame,Int,ViewPos_X,Int,ViewPos_Y,Int
;,	ViewX,Int,Viewy,UInt,DesktopDC,UInt)
;	winSet,EXStyle,	+0x00200000,ahk_id %VPhwnd%
	;DllCall("UpdateLayeredWindow","UInt",vphwnd,"UInt",0,"UInt",0,"Int64P",ViewX|Viewy<<32
;,	"UInt",vp_Frame,"Int64P",0,"UInt",0,"IntP",0x8<<16|1<<24,"UInt",2) ;msgbox % _nx " " _nY	;

;	DllCall("UpdateLayeredWindow","UInt",MainhWnd,"UInt",0,"UInt",0,"Int64P"
; ,	magsize|magsize<<32,"UInt",DesktopDC,"Int64P",500,"UInt",500,"IntP",1<<16|1<<24,"UInt",2)
; 	sleep,60

;	;BitBlt(vp_Frame,0,0,ViewX,Viewy,DesktopDC,ViewPos_X,ViewPos_y,srccopy)
;	DllCall("UpdateLayeredWindow","UInt",MainhWnd,"UInt",0,"UInt",0,"Int64P",ViewX|Viewy<<32
;	,	"UInt",vp_Frame,"Int64P",0,"UInt",0,"IntP",0x2<<16|1<<24,"UInt",2) ;msgbox % _nx " " _nY	;
;	winSet,EXStyle,	-0x00200000,ahk_id %VPhwnd%
;	DllCall("UpdateLayeredWindow","UInt",vphwnd,"UInt",0,"UInt",0,"Int64P",ViewX|Viewy<<32
;	,	"UInt",vp_Frame,"Int64P",0,"UInt",0,"IntP",0xff<<16|1<<24,"UInt",2) ;msgbox % _nx " " _nY	;
;	;BitBlt(Hss_Frame,0,0,MagSize*2,MagSize*2,vp_Frame,0,0,srccopy )
;	DllCall("UpdateLayeredWindow","UInt",MainhWnd,"UInt",0,"UInt",0,"Int64P",ViewX|Viewy<<32
;	,	"UInt",vp_Frame,"Int64P",0,"UInt",0,"IntP",0xff<<16|1<<24,"UInt",2) ;msgbox % _nx " " _nY	;
;	BitBlt(Hss_Frame,0,0,MagSize,MagSize,mdc,0,0,srcand^notsrccopy) ;srcand^mergecopy
;	;BitBlt(HDC_Frame,0,0,MagSize,MagSize,vp_Frame,0,0,srccopy ) srcand^mergepaInt
;	; WinMove(sswnd,_x_,_y_,"","","" ) ; SWP_NOZORDER + SWP_NOACTIVATE
;	;WinMove(vphwnd,ViewPos_X,ViewPos_y,ViewX,ViewY,"" ) ; SWP_NOZORDER + SWP_NOACTIVATE

;	_x_:=round(Area_offset+(x-magoffset)) ; _y_:=round(Area_offset+(y-magoffset))
;	(_x_<0? _x_:=0),			(_y_<0? _y_:=0)	; (_y_<0.5*magsize? _x_-=30)
;	(_x_<0? ((_x_>(x-(magsize+(0.5 *magsize*0.25)))) ; ? (_x_:= abs(_x_ -30), _y_:= abs(_y_))))
;	ViewPos_X:= x-zx,			ViewPos_Y:= y-zy
;	(ViewPos_X<0? ViewPos_X=0),	(ViewPos_Y<0? ViewPos_Y=0)
 
;UIBAND Z PLACEMNT WITH AHK UiA 1.33
;+ +wa_topmost	NinjMagiD:= DllCall("CreateWindowInBand","UInt",0,"str","Autohotkey","str","title","UInt",0,"Int",0,"Int",0,"Int",200,"Int",200,"ptr",0,"ptr",0,"ptr",0,"ptr",0,"Int",ZBID_UIACCESS:= 2,"ptr")

TT_0ff() {
	tooltip,
	return,
}