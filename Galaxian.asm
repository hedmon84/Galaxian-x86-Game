;0x04070406  pain spaceship

start:
    push 39 ;row
    push 26 ;col
    call show_pacman
    add esp, 8
    #stop

; dword [ebp+ 8] => Row
; dword [ebp+12] => Colum
show_pacman:
    push ebp
    mov ebp, esp
    sub esp, 4
    mov dword [ebp-4], 0x04070406 ; Current pacman
   
   call move
   mov eax,dword [ebp+8] ;row
   mov dword[0x10000000],eax
   mov eax,dword[ebp+12]
   mov dword[0x10000001],eax ;col
   mov edx,esi
   
    
$loop:  
    mov dword [edx], 0x0e200e20   ; clean
    mov ebx, dword [ebp-4]
    
    mov dword [esi], ebx
    push 30
    call delay
    add esp, 4
    
$test_keys:
    mov ah, byte [0xffff0004] ; Keypad
    mov al, ah
    
    ; Left key
    and al, 0x1
    test al, al
    jz $test_right
    mov edx, esi
    cmp dword[0x10000000],9962
    jle jump1
    dec dword[0x10000000]
    #show dword[0x10000000] decimal
    dec esi
    jump1:
    #show esi decimal

    mov dword [ebp-4], 0x04070406 ; Pacman left
    jmp $loop
        
$test_right:
    mov al, ah
    and al, 0x2
    test al, al
    jz $test_down
    mov edx, esi
    cmp dword[0x10000000],10062
    jge jump2
    inc dword[0x10000000]
    #show dword[0x10000000] decimal
    inc esi
    jump2:
    #show esi decimal
    
    mov dword [ebp-4], 0x04070406 ; Pacman right
    jmp $loop

$test_down:
    mov al, ah
    and al, 0x4
    test al, al
    jz $test_up
    
    mov dword [ebp-4], 0x04070406 ; Pacman down
    jmp $loop

$test_up:
    mov al, ah
    and al, 0x8
    test al, al
    jz $test_q
    
    mov dword [ebp-4], 0x04070406 ; Pacman up
    jmp $loop

$test_q:
    mov al, ah
    and al, 0x10
    test al, al
    jnz $end_loop
    
    jmp $test_keys

$end_loop:
    #show al binary
    mov esp, ebp
    pop ebp
    ret
        
delay:
    mov eax, dword [0xffff0008]
    add eax, dword [esp + 4]
$delay_loop:
    cmp dword [0xffff0008], eax
    jl $delay_loop
    ret


move:
 mov esi, dword [ebp+8] ; Row
    mov ebx, esi
    shl esi, 6
    shl ebx, 4
    add esi, ebx
    add esi, dword [ebp+12] ; Col
    shl esi, 1
    add esi, 0xb800
    ret