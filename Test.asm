
; 0x0a030a04 first colum enemies
; 0x0f0d0f0c , enemy shot
start:

    push 35   ;shot enemy2 
    push 16
    push 39   ;shot enemy1
    push 16
    push 55   ;enemy8 der 4
    push 15
    push 51   ;enemy7 der 3
    push 15
    push 27   ;enemy6 iz 3
    push 15
    push 47   ;enemy5 der 2
    push 15
    push 31   ;enemy4 iz 2
    push 15
    push 43   ;enemy3 der 1
    push 15
    push 35   ;enemy2 iz1
    push 15
    push 39   ;enemy1
    push 15
    push 39   ;shot
    push 25
    push 39   ;spaceship
    push 26
    call start
    add esp, 20
    #stop
 
; dword [ebp+ 8] => Row  ;ship
; dword [ebp+12] => Colum
; dword [ebp+ 16] => Row  ;shpt
; dword [ebp+20] => Colum
; dword [ebp+ 24] => Row ;enemy1
; dword [ebp+28] => Colum
; dword [ebp+ 32] => Row ;enemy2
; dword [ebp+36] => Colum
; dword [ebp+ 40] => Row ;enemy3
; dword [ebp+44] => Colum
start:
    ;epilogo
    push ebp
    mov ebp, esp
    ;--------------load space ship------------------------
    sub esp, 4
    mov dword [ebp-4], 0x04070406 ; Current space ship
    call offset
   mov dword[0x10000000], esi

   ; --------------- load paint shot--------------
     mov dword[0x10000016],39
   mov dword[0x10000008],0 ; turn on shot
   sub esp,4
   mov dword [ebp-8], 0x04000401  ; current shot
   call offset_shot
   mov dword[0x10000004], edi
    ; ----------------- load paint enemy1------------ ready
    mov dword[0x10000024],0  ; death flag
    sub esp,4
    mov dword [ebp-12],0x05030504
    call offset_enemy1
    #show dword[0x10000020]
    ;-----------------load paint enemy2---------------- ; ready 
    mov dword[0x10000032],0  ; death flag
    sub esp,4
    mov dword [ebp-16],0x0a030a04
    call offset_enemy2
    #show dword[0x10000028]

    ;-----------------load paint enemy3---------------- ; ready
    mov dword[0x10000046],0  ; death flag
    sub esp,4
    mov dword [ebp-20],0x0a030a04
    call offset_enemy3
     #show dword[0x10000036]


    ;-----------------load paint enemy4---------------- ; ready
    mov dword[0x10000050],0  ; death flag
    sub esp,4
    mov dword [ebp-24],0x0a030a04
    call offset_enemy4
     #show dword[0x10000054]
    
    ;-----------------load paint enemy5---------------- ; ready
    mov dword[0x10000058],0  ; death flag
    sub esp,4
    mov dword [ebp-28],0x0a030a04
    call offset_enemy5
     #show dword[0x10000062]
    

    ;-----------------load paint enemy6---------------- ; ready
    mov dword[0x10000086],0  ; death flag
    sub esp,4
    mov dword [ebp-32],0x0a030a04
    call offset_enemy6
     #show dword[0x10000066]
    

    ;-----------------load paint enemy7---------------- ; ready
    mov dword[0x10000070],0  ; death flag
    sub esp,4
    mov dword [ebp-36],0x0a030a04
    call offset_enemy7
     #show dword[0x10000074]

    ;-----------------load paint enemy8---------------- ; ready
    mov dword[0x10000078],0  ; death flag
    sub esp,4
    mov dword [ebp-40],0x0a030a04
    call offset_enemy8
     #show dword[0x10000082]


    ;-----------------load shot enemy1----------------; ready
    mov dword[0x10000102],0xb800   ; preview
    mov dword[0x10000090],180 ; shot active on time
    sub esp,4
    mov dword[ebp-44],0x0f0d0f0c
    call offset_shot_enemy1
    #show dword[0x10000094]

    ;-----------------load shot enemy2----------------; in process
    mov dword[0x10000140],0xb800   ; preview
    mov dword[0x10000106],50 ; shot active on time
    sub esp,4
    mov dword[ebp-48],0x0f0d0f0c
    call offset_shot_enemy2
    #show dword[0x10000110]



    ;-------------test paint gun----------------------------



    ;----------------print lives----------------------
    mov ebx, 0xb880
    mov dword[ebx],0x0f02
    mov ebx, 0xb884
    mov dword[ebx],0x0f02
    mov ebx, 0xb888
    mov dword[ebx],0x0f02
    mov dword[0x10000200],ebx


    ;----------------print score----------------------
    mov ebx, 0xb814
    mov dword[ebx],0x0f170f16
    mov ebx, 0xb818
    mov dword[ebx],0x0f190f18
    mov ebx, 0xb81c
    mov dword[ebx],0x0f1a






