; 0x0a030a04 first colum enemies
; 0x0f0d0f0c , enemy shot
start:
    push 55   ;enemy8 der 4
    push 16
    push 51   ;shot enemy7 der 3
    push 16
    push 27   ;shot enemy6 iz 3
    push 16
    push 47   ; shot enemy5 der 2
    push 16
    push 31   ;shot enemy4 iz 2
    push 16
    push 43   ;shot enemy3 der 1
    push 16
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
    add esp, 152
    #show ["*"]
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
    mov dword[0x10000090],10 ; shot active on time
    sub esp,4
    mov dword[ebp-44],0x0f0d0f0c
    call offset_shot_enemy1
    #show dword[0x10000094]

    ;-----------------load shot enemy2----------------; Ready
    mov dword[0x10000140],0xb800   ; preview
    mov dword[0x10000106],50 ; shot active on time
    sub esp,4
    mov dword[ebp-48],0x0f0d0f0c
    call offset_shot_enemy2
    #show dword[0x10000110]



    ;------------load shot enemy3-----------------------; Ready
    mov dword[0x10000148],0xb800   ; preview
    mov dword[0x10000118],80 ; shot active on time
    sub esp,4
    mov dword[ebp-52],0x0f0d0f0c
    call offset_shot_enemy3
    #show dword[0x10000124]

    ;------------load shot enemy4-----------------------; Ready
    mov dword[0x10000162],0xb800   ; preview
    mov dword[0x10000180],10 ; shot active on time
    sub esp,4
    mov dword[ebp-56],0x0f0d0f0c
    call offset_shot_enemy4
    #show dword[0x10000166]
    

    ;------------load shot enemy5-----------------------; Ready
    mov dword[0x10000170],0xb800   ; preview
    mov dword[0x10000184],150 ; shot active on time
    sub esp,4
    mov dword[ebp-60],0x0f0d0f0c
    call offset_shot_enemy5
    #show dword[0x10000174]

    ;------------load shot enemy6-----------------------; Ready
    mov dword[0x10000178],0xb800   ; preview
    mov dword[0x10000188],30 ; shot active on time
    sub esp,4
    mov dword[ebp-64],0x0f0d0f0c
    call offset_shot_enemy6
    #show dword[0x10000192]
    ;------------load shot enemy7-----------------------; Ready
    mov dword[0x10000196],0xb800   ; preview
    mov dword[0x10000220],200 ; shot active on time
    sub esp,4
    mov dword[ebp-68],0x0f0d0f0c
    call offset_shot_enemy7
    #show dword[0x10000224]

    ;------------load shot enemy8-----------------------; Ready
    mov dword[0x10000228],0xb800   ; preview
    mov dword[0x10000232],250 ; shot active on time
    sub esp,4
    mov dword[ebp-72],0x0f0d0f0c
    call offset_shot_enemy8
    #show dword[0x10000236]
    
    
    ;-------------test paint gun----------------------------
    
    ;mov eax,dword[0x10000236]   ;shot enm 4
    ;mov ebx, dword[ebp-72]
    ;#show eax
    ;mov dword[eax],ebx
    



    ;----------------print lives----------------------
    mov ebx, 0xb880
    mov dword[ebx],0x0f02
    mov ebx, 0xb884
    mov dword[ebx],0x0f02
    mov ebx, 0xb888
    mov dword[ebx],0x0f02
    mov dword[0x10000200],ebx

    mov dword[0x10000240],3  ;lives
    mov dword[0x10000244],8  ;enemies 
  


    ;----------------print score----------------------
    mov ebx, 0xb814
    mov dword[ebx],0x0f630f73
    mov ebx, 0xb818
    mov dword[ebx],0x0f720f6f
    mov ebx, 0xb81c
    mov dword[ebx],0x0f65
    ;----------------print Galaxian----------------------

    mov ebx, 0xb846
    mov dword[ebx],0x0f410f47
    mov ebx, 0xb84a
    mov dword[ebx],0x0f410f4c
    mov ebx, 0xb84e
    mov dword[ebx],0x0f490e58
    mov ebx, 0xb852
    mov dword[ebx],0x0f4e0f41





$Game_loop:
    #show dword[0x10000244]

    cmp dword[0x10000244],0
    je over
    cmp dword[0x10000240],0
    je over
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
   
