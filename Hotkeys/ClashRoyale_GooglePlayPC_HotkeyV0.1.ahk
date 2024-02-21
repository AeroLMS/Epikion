; Clash Royale hotkeys for Google Play Games Beta in PC

/*
What the code can assist with
- Instantly pick a card while mouse cursor is away by pressing [1], [2], [3], [4] 
- Instantly trigger the champion ability when [5] is pressed
- For the script to work properly even if the game window changes in size and position within your monitor
*/

#Persistent
SetTimer, ClashRoyaleWindowSize, 100
SetTimer, CheckHotkey, 100
CoordMode, Mouse, Window
Global X, Y, Width, Height
HotkeyChanged := false
LastHotkey := ""


; Hotkey Guide appears when script is executed
MsgBox, Hotkeys for Clash Royale PC:`n`n1 - First card`n2 - Second card`n3 - Third card`n4 - Fourth card`n5 - Champion Ability`nEsc - Hotkey Guide`nCtrl + Alt + 0 - Disable Hotkeys  

ClashRoyaleWindowSize:
    ; Get the current size of the Clash Royale window
    WinGetPos, X, Y, Width, Height, ahk_exe crosvm.exe
return

#IfWinActive, ahk_exe crosvm.exe

; Press 1 to Pick Card #1
1::
    LastHotkey := "1"
    HotkeyChanged := true

    Nx1 := 0.31088082901
    Ny1 := 0.86538461538
    Xs1 := Nx1 * Width
    Ys1 := Ny1 * Height

    ControlClick, x%Xs1% y%Ys1%, ahk_exe crosvm.exe
return

; Press 2 to Pick Card #2
2::
    LastHotkey := "2"
    HotkeyChanged := true

    Nx2 := 0.49222797927
    Ny2 := 0.86538461538
    Xs2 := Nx2 * Width
    Ys2 := Ny2 * Height

    ControlClick, x%Xs2% y%Ys2%, ahk_exe crosvm.exe
return
    
; Press 3 to Pick Card #3
3::
    LastHotkey := "3"
    HotkeyChanged := true

    Nx3 := 0.67357512953
    Ny3 := 0.86538461538
    Xs3 := Nx3 * Width
    Ys3 := Ny3 * Height

    ControlClick, x%Xs3% y%Ys3%, ahk_exe crosvm.exe
return

; Press 4 to Pick Card #4
4::
    LastHotkey := "4"
    HotkeyChanged := true

    Nx4 := 0.85492227979
    Ny4 := 0.86538461538
    Xs4 := Nx4 * Width
    Ys4 := Ny4 * Height

    ControlClick, x%Xs4% y%Ys4%, ahk_exe crosvm.exe
return

; Press 5 to Activate Champion Ability when Available
5::
    LastHotkey := "5"
    HotkeyChanged := true

    Nx5 := 0.86355785837
    Ny5 := 0.7548076923
    Xs5 := Nx5 * Width
    Ys5 := Ny5 * Height

    ControlClick, x%Xs5% y%Ys5%, ahk_exe crosvm.exe
return

CheckHotkey:
    if (HotkeyChanged) 
    {
        if (LastHotkey = "1")
        {
            HotkeyChanged := false
            ToolTip, Card #1, %Xs1%, %Ys1%, , 2000
            SetTimer, RemoveToolTip, 2000
        }
        
        else if (LastHotkey = "2")
        {
            HotkeyChanged := false
            ToolTip, Card #2, %Xs2%, %Ys2%, , 2000
            SetTimer, RemoveToolTip, 2000
        }

        else if (LastHotkey = "3")
        {
            HotkeyChanged := false
            ToolTip, Card #3, %Xs3%, %Ys3%, , 2000
            SetTimer, RemoveToolTip, 2000
        }

        else if (LastHotkey = "4")
        {
            HotkeyChanged := false
            ToolTip, Card #4, %Xs4%, %Ys4%, , 2000
            SetTimer, RemoveToolTip, 2000
        }

        else if (LastHotkey = "5")
        {
            HotkeyChanged := false
            ToolTip, Champion Ability, %Xs5%, %Ys5%, , 2000
            SetTimer, RemoveToolTip, 2000
        }

        else
        {
            HotkeyChanged := false
            ToolTip
        }
    }
return

RemoveToolTip:
    ToolTip  ; Clear the tooltip when the timer is triggered
    SetTimer, RemoveToolTip, Off  ; Turn off the timer
return

#IfWinActive


; Press Esc to view the hotkey guide
Esc::
    MsgBox, Hotkeys for Clash Royale PC:`n`n1 - First card`n2 - Second card`n3 - Third card`n4 - Fourth card`n5 - Champion Ability`nEsc - Hotkey Guide`nCtrl + Alt + 0 - Disable Hotkeys 
return

; Press Ctrl + Alt + 0 to close the script 
^!0::
    MsgBox, Hotkeys have been disabled.
    ExitApp
return


/*
~ Normalize coordinates to adapt based on window size

Variables:
x|y = coordinates of x or y
W|H = width or height of window
N = normalized value
i = initial
s = scaled

Formulas: 
(Nx|Ny) = (x|y) / (Wi|Hi)
(Xs|Ys) = (Nx|Ny) * (Ws|Hs)
*/

