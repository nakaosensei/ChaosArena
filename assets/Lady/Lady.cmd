; The CMD file.
;
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
name = "Hysteric"
command = D,D,a
time = 30

[command]
name = "Shredder Shot"
command = D,D,z
time = 30

[command]
name = "Napalm Shot"
command = D,D,x
time = 30

[command]
name = "Breakthrough"
command = D,D,y
time = 30

;-| Special Motions |------------------------------------------------------
[command]
name = "Rush Hour"
command = D,F,z
time = 30

[command]
name = "Ground Zero"
command = D,B,z
time = 30

[command]
name = "Horizontal Shot"
command = D,F,x
time = 30

[command]
name = "Two Hand"
command = D,B,x
time = 30

[command]
name = "Wire Shot"
command = D,F,a
time = 30

[command]
name = "Scatter"
command = D,B,a
time = 30

[command]
name = "Bullet Spree"
command = D,F,y
time = 30

[command]
name = "Avoiding Bullets"
command = D,B,y
time = 30

;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10

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
time = 1

[Command]
name = "recovery"
command = b+c
time = 1

[Command]
name = "recovery"
command = a+c
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
time = 1 *

;-| AI |--------------------------------------------------------------
[Command]
name = "CPU1"
command = U, D, F, U, D, F, c+s
time = 0

[Command]
name = "CPU2"
command = U, B, F, U, D, F, z+s
time = 0

[Command]
name = "CPU3"
command = U, D, D, U, D, F, c+s
time = 0

[Command]
name = "CPU4"
command = U, F, U, B, U, D, F, z+s
time = 0

[Command]
name = "CPU5"
command = B, B, B, U, B, U, D, F, c+s
time = 0

[Command]
name = "CPU6"
command = U, D, B, U, B, U, D, F, z+s
time = 0

[Command]
name = "CPU7"
command = F, F, B, U, B, U, D, F, c+s
time = 0

[Command]
name = "CPU8"
command = U, D, U, U, B, U, D, F, z+s
time = 0

[Command]
name = "CPU9"
command = F, B, B, U, B, U, D, F, c+s
time = 0

[Command]
name = "CPU10"
command = F, F, B, B, U, B, U, D, F, z+s
time = 0

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

;===========================================================================
;---------------------------------------------------------------------------
; Activate AI
[State -1, Activate AI]
type = Varset
triggerall = AILevel > 2
triggerall = var(59) != 1
trigger1 = command = "CPU1"
trigger2 = command = "CPU2"
trigger3 = command = "CPU3"
trigger4 = command = "CPU4"
trigger5 = command = "CPU5"
trigger6 = command = "CPU6"
trigger7 = command = "CPU7"
trigger8 = command = "CPU8"
trigger9 = command = "CPU9"
trigger10 = command = "CPU10"
v = 59
value = 1

;---------------------------------------------------------------------------
; AI
[State -1, AI] ;SLB
type = ChangeState
value = 200
triggerall = roundstate = 2
triggerall = var(59) = 1
triggerall = statetype != A
triggerall = random < 200
trigger1 = p2statetype != L
trigger1 = p2bodydist x = [0,60]
trigger1 = p2statetype != A
trigger1 = ctrl = 1
trigger2 = stateno = 380 && movecontact

[State -1, AI] ;SMB
type = ChangeState
value = 240
triggerall = roundstate = 2
triggerall = var(59) = 1
triggerall = statetype != A
triggerall = random < 200
trigger1 = p2statetype != L
trigger1 = p2bodydist x = [-10,60]
trigger1 = p2statetype != A
trigger1 = ctrl = 1
trigger2 = stateno = 380 && movecontact

[State -1, AI] ;CLP
type = ChangeState
value = 400
triggerall = roundstate = 2
triggerall = var(59) = 1
triggerall = statetype != A
triggerall = random < 200
trigger1 = p2statetype != L
trigger1 = p2bodydist x = [10,50]
trigger1 = p2statetype != A
trigger1 = ctrl = 1
trigger2 = stateno = 380 && movecontact