;-----------------------paint enem3 shot-------------------

    inc dword[0x10000320]
    
    cmp dword[0x10000046],1
    je deaths3
    mov eax,dword[0x10000118]
    cmp word [0x10000320] , eax
    jle nolaunch3
    call shot3
    nolaunch3:
    deaths3:

;-----------------------paint enem4 shot-------------------
    inc dword[0x10000324]
    cmp dword[0x10000050],1
    je deaths4
    mov eax,dword[0x10000180]
    cmp word [0x10000324] , eax
    jle nolaunch4
    call shot4
    nolaunch4:
    deaths4:

;-----------------------paint enem5 shot-------------------
    inc dword[0x10000328]
    cmp dword[0x10000058],1
    je deaths5
    mov eax,dword[0x10000184]
    cmp word [0x10000328] , eax
    jle nolaunch5
    call shot5
    nolaunch5:
    deaths5:

;-----------------------paint enem6 shot-------------------
    inc dword[0x10000332]
    cmp dword[0x10000086],1
    je deaths6
    mov eax,dword[0x10000188]
    cmp word [0x10000332] , eax
    jle nolaunch6
    call shot6
    nolaunch6:
    deaths6:

;-----------------------paint enem7 shot-------------------
    inc dword[0x10000336]
    cmp dword[0x10000070],1
    je deaths7
    mov eax,dword[0x10000220]
    cmp word [0x10000336] , eax
    jle nolaunch7
    call shot7
    nolaunch7:
    deaths7:

;-----------------------paint enem8 shot-------------------
    inc dword[0x10000344]
    cmp dword[0x10000078],1
    je deaths8
    mov eax,dword[0x10000232]
    cmp word [0x10000344] , eax
    jle nolaunch8
    call shot8
    nolaunch8:
    deaths8:
   
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

offset_shot_enemy3:
mov eax, dword [ebp+104] ; Row
    mov ebx, eax
    shl eax, 6
    shl ebx, 4
    add eax, ebx
    add eax, dword [ebp+108] ; Col
    shl eax, 1
    add eax, 0xb800
    mov dword[0x10000124] , eax
    ret

offset_shot_enemy4:
mov eax, dword [ebp+112] ; Row
    mov ebx, eax
    shl eax, 6
    shl ebx, 4
    add eax, ebx
    add eax, dword [ebp+116] ; Col
    shl eax, 1
    add eax, 0xb800
    mov dword[0x10000166] , eax
    ret

offset_shot_enemy5:
mov eax, dword [ebp+120] ; Row
    mov ebx, eax
    shl eax, 6
    shl ebx, 4
    add eax, ebx
    add eax, dword [ebp+124] ; Col
    shl eax, 1
    add eax, 0xb800
    mov dword[0x10000174] , eax
    ret


offset_shot_enemy6:
mov eax, dword [ebp+128] ; Row
    mov ebx, eax
    shl eax, 6
    shl ebx, 4
    add eax, ebx
    add eax, dword [ebp+132] ; Col
    shl eax, 1
    add eax, 0xb800
    mov dword[0x10000192] , eax
    ret
offset_shot_enemy7:
mov eax, dword [ebp+136] ; Row
    mov ebx, eax
    shl eax, 6
    shl ebx, 4
    add eax, ebx
    add eax, dword [ebp+140] ; Col
    shl eax, 1
    add eax, 0xb800
    mov dword[0x10000224] , eax
    ret

offset_shot_enemy8:
mov eax, dword [ebp+144] ; Row
    mov ebx, eax
    shl eax, 6
    shl ebx, 4
    add eax, ebx
    add eax, dword [ebp+148] ; Col
    shl eax, 1
    add eax, 0xb800
    mov dword[0x10000236] , eax
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
    dec dword[0x10000240]         ; lives -1
    
    

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
    dec dword[0x10000240]         ; lives -1
    

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

