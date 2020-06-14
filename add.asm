push 20       ; sword pila
push 10       ; pila
call _add      ; jal

add esp, 8
#show eax signed decimal
#stop



_add:
 mov eax, dword[esp + 4] ; tope de la pila 10
 mov ebx, dword[esp + 8]; mas bajo de la pila 20
 ; or  add eax,dword[esp + 8] mas corto
 add eax, ebx
 ret