[State -1, AI] ;CMP
type = ChangeState
value = 410
triggerall = roundstate = 2
triggerall = var(59) = 1
triggerall = statetype != A
triggerall = random < 200
trigger1 = p2statetype != L
trigger1 = p2bodydist x = [10,50]
trigger1 = p2statetype != A
trigger1 = ctrl = 1
trigger2 = stateno = 380 && movecontact

[State -1, AI] ;CLK
type = ChangeState
value = 430
triggerall = roundstate = 2
triggerall = var(59) = 1
triggerall = statetype != A
triggerall = random < 200
trigger1 = p2statetype != L
trigger1 = p2bodydist x = [10,50]
trigger1 = p2statetype != A
trigger1 = ctrl = 1
trigger2 = stateno = 380 && movecontact

[State -1, AI] ;SSB
type = ChangeState
value = 230
triggerall = roundstate = 2
triggerall = var(59) = 1
triggerall = statetype != A
triggerall = p2bodydist x < 65
triggerall = random < 200
triggerall = p2statetype != L
trigger1 = stateno = 200 && movecontact
trigger2 = stateno = 240 && movecontact
trigger3 = stateno = 400 && movecontact
trigger4 = stateno = 410 && movecontact
trigger5 = stateno = 430 && movecontact

[State -1, AI] ;Horizontal Shot
type = ChangeState
value = 370
triggerall = roundstate = 2
triggerall = var(59) = 1
triggerall = statetype != A
triggerall = random < 300
trigger1 = p2statetype != L
trigger1 = p2bodydist x = [10,25]
trigger1 = p2statetype = A
trigger1 = ctrl = 1

[State -1, AI] ;Two Hand
type = ChangeState
value = 375
triggerall = roundstate = 2
triggerall = var(59) = 1
triggerall = statetype != A
triggerall = p2bodydist x < 70
triggerall = random < 200
triggerall = p2statetype != L
trigger1 = stateno = 230 && movecontact
trigger2 = stateno = 390 && movecontact

[State -1, AI] ;Rush Hour
type = ChangeState
value = 380
triggerall = roundstate = 2
triggerall = var(59) = 1
triggerall = statetype != A
triggerall = random < 300
trigger1 = p2statetype != L
trigger1 = p2bodydist x = [60,80]
trigger1 = p2statetype != A
trigger1 = ctrl = 1

[State -1, AI] ;Ground Zero
type = ChangeState
value = 385
triggerall = roundstate = 2
triggerall = var(59) = 1
triggerall = statetype != A
triggerall = p2bodydist x < 70
triggerall = random < 250
triggerall = p2statetype != L
trigger1 = stateno = 230 && movecontact
trigger2 = stateno = 380 && movecontact

[State -1, AI] ;Wire Shot
type = ChangeState
value = 390
triggerall = roundstate = 2
triggerall = var(59) = 1
triggerall = statetype != A
triggerall = random < 200
trigger1 = p2statetype != L
trigger1 = p2bodydist x = [10,70]
trigger1 = p2statetype != A
trigger1 = ctrl = 1

[State -1, AI] ;Avoiding Bullets
type = ChangeState
value = 360
triggerall = roundstate = 2
triggerall = var(59) = 1
triggerall = statetype != A
triggerall = p2bodydist x < 70
triggerall = random < 200
triggerall = p2statetype != L
trigger1 = stateno = 230 && movecontact
trigger2 = stateno = 390 && movecontact
trigger3 = stateno = 380 && movecontact
trigger4 = stateno = 385 && movecontact

[State -1, AI] ;Bullet Spree
type = ChangeState
value = 365
triggerall = roundstate = 2
triggerall = var(59) = 1
triggerall = statetype != A
triggerall = random < 50
trigger1 = p2statetype != L
trigger1 = p2bodydist x > 80
trigger1 = p2statetype != A
trigger1 = ctrl = 1

[State -1, AI] ;SL Missile
type = ChangeState
value = 250
triggerall = roundstate = 2
triggerall = var(59) = 1
triggerall = statetype != A
triggerall = random < 50
trigger1 = p2statetype != L
trigger1 = p2bodydist x > 80
trigger1 = p2statetype != A
trigger1 = ctrl = 1

