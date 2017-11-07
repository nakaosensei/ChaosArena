; The CMD file.

; Two parts: 1. Command definition and  2. State entry
; (state entry is after the commands def section)
;
; 1. Command definition
; ---------------------
; Note: The commands are CASE-SENSITIVE, and so are the command names.
; The eight directions are:
;   B, DB, D, DF, F, UF, U, UB     (all CAPS)
;   corresponding to back, down-back, down, downforward, etc.
; The six buttons are:
;   a, b, c, x, y, z               (all lower case)
;   In default key config, abc are are the bottom, and xyz are on the
;   top row. For 2 button characters, we recommend you use a and b.
;   For 6 button characters, use abc for kicks and xyz for punches.
;
; Each [Command] section defines a command that you can use for
; state entry, as well as in the CNS file.
; The command section should look like:
;
;   [Command]
;   name = some_name
;   command = the_command
;   time = time (optional -- defaults to 15 if omitted)
;
; - some_name
;   A name to give that command. You'll use this name to refer to
;   that command in the state entry, as well as the CNS. It is case-
;   sensitive (QCB_a is NOT the same as Qcb_a or QCB_A).
;
; - command
;   list of buttons or directions, separated by commas.
;   Directions and buttons can be preceded by special characters:
;   slash (/) - means the key must be held down
;          egs. command = /D       ;hold the down direction
;               command = /DB, a   ;hold down-back while you press a
;   tilde (~) - to detect key releases
;          egs. command = ~a       ;release the a button
;               command = ~D, F, a ;release down, press fwd, then a
;          If you want to detect "charge moves", you can specify
;          the time the key must be held down for (in game-ticks)
;          egs. command = ~30a     ;hold a for at least 30 ticks, then release
;   dollar ($) - Direction-only: detect as 4-way
;          egs. command = $D       ;will detect if D, DB or DF is held
;               command = $B       ;will detect if B, DB or UB is held
;   plus (+) - Buttons only: simultaneous press
;          egs. command = a+b      ;press a and b at the same time
;               command = x+y+z    ;press x, y and z at the same time
;   You can combine them:
;     eg. command = ~30$D, a+b     ;hold D, DB or DF for 30 ticks, release,
;                                  ;then press a and b together
;   It's recommended that for most "motion" commads, eg. quarter-circle-fwd,
;   you start off with a "release direction". This matches the way most
;   popular fighting games implement their command detection.
;
; - time (optional)
;   Time allowed to do the command, given in game-ticks. Defaults to 15
;   if omitted
;
; If you have two or more commands with the same name, all of them will
; work. You can use it to allow multiple motions for the same move.
;
; Some common commands examples are given below.
;
; [Command] ;Quarter circle forward + x
; name = "QCF_x"
; command = ~D, DF, F, x
;
; [Command] ;Half circle back + a
; name = "HCB_a"
; command = ~F, DF, D, DB, B, a
;
; [Command] ;Two quarter circles forward + y
; name = "2QCF_y"
; command = ~D, DF, F, D, DF, F, y
;
; [Command] ;Tap b rapidly
; name = "5b"
; command = b, b, b, b, b
; time = 30
;
; [Command] ;Charge back, then forward + z
; name = "charge_B_F_z"
; command = ~60$B, F, z
; time = 10
;
; [Command] ;Charge down, then up + c
; name = "charge_D_U_c"
; command = ~60$D, U, c
; time = 10
;

