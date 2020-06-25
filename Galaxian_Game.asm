

start:
    push 39   ;shot
    push 25
    push 39
    push 26
    call start
    add esp, 20
    #stop
 
; dword [ebp+ 8] => Row
; dword [ebp+12] => Colum
; dword [ebp+ 16] => Row
; dword [ebp+20] => Colum
start:
    ;epilogo
    push ebp
    mov ebp, esp
    ;space ship
    sub esp, 4
    mov dword [ebp-4], 0x04070406 ; Current space ship
    call offset
   mov dword[0x10000000], esi
   ;paint shot
     mov dword[0x10000016],39
   mov dword[0x10000008],0 ; turn on shot
   sub esp,4
   mov dword [ebp-8], 0x04000401  ; current shot
   call offset_shot
    mov dword[0x10000004], edi
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


shot:

mov ecx,dword[0x10000012]
cmp dword[0x10000008],1
jl notshot
cmp ecx,1
je notshot
mov dword[0x10000004], edi
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
mov dword[edi],0x0e200e20  ; clean last shot pos
mov dword[0x10000012],25   ; reset shot time
mov dword[0x10000008],0    ; shot off
mov ecx ,dword[0x10000016] ; ship position for shot to docking
mov dword [ebp+20],ecx
mov dword [ebp+16],25      ; pass pos
call offset_shot
noreset:


ret