[State -1, AI] ;SM Deflagration
type = ChangeState
value = 210
triggerall = power >= 1000
triggerall = roundstate = 2
triggerall = var(59) = 1
triggerall = statetype != A
triggerall = random < 25
trigger1 = p2statetype != L
trigger1 = p2bodydist x > 50
trigger1 = p2statetype != A
trigger1 = ctrl = 1

[State -1, AI] ;Dash
type = ChangeState
value = 350
triggerall = roundstate = 2
triggerall = var(59) = 1
triggerall = statetype != A
triggerall = random < 400
trigger1 = p2bodydist x > 75
trigger1 = ctrl = 1

[State -1, AI] ;Run Fwd
type = ChangeState
value = 100
triggerall = roundstate = 2
triggerall = var(59) = 1
triggerall = statetype != A
triggerall = random < 500
trigger1 = p2bodydist x > 60
trigger1 = ctrl = 1

[State -1, AI] ;Throw
type = ChangeState
value = 800
triggerall = roundstate = 2
triggerall = var(59) = 1
triggerall = statetype != A
triggerall = random < 100
trigger1 = p2statetype != L
trigger1 = p2bodydist x = [0,20]
trigger1 = p2statetype != A
trigger1 = ctrl = 1

[State -1, AI] ;Scatter
type = ChangeState
value = 395
triggerall = roundstate = 2
triggerall = var(59) = 1
triggerall = statetype != A
triggerall = random < 200
trigger1 = p2statetype != L
trigger1 = p2bodydist x = [100,150]
trigger1 = ctrl = 1

[State -1, AI] ;Back Dash
type = ChangeState
value = 355
triggerall = roundstate = 2
triggerall = var(59) = 1
triggerall = statetype != A
triggerall = random < 25
trigger1 = p2statetype != L
trigger1 = p2bodydist x = [0,30]
trigger1 = p2statetype != A
trigger1 = ctrl = 1

[State -1, AI] ;Hysteric
type = ChangeState
value = 6000
triggerall = power >= 1000
triggerall = roundstate = 2
triggerall = var(59) = 1
triggerall = statetype != A
triggerall = random < 100
trigger1 = p2statetype != L
trigger1 = p2bodydist x > 25
trigger1 = p2statetype != A
trigger1 = ctrl = 1

[State -1, AI] ;Breakthrough
type = ChangeState
value = 6500
triggerall = power >= 1000
triggerall = roundstate = 2
triggerall = var(59) = 1
triggerall = statetype != A
triggerall = random < 101
trigger1 = p2statetype != L
trigger1 = p2bodydist x > 70
trigger1 = p2statetype != A
trigger1 = ctrl = 1

[State -1, AI] ;Napalm Shot
type = ChangeState
value = 950
triggerall = power >= 1000
triggerall = roundstate = 2
triggerall = var(59) = 1
triggerall = statetype != A
triggerall = random < 102
trigger1 = p2statetype != L
trigger1 = p2bodydist x > 25
trigger1 = p2statetype != A
trigger1 = ctrl = 1

[State -1, AI] ;Shredder Shot
type = ChangeState
value = 900
triggerall = power >= 1000
triggerall = roundstate = 2
triggerall = var(59) = 1
triggerall = statetype != A
triggerall = random < 103
trigger1 = p2statetype != L
trigger1 = p2bodydist x = [25,80]
trigger1 = p2statetype != A
trigger1 = ctrl = 1