$Game_loop:
  ;-----------------paint and clear ship-----------
    mov edx, dword[0x10000000] ;  last position ship
    mov ebx, 0x0e200e20 ;char clear
    mov dword [edx], ebx ;paint clear
    mov ebx, dword [ebp-4]
    mov dword [esi], ebx    ;paint pacman
;-----------------paint and clear shot-----------
    mov edx,dword[0x10000004] ; store preview
    mov ebx, 0x0e200e20 ;  clear
    mov dword[edx],ebx
    mov ebx,dword[ebp-8]
    mov dword[edi],ebx
    call shot

;-----------------------paint enem1 shot-------------------
    inc dword[0x10000312]
    cmp dword[0x10000024],1
    je deaths1
    mov eax,dword[0x10000090]
    cmp word [0x10000312] , eax
    jle nolaunch
    call shote1
    nolaunch:
    #show dword [0x10000312] ; time 

    deaths1:
;-----------------------paint enem2 shot-------------------
    inc dword[0x10000316]
    cmp dword[0x10000032],1
    je deaths2
    mov eax,dword[0x10000106]
    cmp word [0x10000316] , eax
    jle nolaunch2
    call shot2
    nolaunch2:
    deaths2:
   

;------------------paint enemy1 death*--------------------
      
       cmp dword[0x10000024],1
       je death1
       mov eax,dword[0x10000020]
       mov ebx, dword[ebp-12]
       mov dword[eax],ebx
       death1:
    
;--------------------paint enemy2 death-----------
       cmp dword[0x10000032],1
       je death2
       mov eax,dword[0x10000028]
       mov ebx, dword[ebp-16]
       mov dword[eax],ebx
       death2:
;-------------------paint enemy3 death----------
       cmp dword[0x10000046],1
       je death3
        mov eax,dword[0x10000036]
        mov ebx, dword[ebp-20]
        mov dword[eax],ebx
       death3:

;-------------------paint enemy4 death----------
       cmp dword[0x10000050],1
       je death4
        mov eax,dword[0x10000054]
        mov ebx, dword[ebp-24]
        mov dword[eax],ebx
       death4:

;-------------------paint enemy5 death----------
       cmp dword[0x10000058],1
       je death5
      mov eax,dword[0x10000062]
      mov ebx, dword[ebp-28]
      mov dword[eax],ebx
       death5:
;-------------------paint enemy6 death----------
       cmp dword[0x10000086],1
       je death6
    mov eax,dword[0x10000066]
    mov ebx, dword[ebp-32]
    mov dword[eax],ebx
       death6:

;-------------------paint enemy7 death----------
       cmp dword[0x10000070],1
       je death7
    mov eax,dword[0x10000074]
    mov ebx, dword[ebp-36]
    mov dword[eax],ebx
       death7:

;-------------------paint enemy8 death----------
       cmp dword[0x10000078],1
       je death8
    mov eax,dword[0x10000082]
    mov ebx, dword[ebp-40]
    mov dword[eax],ebx
       death8:


    push 50
    call delay
    add esp, 4
   
$test_keys:
    mov ah, byte [0xffff0004] ; Keypad
    mov al, ah
   
    ; Left key
    and al, 0x1
    test al, al
    jz $test_right
    mov dword[0x10000000], esi  ; save last position
    mov eax, dword [ebp+12]  ; ship
    mov ecx, dword [ebp+20]  ; shot ; use 12 to be in the current pos
    cmp eax, 16
    je here
    cmp dword[0x10000008],1
    je npshot
    mov dword[0x10000004], edi  ; save last position shot
    dec ecx
    npshot:
    dec eax
    mov dword[0x10000016],eax
    here:

    mov dword [ebp+12], eax ; pass position
    call offset
    mov dword [ebp+20], ecx ; pass position
    call offset_shot

    jmp $Game_loop
       
