#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=Icon.ico
#AutoIt3Wrapper_Outfile=Spammer_x86.exe
#AutoIt3Wrapper_Outfile_x64=Spammer_x64.exe
#AutoIt3Wrapper_Compile_Both=y
#AutoIt3Wrapper_UseX64=y
#AutoIt3Wrapper_Res_Description=Spam-Tool
#AutoIt3Wrapper_Res_Fileversion=1.0.0.0
#AutoIt3Wrapper_Res_ProductName=Spammer
#AutoIt3Wrapper_Res_ProductVersion=1.0
#AutoIt3Wrapper_Res_CompanyName=Jonas
#AutoIt3Wrapper_Res_LegalCopyright=2020, Jonas
#AutoIt3Wrapper_Res_Language=1033
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <GUIConstantsEx.au3>

$enter = 1

$delayid = 4
$delaytime = 1000

$delay1 = 100
$delay2 = 250
$delay3 = 500
$delay4 = 1000
$delay5 = 2500
$delay6 = 5000
$delay7 = 10000
$delay8 = 30000
$delay9 = 45000
$delay10 = 600000

$idFormMain = GUICreate("Spammer", 305, 225)
$idGroupMain = GUICtrlCreateGroup("Spammer", 8, 8, 289, 209)
$idButtonGo = GUICtrlCreateButton("Go", 176, 24, 107, 153)
$idRadio0Ent = GUICtrlCreateRadio("0 Enter", 24, 112, 57, 17)
$idRadio1Ent = GUICtrlCreateRadio("1 Enter", 24, 136, 57, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
$idRadio2Ent = GUICtrlCreateRadio("2 Enter", 24, 160, 57, 17)
$idGroupCont = GUICtrlCreateGroup("Content", 16, 24, 153, 73)
$idRadioCtrlV = GUICtrlCreateRadio("Ctrl+V", 32, 40, 65, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
$idRadioCustom = GUICtrlCreateRadio("", 32, 64, 17, 17)
$idInputCustomContent = GUICtrlCreateInput("Text", 56, 64, 81, 21)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$idButtonExit = GUICtrlCreateButton("Exit", 89, 112, 79, 65)
$idSliderDelay = GUICtrlCreateSlider(64, 184, 150, 29)
GUICtrlSetLimit(-1, 10, 1)
GUICtrlSetData(-1, $delayid)
$idLabelDelay = GUICtrlCreateLabel("Delay:", 24, 184, 34, 17)
$idInputDelay = GUICtrlCreateInput($delaytime & " ms", 216, 184, 65, 21)
GUICtrlSetState(-1, $GUI_DISABLE)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUISetState(@SW_SHOW)

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE, $idButtonExit
            Exit
            
        Case $idButtonGo
            GUISetState(@SW_HIDE)
            If GUICtrlRead($idRadioCtrlV) <> 4 Then
                _SendSpam($enter, "^v", $delaytime, 0)
            ElseIf GUICtrlRead($idRadioCustom) <> 4 Then
                _SendSpam($enter, GUICtrlRead($idInputCustomContent), $delaytime, 1)
            EndIf

        Case $idRadio0Ent
            $enter = 0
        Case $idRadio0Ent
            $enter = 1
        Case $idRadio2Ent
            $enter = 2

        Case $idSliderDelay
            $delayid = GUICtrlRead($idSliderDelay)
            If $delayid = 1 Then
                $delaytime = $delay1
            ElseIf $delayid = 2 Then
                $delaytime = $delay2
            ElseIf $delayid = 3 Then
                $delaytime = $delay3
            ElseIf $delayid = 4 Then
                $delaytime = $delay4
            ElseIf $delayid = 5 Then
                $delaytime = $delay5
            ElseIf $delayid = 6 Then
                $delaytime = $delay6
            ElseIf $delayid = 7 Then
                $delaytime = $delay7
            ElseIf $delayid = 8 Then
                $delaytime = $delay8
            ElseIf $delayid = 9 Then
                $delaytime = $delay9
            ElseIf $delayid = 10 Then
                $delaytime = $delay10
            EndIf
            GUICtrlSetData($idInputDelay, $delaytime & " ms")

	EndSwitch
WEnd

Func _SendSpam($enter, $content, $delay, $raw)
    Sleep(5000)
    While 1
        Send($content, $raw)
        If $enter = 1 Then
            Sleep(30)
            Send("{ENTER}")
        ElseIf $enter = 2 Then
            Sleep(30)
            Send("{ENTER}")
            Sleep(30)
            Send("{ENTER}")
        EndIf
        Sleep($delay)
    WEnd
EndFunc