;===========================================================================
;---------------------------------------------------------------------------
; Hysteric
[State -1, Hysteric]
type = ChangeState
value = 6000
triggerall = var(59) != 1
triggerall = command = "Hysteric"
triggerall = power >= 1000
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
; Breakthrough
[State -1, Breakthrough]
type = ChangeState
value = 6500
triggerall = var(59) != 1
triggerall = command = "Breakthrough"
triggerall = power >= 1000
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
; Shredder Shot
[State -1, Shredder Shot]
type = ChangeState
value = 900
triggerall = var(59) != 1
triggerall = command = "Shredder Shot"
triggerall = power >= 1000
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
; Napalm Shot
[State -1, Napalm Shot]
type = ChangeState
value = 950
triggerall = var(59) != 1
triggerall = command = "Napalm Shot"
triggerall = power >= 1000
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;Horizontal Shot
[State -1, Horizontal Shot]
type = ChangeState
value = 370
triggerall = var(59) != 1
triggerall = command = "Horizontal Shot"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;Two Hand
[State -1, Two Hand]
type = ChangeState
value = 375
triggerall = var(59) != 1
triggerall = command = "Two Hand"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 230 && movecontact
trigger4 = stateno = 240 && movecontact
trigger5 = stateno = 400 && movecontact
trigger6 = stateno = 410 && movecontact
trigger7 = stateno = 430 && movecontact
trigger8 = stateno = 440 && movecontact
trigger9 = stateno = 380 && movecontact
trigger10 = stateno = 390 && movecontact

;---------------------------------------------------------------------------
;Avoiding Bullets
[State -1, Avoiding Bullets]
type = ChangeState
value = 360
triggerall = var(59) != 1
triggerall = command = "Avoiding Bullets"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 230 && movecontact
trigger4 = stateno = 240 && movecontact
trigger5 = stateno = 400 && movecontact
trigger6 = stateno = 410 && movecontact
trigger7 = stateno = 430 && movecontact
trigger8 = stateno = 440 && movecontact
trigger9 = stateno = 380 && movecontact
trigger10 = stateno = 390 && movecontact
trigger11 = stateno = 385 && movecontact
trigger12 = stateno = 375 && movecontact

;---------------------------------------------------------------------------
;Bullet Spree
[State -1, Bullet Spree]
type = ChangeState
value = 365
triggerall = var(59) != 1
triggerall = command = "Bullet Spree"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;Rush Hour
[State -1, Rush Hour]
type = ChangeState
value = 380
triggerall = var(59) != 1
triggerall = command = "Rush Hour"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;Ground Zero
[State -1, Ground Zero]
type = ChangeState
value = 385
triggerall = var(59) != 1
triggerall = command = "Ground Zero"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 230 && movecontact
trigger4 = stateno = 240 && movecontact
trigger5 = stateno = 380 && movecontact

;---------------------------------------------------------------------------
;Wire Shot
[State -1, Wire Shot]
type = ChangeState
value = 390
triggerall = var(59) != 1
triggerall = command = "Wire Shot"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 230 && movecontact
trigger4 = stateno = 240 && movecontact
trigger5 = stateno = 380 && movecontact

;---------------------------------------------------------------------------
;Scatter
[State -1, Scatter]
type = ChangeState
value = 395
triggerall = var(59) != 1
triggerall = command = "Scatter"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
; Throw
[State -1, Throw]
type = ChangeState
value = 800
triggerall = var(59) != 1
triggerall = command = "y"
triggerall = statetype = S
triggerall = ctrl
triggerall = stateno != 100
trigger1 = command = "holdfwd"
trigger1 = p2bodydist X < 10
trigger1 = (p2statetype = S) || (p2statetype = C)
trigger1 = p2movetype != H
trigger2 = command = "holdback"
trigger2 = p2bodydist X < 10
trigger2 = (p2statetype = S) || (p2statetype = C)
trigger2 = p2movetype != H

;---------------------------------------------------------------------------
; Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl

;----------------------------------------------------------------------------
;Run Back
[State -1, Run Back]
type = ChangeState
value = 105
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl

;===========================================================================
;---------------------------------------------------------------------------
;Taunt
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = var(59) != 1
triggerall = command = "s"
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
; Stand Light Bayonet
[State -1, Stand Light Bayonet]
type = ChangeState
value = 200
triggerall = var(59) != 1
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 230 && movecontact
trigger3 = stateno = 380 && movecontact

;---------------------------------------------------------------------------
; Stand Medium Bayonet
[State -1, Stand Medium Bayonet]
type = ChangeState
value = 240
triggerall = var(59) != 1
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 230 && movecontact
trigger4 = stateno = 380 && movecontact

;---------------------------------------------------------------------------
; Stand Strong Bayonet
[State -1, Stand Strong Bayonet]
type = ChangeState
value = 230
triggerall = var(59) != 1
triggerall = command = "z"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 240 && movecontact
trigger4 = stateno = 380 && movecontact