$test_right:
    mov al, ah
    and al, 0x2
    test al, al
    jz $test_down
    
    mov dword[0x10000000], esi
    mov eax, dword [ebp+12] 
    mov ecx, dword [ebp+20] 
    #show eax
    cmp eax, 64
    je here1
    cmp dword[0x10000008],1
    je npshot1
    mov dword[0x10000004], edi
    inc ecx
    npshot1:
    inc eax
    mov dword[0x10000016],eax
    here1:
    mov dword [ebp+12], eax 
    call offset
    mov dword [ebp+20], ecx 
    call offset_shot
    

    jmp $Game_loop
 
$test_down:
    mov al, ah
    and al, 0x4
    test al, al
    jz $test_up

    mov eax, dword [ebp+8] 
     #show eax
    cmp eax, 29
    je here2
    ;inc eax
    here2:
    mov dword [ebp+8], eax 
    call offset

    jmp $Game_loop
 
$test_up:
    mov al, ah
    and al, 0x8
    test al, al
    jz $test_q
    or dword[0x10000008],1
    #show dword[0x10000008]
    jmp $Game_loop
 
$test_q:
    mov al, ah
    and al, 0x10
    test al, al
    jnz $end_loop
    jmp $Game_loop
 
$end_loop:
    #show al binary
    ret
       
delay:
    mov eax, dword [0xffff0008]
    add eax, dword [esp + 4]
$delay_loop:
    cmp dword [0xffff0008], eax
    jl $delay_loop
    ret
;---------------------------------offsets  zone------------------------------
offset:
mov esi, dword [ebp+8] ; Row
    mov ebx, esi
    shl esi, 6
    shl ebx, 4
    add esi, ebx
    add esi, dword [ebp+12] ; Col
    shl esi, 1
    add esi, 0xb800
    ret

offset_shot:
mov edi, dword [ebp+16] ; Row
    mov ebx, edi
    shl edi, 6
    shl ebx, 4
    add edi, ebx
    add edi, dword [ebp+20] ; Col
    shl edi, 1
    add edi, 0xb800
    ret

offset_enemy1:
mov eax, dword [ebp+24] ; Row
    mov ebx, eax
    shl eax, 6
    shl ebx, 4
    add eax, ebx
    add eax, dword [ebp+28] ; Col
    shl eax, 1
    add eax, 0xb800
    mov dword[0x10000020] , eax
    ret


offset_enemy2:
mov eax, dword [ebp+32] ; Row
    mov ebx, eax
    shl eax, 6
    shl ebx, 4
    add eax, ebx
    add eax, dword [ebp+36] ; Col
    shl eax, 1
    add eax, 0xb800
    mov dword[0x10000028] , eax
    ret

offset_enemy3:
mov eax, dword [ebp+40] ; Row
    mov ebx, eax
    shl eax, 6
    shl ebx, 4
    add eax, ebx
    add eax, dword [ebp+44] ; Col
    shl eax, 1
    add eax, 0xb800
    mov dword[0x10000036] , eax
    ret
offset_enemy4:
mov eax, dword [ebp+48] ; Row
    mov ebx, eax
    shl eax, 6
    shl ebx, 4
    add eax, ebx
    add eax, dword [ebp+52] ; Col
    shl eax, 1
    add eax, 0xb800
    mov dword[0x10000054] , eax
    ret

offset_enemy5:
mov eax, dword [ebp+56] ; Row
    mov ebx, eax
    shl eax, 6
    shl ebx, 4
    add eax, ebx
    add eax, dword [ebp+60] ; Col
    shl eax, 1
    add eax, 0xb800
    mov dword[0x10000062] , eax
    ret
offset_enemy6:
mov eax, dword [ebp+64] ; Row
    mov ebx, eax
    shl eax, 6
    shl ebx, 4
    add eax, ebx
    add eax, dword [ebp+68] ; Col
    shl eax, 1
    add eax, 0xb800
    mov dword[0x10000066] , eax
    ret

offset_enemy7:
mov eax, dword [ebp+72] ; Row
    mov ebx, eax
    shl eax, 6
    shl ebx, 4
    add eax, ebx
    add eax, dword [ebp+76] ; Col
    shl eax, 1
    add eax, 0xb800
    mov dword[0x10000074] , eax
    ret

offset_enemy8:
mov eax, dword [ebp+80] ; Row
    mov ebx, eax
    shl eax, 6
    shl ebx, 4
    add eax, ebx
    add eax, dword [ebp+84] ; Col
    shl eax, 1
    add eax, 0xb800
    mov dword[0x10000082] , eax
    ret