shot3:

    cmp dword[0x10000152],30
    je limitshot3
    cmp dword[0x10000124],esi
    je ko3

    mov edx,dword[0x10000148] ; store preview
    #show dword[0x10000148]
    mov ebx, 0x0e200e20 ;  clear
    mov dword[edx],ebx

    mov eax,dword[0x10000124]  ;paint shot1
    mov ebx, dword[ebp-52]
    #show eax
    mov dword[eax],ebx
    mov ecx, dword [ebp+104]
    mov dword[0x10000148],eax  ; save preview pos
    #show dword[0x10000148]

    inc ecx 
    #show ecx
    mov dword[0x10000152],ecx
    mov dword[ebp+104] ,ecx
    call offset_shot_enemy3
    
    limitshot3:
    cmp dword[0x10000152],30
    jne nonrestshot3
    mov edx,dword[0x10000148] ; clean last pos shot
    #show dword[0x10000148]
    mov ebx, 0x0e200e20 ;  
    mov dword[edx],ebx

    add dword[0x10000118],200 ; time shot
    #show ["*"]

    mov dword[0x10000152],0   ; reposition limit
    mov dword[ebp+104] ,16     ; reposition shot
    call offset_shot_enemy3
    nonrestshot3:
    jmp limitdown3
    ko3:
    #show ["---"]
    mov edx,dword[0x10000148] ; clean last pos
    #show dword[0x10000148]
    mov ebx, 0x0e200e20;  
    mov dword[edx],ebx

    mov ebx,dword[0x10000200]    ;lives -1 
    mov dword[ebx],0x0e200e20
    sub dword[0x10000200],4
    dec dword[0x10000240]         ; lives -1
    

    loop4:
    cmp  dword[0x10000308],182020
    jge endexplotion3
    mov dword[esi],0x0e100e11    ; explotion
    inc dword[0x10000308]
    #show dword[0x10000308]
    jmp loop4
    endexplotion3:
    mov dword[esi],0x0e200e20    ; clean explosion

    mov dword[0x10000308],0
    add dword[0x10000118],200 ; time shot

    mov dword[ebp+12],39   ; reposition ship
    call offset
    mov dword[ebp+16],25   ; reposition shots
    mov dword[ebp+20],39 
    call offset_shot

    mov dword[0x10000152],0   ; reposition limit
    mov dword[ebp+104] ,16     ; reposition shot
    call offset_shot_enemy3

    limitdown3:
ret

shot4:

    cmp dword[0x10000156],30
    je limitshot4
    cmp dword[0x10000166],esi
    je ko4

    mov edx,dword[0x10000162] ; store preview
    #show dword[0x10000162]
    mov ebx, 0x0e200e20 ;  clear
    mov dword[edx],ebx

    mov eax,dword[0x10000166]  ;paint shot1
    mov ebx, dword[ebp-56]
    #show eax
    mov dword[eax],ebx
    mov ecx, dword [ebp+112]
    mov dword[0x10000162],eax  ; save preview pos
    #show dword[0x10000162]

    inc ecx 
    #show ecx
    mov dword[0x10000156],ecx
    mov dword[ebp+112] ,ecx
    call offset_shot_enemy4
    
    limitshot4:
    cmp dword[0x10000156],30
    jne nonrestshot4
    mov edx,dword[0x10000162] ; clean last pos shot
    #show dword[0x10000162]
    mov ebx, 0x0e200e20 ;  
    mov dword[edx],ebx

    add dword[0x10000180],50 ; time shot
    #show ["*"]

    mov dword[0x10000156],0   ; reposition limit
    mov dword[ebp+112] ,16     ; reposition shot
    call offset_shot_enemy4
    nonrestshot4:
    jmp limitdown4
    ko4:
    #show ["---"]
    mov edx,dword[0x10000162] ; clean last pos
    #show dword[0x10000162]
    mov ebx, 0x0e200e20;  
    mov dword[edx],ebx

    mov ebx,dword[0x10000200]    ;lives -1 
    mov dword[ebx],0x0e200e20
    sub dword[0x10000200],4
    dec dword[0x10000240]         ; lives -1
    

    loop4:
    cmp  dword[0x10000340],182020
    jge endexplotion4
    mov dword[esi],0x0e100e11    ; explotion
    inc dword[0x10000340]
    #show dword[0x10000340]
    jmp loop4
    endexplotion4:
    mov dword[esi],0x0e200e20    ; clean explosion

    mov dword[0x10000340],0
    add dword[0x10000180],20 ; time shot

    mov dword[ebp+12],39   ; reposition ship
    call offset
    mov dword[ebp+16],25   ; reposition shots
    mov dword[ebp+20],39 
    call offset_shot

    mov dword[0x10000156],0   ; reposition limit
    mov dword[ebp+112] ,16     ; reposition shot
    call offset_shot_enemy4

    limitdown4:
ret

shot5:

    cmp dword[0x10000156],30
    je limitshot4
    cmp dword[0x10000174],esi
    je ko4

    mov edx,dword[0x10000170] ; store preview
    #show dword[0x10000170]
    mov ebx, 0x0e200e20 ;  clear
    mov dword[edx],ebx

    mov eax,dword[0x10000174]  ;paint shot1
    mov ebx, dword[ebp-60]
    #show eax
    mov dword[eax],ebx
    mov ecx, dword [ebp+120]
    mov dword[0x10000170],eax  ; save preview pos
    #show dword[0x10000170]

    inc ecx 
    #show ecx
    mov dword[0x10000156],ecx
    mov dword[ebp+120] ,ecx
    call offset_shot_enemy5
    
    limitshot4:
    cmp dword[0x10000156],30
    jne nonrestshot4
    mov edx,dword[0x10000170] ; clean last pos shot
    #show dword[0x10000170]
    mov ebx, 0x0e200e20 ;  
    mov dword[edx],ebx

    add dword[0x10000184],100 ; time shot
    #show ["*"]

    mov dword[0x10000156],0   ; reposition limit
    mov dword[ebp+120] ,16     ; reposition shot
    call offset_shot_enemy5
    nonrestshot4:
    jmp limitdown4
    ko4:
    #show ["---"]
    mov edx,dword[0x10000170] ; clean last pos
    #show dword[0x10000170]
    mov ebx, 0x0e200e20;  
    mov dword[edx],ebx

    mov ebx,dword[0x10000200]    ;lives -1 
    mov dword[ebx],0x0e200e20
    sub dword[0x10000200],4
    dec dword[0x10000240]         ; lives -1
    

    loop4:
    cmp  dword[0x10000340],182020
    jge endexplotion4
    mov dword[esi],0x0e100e11    ; explotion
    inc dword[0x10000340]
    #show dword[0x10000340]
    jmp loop4
    endexplotion4:
    mov dword[esi],0x0e200e20    ; clean explosion

    mov dword[0x10000340],0
    add dword[0x10000184],100 ; time shot

    mov dword[ebp+12],39   ; reposition ship
    call offset
    mov dword[ebp+16],25   ; reposition shots
    mov dword[ebp+20],39 
    call offset_shot

    mov dword[0x10000156],0   ; reposition limit
    mov dword[ebp+120] ,16     ; reposition shot
    call offset_shot_enemy5
    
    limitdown4:


ret

shot6:

    cmp dword[0x10000156],30
    je limitshot4
    cmp dword[0x10000192],esi
    je ko4

    mov edx,dword[0x10000178] ; store preview
    #show dword[0x10000178]
    mov ebx, 0x0e200e20 ;  clear
    mov dword[edx],ebx

    mov eax,dword[0x10000192]  ;paint shot1
    mov ebx, dword[ebp-64]
    #show eax
    mov dword[eax],ebx
    mov ecx, dword [ebp+128]
    mov dword[0x10000178],eax  ; save preview pos
    #show dword[0x10000178]

    inc ecx 
    #show ecx
    mov dword[0x10000156],ecx
    mov dword[ebp+128] ,ecx
    call offset_shot_enemy6
    
    limitshot4:
    cmp dword[0x10000156],30
    jne nonrestshot4
    mov edx,dword[0x10000178] ; clean last pos shot
    #show dword[0x10000178]
    mov ebx, 0x0e200e20 ;  
    mov dword[edx],ebx

    add dword[0x10000188],100 ; time shot
    #show ["*"]

    mov dword[0x10000156],0   ; reposition limit
    mov dword[ebp+128] ,16     ; reposition shot
    call offset_shot_enemy6
    nonrestshot4:
    jmp limitdown4
    ko4:
    #show ["---"]
    mov edx,dword[0x10000178] ; clean last pos
    #show dword[0x10000178]
    mov ebx, 0x0e200e20;  
    mov dword[edx],ebx

    mov ebx,dword[0x10000200]    ;lives -1 
    mov dword[ebx],0x0e200e20
    sub dword[0x10000200],4
    dec dword[0x10000240]         ; lives -1
    

    loop4:
    cmp  dword[0x10000340],182020
    jge endexplotion4
    mov dword[esi],0x0e100e11    ; explotion
    inc dword[0x10000340]
    #show dword[0x10000340]
    jmp loop4
    endexplotion4:
    mov dword[esi],0x0e200e20    ; clean explosion

    mov dword[0x10000340],0
    add dword[0x10000188],100 ; time shot

    mov dword[ebp+12],39   ; reposition ship
    call offset
    mov dword[ebp+16],25   ; reposition shots
    mov dword[ebp+20],39 
    call offset_shot

    mov dword[0x10000156],0   ; reposition limit
    mov dword[ebp+128] ,16     ; reposition shot
    call offset_shot_enemy6
    
    limitdown4:


ret


shot7:

    cmp dword[0x10000156],30
    je limitshot4
    cmp dword[0x10000224],esi
    je ko4

    mov edx,dword[0x10000196] ; store preview
    #show dword[0x10000196]
    mov ebx, 0x0e200e20 ;  clear
    mov dword[edx],ebx

    mov eax,dword[0x10000224]  ;paint shot1
    mov ebx, dword[ebp-68]
    #show eax
    mov dword[eax],ebx
    mov ecx, dword [ebp+136]
    mov dword[0x10000196],eax  ; save preview pos
    #show dword[0x10000196]

    inc ecx 
    #show ecx
    mov dword[0x10000156],ecx
    mov dword[ebp+136] ,ecx
    call offset_shot_enemy7
    
    limitshot4:
    cmp dword[0x10000156],30
    jne nonrestshot4
    mov edx,dword[0x10000196] ; clean last pos shot
    #show dword[0x10000196]
    mov ebx, 0x0e200e20 ;  
    mov dword[edx],ebx

    add dword[0x10000220],100 ; time shot
    #show ["*"]

    mov dword[0x10000156],0   ; reposition limit
    mov dword[ebp+136] ,16     ; reposition shot
    call offset_shot_enemy7
    nonrestshot4:
    jmp limitdown4
    ko4:
    #show ["---"]
    mov edx,dword[0x10000196] ; clean last pos
    #show dword[0x10000196]
    mov ebx, 0x0e200e20;  
    mov dword[edx],ebx

    mov ebx,dword[0x10000200]    ;lives -1 
    mov dword[ebx],0x0e200e20
    sub dword[0x10000200],4
    dec dword[0x10000240]         ; lives -1
    

    loop4:
    cmp  dword[0x10000340],182020
    jge endexplotion4
    mov dword[esi],0x0e100e11    ; explotion
    inc dword[0x10000340]
    #show dword[0x10000340]
    jmp loop4
    endexplotion4:
    mov dword[esi],0x0e200e20    ; clean explosion

    mov dword[0x10000340],0
    add dword[0x10000220],100 ; time shot

    mov dword[ebp+12],39   ; reposition ship
    call offset
    mov dword[ebp+16],25   ; reposition shots
    mov dword[ebp+20],39 
    call offset_shot

    mov dword[0x10000156],0   ; reposition limit
    mov dword[ebp+136] ,16     ; reposition shot
    call offset_shot_enemy7
    
    limitdown4:


ret

shot8:

    cmp dword[0x10000156],30
    je limitshot4
    cmp dword[0x10000236],esi
    je ko4

    mov edx,dword[0x10000228] ; store preview
    #show dword[0x10000228]
    mov ebx, 0x0e200e20 ;  clear
    mov dword[edx],ebx

    mov eax,dword[0x10000236]  ;paint shot1
    mov ebx, dword[ebp-72]
    #show eax
    mov dword[eax],ebx
    mov ecx, dword [ebp+144]
    mov dword[0x10000228],eax  ; save preview pos
    #show dword[0x10000228]

    inc ecx 
    #show ecx
    mov dword[0x10000156],ecx
    mov dword[ebp+144] ,ecx
    call offset_shot_enemy8
    
    limitshot4:
    cmp dword[0x10000156],30
    jne nonrestshot4
    mov edx,dword[0x10000228] ; clean last pos shot
    #show dword[0x10000228]
    mov ebx, 0x0e200e20 ;  
    mov dword[edx],ebx

    add dword[0x10000232],100 ; time shot
    #show ["*"]

    mov dword[0x10000156],0   ; reposition limit
    mov dword[ebp+144] ,16     ; reposition shot
    call offset_shot_enemy8
    nonrestshot4:
    jmp limitdown4
    ko4:
    #show ["---"]
    mov edx,dword[0x10000228] ; clean last pos
    #show dword[0x10000228]
    mov ebx, 0x0e200e20;  
    mov dword[edx],ebx

    mov ebx,dword[0x10000200]    ;lives -1 
    mov dword[ebx],0x0e200e20
    sub dword[0x10000200],4
    dec dword[0x10000240]         ; lives -1
    
    

    loop4:
    cmp  dword[0x10000340],182020
    jge endexplotion4
    mov dword[esi],0x0e100e11    ; explotion
    inc dword[0x10000340]
    #show dword[0x10000340]
    jmp loop4
    endexplotion4:
    mov dword[esi],0x0e200e20    ; clean explosion

    mov dword[0x10000340],0
    add dword[0x10000232],100 ; time shot

    mov dword[ebp+12],39   ; reposition ship
    call offset
    mov dword[ebp+16],25   ; reposition shots
    mov dword[ebp+20],39 
    call offset_shot

    mov dword[0x10000156],0   ; reposition limit
    mov dword[ebp+144] ,16     ; reposition shot
    call offset_shot_enemy8
    
    limitdown4:


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
dec dword[0x10000244]
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