;-| Button Remapping |-----------------------------------------------------
; This section lets you remap the player's buttons (to easily change the
; button configuration). The format is:
;   old_button = new_button
; If new_button is left blank, the button cannot be pressed.
[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s

;-| Default Values |-------------------------------------------------------
[Defaults]
; Default value for the "time" parameter of a Command. Minimum 1.
command.time = 30

; Default value for the "buffer.time" parameter of a Command. Minimum 1,
; maximum 30.
command.buffer.time = 1

;-| Super Motions |--------------------------------------------------------

[command]
name = "Devil Trigger"
command = ~D, D, F, a+x
time = 15

[command]
name = "Devil Trigger"
command = ~D, D, B, a+x
time = 15

[command]
name = "Super Combo Finisher"
command = ~D, D, F, c
time = 15

[command]
name = "Dante/Vergil Jackpot"
command = ~D, D, B, c
time = 15

;-| Special Motions |------------------------------------------------------

[command]
name = "D-Trigger Lightning"
command = D,F,a
time = 10

[command]
name = "Air Gun Shot Twist"
command = D,F,a
time = 10

[command]
name = "Stand Still"
command = D,F,b
time = 10

[command]
name = "Air Gun Shot Twist"
command = D,F,b
time = 10

[command]
name = "Nevan Guitar"
command = D,F,c
time = 10

[command]
name = "D-Trigger Slash Barrage"
command = D,F,x
time = 10

[command]
name = "Rush Sword"
command = D,F,x
time = 10

[command]
name = "Sword Spin"
command = D,F,z
time = 10

[command]
name = "D-Trigger Slash Barrage"
command = D,B,c
time = 10

[command]
name = "Red Sword Slash"
command = D,B,a
time = 10

[command]
name = "Air Shot Gun"
command = D,B,a
time = 10

[command]
name = "D-Trigger Nevan Lightning Barrage"
command = D,B,a
time = 10

[command]
name = "Air Shot Gun Barrage"
command = D,B,b
time = 10

[command]
name = "Shot Gun Barrage"
command = D,B,b
time = 10

[command]
name = "D-Trigger Nevan Lightning Barrage"
command = D,B,b
time = 10

[command]
name = "Doppelganger"
command = D,B,c
time = 10

[command]
name = "Vergil Support"
command = D,B,x
time = 10

[command]
name = "Sword Throw"
command = D,B,z
time = 10

[command]
name = "Devil Trigger Off1"
command = D,F,a+x
time = 10

[command]
name = "Devil Trigger Off2"
command = D,B,a+x
time = 10

;-| Tripple Tap |-----------------------------------------------------------

[command]
name = "Shot Gun"
command = B,F,b
time = 10

[command]
name = "Rocket Launcher"
command = B,F,x
time = 10

;-| Double Tap |-----------------------------------------------------------

[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10

[Command]
name = "UU"     ;Required (do not remove)
command = U, U
time = 10

[Command]
name = "DD"     ;Required (do not remove)
command = D, D
time = 10

[Command]
name = "FD"     ;Required (do not remove)
command = F, D
time = 14

[Command]
name = "FU"     ;Required (do not remove)
command = F, U
time = 14

[Command]
name = "BD"     ;Required (do not remove)
command = B, D
time = 14

[Command]
name = "BU"     ;Required (do not remove)
command = B, U
time = 14

;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "recovery" ;Required (do not remove)
command = x+y
time = 1

[Command]
name = "recovery"
command = y+z
time = 1

[Command]
name = "recovery"
command = x+z
time = 1

[Command]
name = "recovery"
command = a+b
time = 10

[Command]
name = "recovery"
command = b+c
time = 1

[Command]
name = "recovery"
command = a+c
time = 1

[Command]
name = "Super Jump"
command = a+b+c
time = 1

;-| Dir + Button |---------------------------------------------------------
[Command]
name = "back_x"
command = /$B,x
time = 1

[Command]
name = "back_y"
command = /$B,y
time = 1

[Command]
name = "back_z"
command = /$B,z
time = 1

[Command]
name = "down_x"
command = /$D,x
time = 1

[Command]
name = "down_y"
command = /$D,y
time = 1

[Command]
name = "down_z"
command = /$D,z
time = 1

[Command]
name = "fwd_x"
command = /$F,x
time = 1

[Command]
name = "fwd_y"
command = /$F,y
time = 1

[Command]
name = "fwd_z"
command = /$F,z
time = 1

[Command]
name = "up_x"
command = /$U,x
time = 1

[Command]
name = "up_y"
command = /$U,y
time = 1

[Command]
name = "up_z"
command = /$U,z
time = 1

[Command]
name = "back_a"
command = /$B,a
time = 1

[Command]
name = "back_b"
command = /$B,b
time = 1

[Command]
name = "back_c"
command = /$B,c
time = 1

[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

[Command]
name = "down_c"
command = /$D,c
time = 1

[Command]
name = "fwd_a"
command = /$F,a
time = 1

[Command]
name = "fwd_b"
command = /$F,b
time = 1

[Command]
name = "fwd_c"
command = /$F,c
time = 1

[Command]
name = "up_a"
command = /$U,a
time = 1

[Command]
name = "up_b"
command = /$U,b
time = 1

[Command]
name = "up_c"
command = /$U,c
time = 1

;-| Single Button |---------------------------------------------------------
[Command]
name = "a"
command = a
time = 1

[Command]
name = "b"
command = b
time = 1

[Command]
name = "c"
command = c
time = 1

[Command]
name = "x"
command = x
time = 1

[Command]
name = "y"
command = y
time = 1

[Command]
name = "z"
command = z
time = 1

[Command]
name = "s"
command = s
time = 1

;-| Single Dir |------------------------------------------------------------
[Command]
name = "fwd" ;Required (do not remove)
command = $F
time = 1

[Command]
name = "downfwd"
command = $DF
time = 1

[Command]
name = "down" ;Required (do not remove)
command = $D
time = 1

[Command]
name = "downback"
command = $DB
time = 1

[Command]
name = "back" ;Required (do not remove)
command = $B
time = 1

[Command]
name = "upback"
command = $UB
time = 1

[Command]
name = "up" ;Required (do not remove)
command = $U
time = 1

[Command]
name = "upfwd"
command = $UF
time = 1

;-| Hold Button |--------------------------------------------------------------
[Command]
name = "hold_x"
command = /x
time = 1

[Command]
name = "hold_y"
command = /y
time = 1

[Command]
name = "hold_z"
command = /z
time = 1

[Command]
name = "hold_a"
command = /a
time = 1

[Command]
name = "hold_b"
command = /b
time = 1

[Command]
name = "hold_c"
command = /c
time = 1

[Command]
name = "hold_s"
command = /s
time = 1

[Command]
name = "holdup1" ;Required (do not remove)
command = /$U
time = 1

;-| Hold Dir |--------------------------------------------------------------
[Command]
name = "holdfwd" ;Required (do not remove)
command = /$F
time = 1

[Command]
name = "holddownfwd"
command = /$DF
time = 1

[Command]
name = "holddown" ;Required (do not remove)
command = /$D
time = 1

[Command]
name = "holddownback"
command = /$DB
time = 1

[Command]
name = "holdback" ;Required (do not remove)
command = /$B
time = 1

[Command]
name = "holdupback"
command = /$UB
time = 1

[Command]
name = "holdup" ;Required (do not remove)
command = /$U
time = 1

[Command]
name = "holdupfwd"
command = /$UF
time = 1

;---------------------------------------------------------------------------
; 2. State entry
; --------------
; This is where you define what commands bring you to what states.
;
; Each state entry block looks like:
;   [State -1, Label]           ;Change Label to any name you want to use to
;                               ;identify the state with.
;   type = ChangeState          ;Don't change this
;   value = new_state_number
;   trigger1 = command = command_name
;   . . .  (any additional triggers)
;
; - new_state_number is the number of the state to change to
; - command_name is the name of the command (from the section above)
; - Useful triggers to know:
;   - statetype
;       S, C or A : current state-type of player (stand, crouch, air)
;   - ctrl
;       0 or 1 : 1 if player has control. Unless "interrupting" another
;                move, you'll want ctrl = 1
;   - stateno
;       number of state player is in - useful for "move interrupts"
;   - movecontact
;       0 or 1 : 1 if player's last attack touched the opponent
;                useful for "move interrupts"
;
; Note: The order of state entry is important.
;   State entry with a certain command must come before another state
;   entry with a command that is the subset of the first.
;   For example, command "fwd_a" must be listed before "a", and
;   "fwd_ab" should come before both of the others.
;
; For reference on triggers, see CNS documentation.
;
; Just for your information (skip if you're not interested):
; This part is an extension of the CNS. "State -1" is a special state
; that is executed once every game-tick, regardless of what other state
; you are in.


; Don't remove the following line. It's required by the CMD standard.
[Statedef -1]

;-| Super Motions |--------------------------------------------------------

[State -1, Devil Trigger]
type = ChangeState
value = 900
Triggerall = var(36) >= 301
triggerall = !NumHelper(745)
TRIGGERALL = POWER >= 1000
triggerall = command = "Devil Trigger"
trigger1 = (statetype = S) && ctrl

[State -1, Super Combo Finisher]
type = ChangeState
value = 762
triggerall = !NumHelper(745)
TRIGGERALL = POWER >= 1500
triggerall = command = "Super Combo Finisher"
trigger1 = (statetype = S) && ctrl

[State -1, Dante/Vergil Jackpot]
type = ChangeState
value = 780
triggerall = var(38) = 0
triggerall = numhelper(801) = 0;Vergil Enter
triggerall = numhelper(799) = 0;Dante/Vergil Jackpot
triggerall = !NumHelper(745)
TRIGGERALL = POWER >= 3000
triggerall = command = "Dante/Vergil Jackpot"
trigger1 = (statetype = S) && ctrl

;-| Special Motions |------------------------------------------------------

[State -1, Nevan Guitar]
type = ChangeState
value = 757
triggerall = !NumHelper(745)
TRIGGERALL = POWER >= 1000
triggerall = command = "Nevan Guitar"
trigger1 = (statetype = S) && ctrl

[State -1, Doppelganger On]
type = ChangeState
value = 744
triggerall = !NumHelper(745)
TRIGGERALL = POWER >= 1000
triggerall = command = "Doppelganger"
trigger1 = (statetype = S) && ctrl

[State -1, Doppelganger Off]
type = ChangeState
value = 748
triggerall = NumHelper(745)
triggerall = command = "Doppelganger"
trigger1 = (statetype = S) && ctrl

[State -1, Stand Still On]
type = ChangeState
value = 711
triggerall = var(38) = 0
TRIGGERALL = POWER >= 1000
triggerall = command = "Stand Still"
trigger1 = (statetype = S) && ctrl

[State -1, Stand Still Off]
type = ChangeState
value = 713
triggerall = (var(38) > 0)
triggerall = command = "Stand Still"
trigger1 = (statetype = S) && ctrl

[State -1, Shot Gun Barrage]
type = ChangeState
value = 728
triggerall = !NumHelper(745)
Triggerall = var(5) >= 500
triggerall = command = "Shot Gun Barrage"
trigger1 = (statetype = S) && ctrl

[State -1, Red Sword Slash]
type = ChangeState
value = 730
triggerall = !NumHelper(745)
triggerall = !NumHelper(733)
TRIGGERALL = POWER >= 1000
triggerall = command = "Red Sword Slash"
trigger1 = (statetype = S) && ctrl

[State -1, D-Trigger Lightning]
type = ChangeState
value = 754
TRIGGERALL = POWER >= 1000
triggerall = command = "D-Trigger Lightning"
trigger1 = (statetype = S) && ctrl

[State -1, Rush Sword]
type = ChangeState
value = 725
triggerall = command = "Rush Sword"
trigger1 = (statetype = S) && ctrl

[State -1, Vergil Support]
type = ChangeState
value = 800
triggerall = numhelper(801) = 0;Vergil Enter
triggerall = numhelper(799) = 0;Dante/Vergil Jackpot
triggerall = power >= 700
triggerall = command = "Vergil Support"
trigger1 = (statetype != C) && ctrl

[State -1, Sword Spin]
type = ChangeState
value = 734
triggerall = !NumHelper(745)
triggerall = command = "Sword Spin"
trigger1 = (statetype = S) && ctrl

[State -1, Sword Throw]
type = ChangeState
value = 737
triggerall = !NumHelper(745)
triggerall = command = "Sword Throw"
trigger1 = (statetype = S) && ctrl

[State -1, Air Shot Gun Barrage]
type = ChangeState
value = 729
triggerall = !NumHelper(745)
Triggerall = var(5) >= 600
triggerall = command = "Air Shot Gun Barrage"
trigger1 = (statetype = A) && ctrl

[State -1, Air Gun Shot Twist]
type = ChangeState
value = 718
triggerall = !NumHelper(745)
Triggerall = var(5) >= 400
triggerall = command = "Air Gun Shot Twist"
trigger1 = (statetype = A) && ctrl

[State -1, Air Shot Gun]
type = ChangeState
value = 715
triggerall = !NumHelper(745)
Triggerall = var(5) >= 400
triggerall = command = "Air Shot Gun"
trigger1 = (statetype = A) && ctrl

;-| Tripple Tap |-----------------------------------------------------------

[State -1, Shot Gun]
type = ChangeState
value = 700
triggerall = !NumHelper(745)
Triggerall = var(5) >= 500
triggerall = command = "Shot Gun"
trigger1 = (statetype = S) && ctrl

[State -1, Rocket Launcher]
type = ChangeState
value = 708
triggerall = !NumHelper(745)
Triggerall = var(5) >= 800
triggerall = command = "Rocket Launcher"
trigger1 = (statetype = S) && ctrl

;===========================================================================
[State -1
;===========================================================================

;--------------------------Movelist Mode Triggers--------------------------;

;===========================================================================
;Movelist
[State -1, Movelist]
type = ChangeState
value = 1999
triggerall = Var(55) = 0
triggerALL =  command = "c" && command = "y" && command = "s"
triggerall = command = "holddown"
trigger1 = (statetype = C) && ctrl

;===========================================================================
[State -1
;===========================================================================

;----------------------------Basic Mode Triggers---------------------------;

;===========================================================================
;---------------------------------------------------------------------------
; Taunt
[State -1, Taunt]
type = ChangeState
value = 196
triggerall = var(37) = 0
triggerall = command = "s"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
;---------------------------------------------------------------------------
[State -1, Teleport]
type = ChangeState
value = 500
triggerall = numhelper(501) = 0;Dummy helper
triggerall = power >= 200
triggerall = command = "z"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;Dash Fwd
[State -1, Dash Fwd]
type = ChangeState
value = 100
triggerall = !(stateno = 100 || stateno = 105)
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl

;Dash Back
[State -1, Dash Back]
type = ChangeState
value = 105
triggerall = !(stateno = 100 || stateno = 105)
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
; Air Dash_Fwd
[State -1, Air Dash Fwd]
type = ChangeState
value = 102
triggerall = !(stateno = 102 || stateno = 103)
trigger1 = (command = "FF") && statetype = A && ctrl

; Air Dash_Back
[State -1, Air Dash Bwd]
type = ChangeState
value = 103
triggerall = !(stateno = 102 || stateno = 103)
trigger1 = command = "BB" && statetype = A && ctrl

;Super Jump
[State -1, SuperJump]
type = ChangeState
value = 41
triggerall = (command = "holdup" || command = "Super Jump") && pos y = 0
trigger1 = statetype = C && ctrl = 1

;Quick Evade
[State -1, Quick Evade]
Type = ChangeState
Value = 99
triggerall = var(37) = 0
triggerall = !NumHelper(745)
triggerall = numhelper(504) = 0;Dummy helper
triggerall = !var(38)
TRIGGERALL = POWER >= 500
Triggerall = Command = "a" && Command = "b"
Triggerall = StateType = S
triggerall = p2bodydist X <= 30
triggerall = p2bodydist y = [-55,55]
trigger1 = statetype = S
trigger1 = p2movetype = A

;---------------------------------------------------------------------------
[State -1, S-Gun Shots]
type = ChangeState
value = 295
triggerall = !NumHelper(745)
Triggerall = var(5) >= 250
triggerall = command = "hold_y"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl

[State -1, S-Slash Combo Set 1]
type = ChangeState
value = 200
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl

[State -1, S-Slash Combo Set 2]
type = ChangeState
value = 230
triggerall = command = "c"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl

[State -1, S-Slash Combo Set 3]
type = ChangeState
value = 270
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl

[State -1, S-Slash/Shot Combo Set 4]
type = ChangeState
value = 281
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
[State -1, C-Blast Off Up]
type = ChangeState
value = 400
triggerall = command = "y" || command = "a"  || command = "x"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl = 1

[State -1, C-Blast Off Stand]
type = ChangeState
value = 410
triggerall = command = "c" || command = "b"  || command = "z"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl = 1

;---------------------------------------------------------------------------
[state -1, A-Gun Shots]
type = changestate
value = 690
Triggerall = var(5) >= 350
triggerall = command = "z" || command = "y"
trigger1 = statetype = A
trigger1 = ctrl = 1

[state -1, A-Slash Combo Set 1]
type = changestate
value = 600
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = ctrl = 1

[state -1, A-Slash/Shot Combo Set 2]
type = changestate
value = 630
triggerall = command = "b"
trigger1 = statetype = A
trigger1 = ctrl = 1

[state -1, A-Slash Rush]
type = changestate
value = 680
triggerall = command = "x" || command = "c"
trigger1 = statetype = A
trigger1 = ctrl = 1

;---------------------------------------------------------------------------