offset_shot_enemy1:
mov eax, dword [ebp+88] ; Row
    mov ebx, eax
    shl eax, 6
    shl ebx, 4
    add eax, ebx
    add eax, dword [ebp+92] ; Col
    shl eax, 1
    add eax, 0xb800
    mov dword[0x10000094] , eax
    ret

offset_shot_enemy2:
mov eax, dword [ebp+96] ; Row
    mov ebx, eax
    shl eax, 6
    shl ebx, 4
    add eax, ebx
    add eax, dword [ebp+100] ; Col
    shl eax, 1
    add eax, 0xb800
    mov dword[0x10000110] , eax
    ret

;---------------------------------------gun zone----------------------------------
shote1:
    cmp dword[0x10000098],30
    je limitshot1
    cmp dword[0x10000094],esi
    je ko1

    mov edx,dword[0x10000102] ; store preview
    #show dword[0x10000102]
    mov ebx, 0x0e200e20 ;  clear
    mov dword[edx],ebx


    mov eax,dword[0x10000094]  ;paint shot1
    mov ebx, dword[ebp-44]
    #show eax
    mov dword[eax],ebx
    mov ecx, dword [ebp+88]
    mov dword[0x10000102],eax  ; save preview pos
    #show dword[0x10000102]

    inc ecx 
    #show ecx
    mov dword[0x10000098],ecx
    mov dword[ebp+88] ,ecx
    call offset_shot_enemy1
    
    limitshot1:
    cmp dword[0x10000098],30
    jne nonrestshot1
    mov edx,dword[0x10000102] ; clean last pos shot
    #show dword[0x10000102]
    mov ebx, 0x0e200e20 ;  
    mov dword[edx],ebx

    add dword[0x10000090],280 ; time shot
    #show ["*"]

    mov dword[0x10000098],0   ; reposition limit
    mov dword[ebp+88] ,16     ; reposition shot
    call offset_shot_enemy1
    nonrestshot1:
    jmp limitdown1
    ko1:
    #show ["---"]
    mov edx,dword[0x10000102] ; clean last pos
    #show dword[0x10000102]
    mov ebx, 0x0e200e20;  
    mov dword[edx],ebx

    mov ebx,dword[0x10000200]    ;lives -1 
    mov dword[ebx],0x0e200e20
    sub dword[0x10000200],4
    

    loop1:
    cmp  dword[0x10000300],182020
    jge endexplotion1
    mov dword[esi],0x0e100e11    ; explotion
    inc dword[0x10000300]
    #show dword[0x10000300]
    jmp loop1
    endexplotion1:
    mov dword[0x10000300],0
  
    add dword[0x10000090],280 ; time shot

    mov dword[0x10000098],0   ; reposition limit
    mov dword[ebp+88] ,16     ; reposition shot
    call offset_shot_enemy1

    limitdown1:

ret

shot2:

    cmp dword[0x10000144],30
    je limitshot2
    cmp dword[0x10000110],esi
    je ko2

    mov edx,dword[0x10000140] ; store preview
    #show dword[0x10000140]
    mov ebx, 0x0e200e20 ;  clear
    mov dword[edx],ebx


    mov eax,dword[0x10000110]  ;paint shot1
    mov ebx, dword[ebp-48]
    #show eax
    mov dword[eax],ebx
    mov ecx, dword [ebp+96]
    mov dword[0x10000140],eax  ; save preview pos
    #show dword[0x10000140]

    inc ecx 
    #show ecx
    mov dword[0x10000144],ecx
    mov dword[ebp+96] ,ecx
    call offset_shot_enemy2
    
    limitshot2:
    cmp dword[0x10000144],30
    jne nonrestshot2
    mov edx,dword[0x10000140] ; clean last pos shot
    #show dword[0x10000140]
    mov ebx, 0x0e200e20 ;  
    mov dword[edx],ebx

    add dword[0x10000106],50 ; time shot
    #show ["*"]

    mov dword[0x10000144],0   ; reposition limit
    mov dword[ebp+96] ,16     ; reposition shot
    call offset_shot_enemy2
    nonrestshot2:
    jmp limitdown2
    ko2:
    #show ["---"]
    mov edx,dword[0x10000140] ; clean last pos
    #show dword[0x10000140]
    mov ebx, 0x0e200e20;  
    mov dword[edx],ebx

    mov ebx,dword[0x10000200]    ;lives -1 
    mov dword[ebx],0x0e200e20
    sub dword[0x10000200],4
    

    loop3:
    cmp  dword[0x10000304],182020
    jge endexplotion2
    mov dword[esi],0x0e100e11    ; explotion
    inc dword[0x10000304]
    #show dword[0x10000304]
    jmp loop3
    endexplotion2:
    mov dword[esi],0x0e200e20    ; clean explosion

    mov dword[0x10000304],0
    add dword[0x10000106],50 ; time shot

    mov dword[ebp+12],39   ; reposition ship
    call offset
    mov dword[ebp+16],25   ; reposition shots
    mov dword[ebp+20],39 
    call offset_shot

    mov dword[0x10000144],0   ; reposition limit
    mov dword[ebp+96] ,16     ; reposition shot
    call offset_shot_enemy2

    limitdown2:


ret

shot:
mov ecx,dword[0x10000012]
cmp dword[0x10000008],1
jl notshot
cmp ecx,1
je notshot
cmp dword[0x10000020],edi  ; kill enemy1
je kill1                   ;--
cmp dword[0x10000028],edi
je kill2
cmp dword[0x10000036],edi
je kill3
cmp dword[0x10000054],edi
je kill4
cmp dword[0x10000062],edi
je kill5
cmp dword[0x10000066],edi
je kill6
cmp dword[0x10000074],edi
je kill7
cmp dword[0x10000082],edi
je kill8
#show edi
#show dword[0x10000028]
mov dword[0x10000004], edi
#show edi
mov ecx,dword[ebp+16]
dec ecx
mov dword[0x10000012],ecx
mov dword [ebp+16], ecx 
call offset_shot
notshot:
cmp dword[0x10000012],1
jne noreset
#show[10] ascii 
#show ["*"]
#show[10] ascii 
#show edi
;mov dword[edi],0x0e200e20  ; clean last shot pos
mov dword[0x10000012],25   ; reset shot time
mov dword[0x10000008],0    ; shot off
mov ecx ,dword[0x10000016] ; ship position for shot to docking
mov dword [ebp+20],ecx
mov dword [ebp+16],25      ; pass pos
mov edx,dword[0x10000004] ; store preview
mov ebx, 0x0e200e20 ;  clear
mov dword[edx],ebx
call offset_shot
noreset:
cmp dword[0x10000020],edi
jne norestnext
cmp dword[0x10000028],edi
jne norestnext
kill1:
#show[10] ascii 
#show ["**"]
#show[10] ascii 
#show edi

mov edx,dword[0x10000102] ; clean last pos shot
#show dword[0x10000102]
mov ebx, 0x0e200e20 ;  
mov dword[edx],ebx

mov dword[0x10000024],1      ; is death
mov eax,dword[0x10000020]    ;
#show dword[0x10000020]
mov dword[eax],0x0e200e20   ;clean enemy
mov dword[edi],0x0e200e20  ; clean last shot pos
mov dword[0x10000020],0    ; enemy pos null
mov dword[0x10000012],25   ; reset shot time
mov dword[0x10000008],0    ; shot off
mov ecx ,dword[0x10000016] ; ship position for shot to docking
mov dword [ebp+20],ecx
mov dword [ebp+16],25      ; pass pos
mov edx,dword[0x10000004] ; store preview
mov ebx, 0x0e200e20 ;  clear
mov dword[edx],ebx
call offset_shot
jmp norestnext
kill2:
#show[10] ascii 
#show ["***"]
#show[10] ascii 
#show edi

mov dword[0x10000032],1      ; is death
mov eax,dword[0x10000028]    ;
#show dword[0x10000028]
mov dword[eax],0x0e200e20   ;clean enemy
mov dword[edi],0x0e200e20  ; clean last shot pos
mov dword[0x10000028],0    ; enemy pos null
mov dword[0x10000012],25   ; reset shot time
mov dword[0x10000008],0    ; shot off
mov ecx ,dword[0x10000016] ; ship position for shot to docking
mov dword [ebp+20],ecx
mov dword [ebp+16],25      ; pass pos
mov edx,dword[0x10000004] ; store preview
mov ebx, 0x0e200e20 ;  clear
mov dword[edx],ebx
call offset_shot
jmp norestnext
kill3:
#show[10] ascii 
#show ["****"]
#show[10] ascii 
#show edi