mov edx,dword[0x10000140] ; clean last pos shot
#show dword[0x10000140]
mov ebx, 0x0e200e20 ;  
mov dword[edx],ebx
dec dword[0x10000244]    ;kill enemy count
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

mov edx,dword[0x10000148] ; clean last pos shot
#show dword[0x10000148]
mov ebx, 0x0e200e20 ;  
mov dword[edx],ebx
dec dword[0x10000244]    ;kill enemy count
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

mov edx,dword[0x10000162] ; clean last pos shot
#show dword[0x10000162]
mov ebx, 0x0e200e20 ;  
mov dword[edx],ebx
dec dword[0x10000244]    ;kill enemy count
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

mov edx,dword[0x10000170] ; clean last pos shot
#show dword[0x10000170]
mov ebx, 0x0e200e20 ;  
mov dword[edx],ebx

dec dword[0x10000244]    ;kill enemy count
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

mov edx,dword[0x10000178] ; clean last pos shot
#show dword[0x10000178]
mov ebx, 0x0e200e20 ;  
mov dword[edx],ebx
dec dword[0x10000244]    ;kill enemy count
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

mov edx,dword[0x10000196] ; clean last pos shot
#show dword[0x10000196]
mov ebx, 0x0e200e20 ;  
mov dword[edx],ebx
dec dword[0x10000244]    ;kill enemy count
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

mov edx,dword[0x10000228] ; clean last pos shot
#show dword[0x10000228]
mov ebx, 0x0e200e20 ;  
mov dword[edx],ebx

dec dword[0x10000244]    ;kill enemy count
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


over:

cmp dword[0x10000244],0
je win
push 0x4
jmp loose
win:
push 0x2
loose:
call clrscr
add esp,4
#stop


clrscr:
mov ebx,dword [esp+4]   ; pass 0xa from the stack to ebx
and ebx, 0x0f           ; and is a mascara  this ebx = 0x1212323a  conerts to this  ebx = 0x0000000a  using         
mov ecx,ebx          
shl ecx,28              ; shift to the bit 31
shl ebx,12              ; ; shift to the bit 16
or ecx,ebx              ;  or combine ecx and ebx 
or ecx,0x00200020       ; or combine ecx with 0x00200020
mov ebx,0xb800          ; the first position of the screen


$loop:
mov dword[ebx],ecx     ; dword[ebx] is the first position of the screen and pass ecx to that pos
add ebx,4              ; add for to color the next pos
cmp ebx,0xcac0         ; when is less then 0xcac0 the las pos of the screen finish
jl  $loop

cmp dword[0x10000244],0
je winne
mov ebx, 0xc240
mov dword[ebx],0x4f414f47
mov ebx, 0xc244
mov dword[ebx],0x4f454f4d
mov ebx,0xc24c
mov dword[ebx],0x4f564f4f
mov ebx,0xc250
mov dword[ebx],0x4f524f45
jmp fin
winne:
mov ebx, 0xc244
mov dword[ebx],0x2f492f57
mov ebx,0xc248
mov dword[ebx],0x2f4e2f4e
mov ebx,0xc24c
mov dword[ebx],0x2f522f45
fin:



ret


#stop