;---------------------------------------------------------------------------
; Stand Light (Missile)
[State -1, Stand Light (Missile)]
type = ChangeState
value = 250
triggerall = var(59) != 1
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 380 && movecontact
trigger3 = stateno = 200 && movecontact
trigger4 = stateno = 240 && movecontact
trigger5 = stateno = 230 && movecontact

;---------------------------------------------------------------------------
; Standing Medium (Deflagration)
[State -1, Standing Medium (Deflagration)]
type = ChangeState
value = 210
triggerall = var(59) != 1
triggerall = command = "b"
triggerall = command != "holddown"
triggerall = power >= 1000
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 230 && movecontact
trigger4 = stateno = 240 && movecontact
trigger5 = stateno = 380 && movecontact

;---------------------------------------------------------------------------
; Crouching Light Gun
[State -1, Crouching Light Gun]
type = ChangeState
value = 400
triggerall = var(59) != 1
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 430 && movecontact
trigger3 = stateno = 380 && movecontact

;---------------------------------------------------------------------------
; Crouching Medium Gun
[State -1, Crouching Medium Gun]
type = ChangeState
value = 410
triggerall = var(59) != 1
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 400 && movecontact
trigger3 = stateno = 430 && movecontact
trigger4 = stateno = 380 && movecontact

;---------------------------------------------------------------------------
; Crouching Strong Missile
[State -1, Crouching Strong Missile]
type = ChangeState
value = 230
triggerall = var(59) != 1
triggerall = command = "z"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 400 && movecontact
trigger3 = stateno = 410 && movecontact
trigger4 = stateno = 430 && movecontact
trigger5 = stateno = 380 && movecontact

;---------------------------------------------------------------------------
; Crouching Light Kick
[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerall = var(59) != 1
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 380 && movecontact

;---------------------------------------------------------------------------
; Crouching Deflagration
[State -1, Crouching Deflagration]
type = ChangeState
value = 210
triggerall = var(59) != 1
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 400 && movecontact
trigger3 = stateno = 410 && movecontact
trigger4 = stateno = 430 && movecontact
trigger5 = stateno = 380 && movecontact

;---------------------------------------------------------------------------
; Crouching Dash
[State -1, Crouching Dash]
type = ChangeState
value = 350
triggerall = var(59) != 1
triggerall = command = "c"
triggerall = command = "holddown"
triggerall = command != "holdback"
trigger1 = statetype = C
trigger1 = ctrl

;---------------------------------------------------------------------------
; Crouching Back Dash
[State -1, Crouching Back Dash]
type = ChangeState
value = 355
triggerall = var(59) != 1
triggerall = command = "c"
triggerall = command = "holddown"
triggerall = command = "holdback"
trigger1 = statetype = C
trigger1 = ctrl

;---------------------------------------------------------------------------
; Jump Light Punch
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = command = "x"
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
; Jump Medium Punch
[State -1, Jump Medium Punch]
type = ChangeState
value = 610
triggerall = command = "y"
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
; Jump Strong Punch
[State -1, Jump Strong Punch]
type = ChangeState
value = 620
triggerall = command = "z"
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
; Jump Bayonet
[State -1, Jump Bayonet]
type = ChangeState
value = 630
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
; Jump Deflagration
[State -1, Jump Deflagration]
type = ChangeState
value = 640
triggerall = command = "b"
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
; Air Push
[State -1, Air Push]
type = ChangeState
value = 650
triggerall = command = "c"
triggerall = command != "holdback"
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
; Air Push Back
[State -1, Air Push Back]
type = ChangeState
value = 655
triggerall = command = "c"
triggerall = command = "holdback"
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Dash
[State -1, Dash]
type = ChangeState
value = 350
triggerall = var(59) != 1
triggerall = command = "c"
triggerall = command != "holdback"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
;Back Dash
[State -1, Back Dash]
type = ChangeState
value = 355
triggerall = var(59) != 1
triggerall = command = "c"
triggerall = command = "holdback"
trigger1 = statetype = S
trigger1 = ctrl