mov dword[0x10000046],1      ; is death
mov eax,dword[0x10000036]    ;
#show dword[0x10000036]
mov dword[eax],0x0e200e20   ;clean enemy
mov dword[edi],0x0e200e20  ; clean last shot pos
mov dword[0x10000036],0    ; enemy pos null
mov dword[0x10000012],25   ; reset shot time
mov dword[0x10000008],0    ; shot off
mov ecx ,dword[0x10000016] ; ship position for shot to docking
mov dword [ebp+20],ecx
mov dword [ebp+16],25      ; pass pos
mov edx,dword[0x10000004] ; store preview
mov ebx, 0x0e200e20 ;  clear
mov dword[edx],ebx
call offset_shot
jmp norestnext
kill4:
#show[10] ascii 
#show ["*****"]
#show[10] ascii 
#show edi

mov dword[0x10000050],1      ; is death
mov eax,dword[0x10000054]    ;
#show dword[0x10000054]
mov dword[eax],0x0e200e20   ;clean enemy
mov dword[edi],0x0e200e20  ; clean last shot pos
mov dword[0x10000054],0    ; enemy pos null
mov dword[0x10000012],25   ; reset shot time
mov dword[0x10000008],0    ; shot off
mov ecx ,dword[0x10000016] ; ship position for shot to docking
mov dword [ebp+20],ecx
mov dword [ebp+16],25      ; pass pos
mov edx,dword[0x10000004] ; store preview
mov ebx, 0x0e200e20 ;  clear
mov dword[edx],ebx
call offset_shot
jmp norestnext
kill5:
#show[10] ascii 
#show ["*****-"]
#show[10] ascii 
#show edi

mov dword[0x10000058],1      ; is death
mov eax,dword[0x10000062]    ;
#show dword[0x10000062]
mov dword[eax],0x0e200e20   ;clean enemy
mov dword[edi],0x0e200e20  ; clean last shot pos
mov dword[0x10000062],0    ; enemy pos null
mov dword[0x10000012],25   ; reset shot time
mov dword[0x10000008],0    ; shot off
mov ecx ,dword[0x10000016] ; ship position for shot to docking
mov dword [ebp+20],ecx
mov dword [ebp+16],25      ; pass pos
mov edx,dword[0x10000004] ; store preview
mov ebx, 0x0e200e20 ;  clear
mov dword[edx],ebx
call offset_shot
jmp norestnext
kill6:
#show[10] ascii 
#show ["-*****"]
#show[10] ascii 
#show edi

mov dword[0x10000086],1      ; is death
mov eax,dword[0x10000066]    ;
#show dword[0x10000066]
mov dword[eax],0x0e200e20   ;clean enemy
mov dword[edi],0x0e200e20  ; clean last shot pos
mov dword[0x10000066],0    ; enemy pos null
mov dword[0x10000012],25   ; reset shot time
mov dword[0x10000008],0    ; shot off
mov ecx ,dword[0x10000016] ; ship position for shot to docking
mov dword [ebp+20],ecx
mov dword [ebp+16],25      ; pass pos
mov edx,dword[0x10000004] ; store preview
mov ebx, 0x0e200e20 ;  clear
mov dword[edx],ebx
call offset_shot
jmp norestnext
kill7:
#show[10] ascii 
#show ["***-*"]
#show[10] ascii 
#show edi

mov dword[0x10000070],1      ; is death
mov eax,dword[0x10000074]    ;
#show dword[0x10000074]
mov dword[eax],0x0e200e20   ;clean enemy
mov dword[edi],0x0e200e20  ; clean last shot pos
mov dword[0x10000074],0    ; enemy pos null
mov dword[0x10000012],25   ; reset shot time
mov dword[0x10000008],0    ; shot off
mov ecx ,dword[0x10000016] ; ship position for shot to docking
mov dword [ebp+20],ecx
mov dword [ebp+16],25      ; pass pos
mov edx,dword[0x10000004] ; store preview
mov ebx, 0x0e200e20 ;  clear
mov dword[edx],ebx
call offset_shot
jmp norestnext
kill8:
#show[10] ascii 
#show ["***--"]
#show[10] ascii 
#show edi

mov dword[0x10000078],1      ; is death
mov eax,dword[0x10000082]    ;
#show dword[0x10000082]
mov dword[eax],0x0e200e20   ;clean enemy
mov dword[edi],0x0e200e20  ; clean last shot pos
mov dword[0x10000082],0    ; enemy pos null
mov dword[0x10000012],25   ; reset shot time
mov dword[0x10000008],0    ; shot off
mov ecx ,dword[0x10000016] ; ship position for shot to docking
mov dword [ebp+20],ecx
mov dword [ebp+16],25      ; pass pos
mov edx,dword[0x10000004] ; store preview
mov ebx, 0x0e200e20 ;  clear
mov dword[edx],ebx
call offset_shot

norestnext:

ret