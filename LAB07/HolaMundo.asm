.386
.MODEL     flat, stdCALL
OPTION     casemap :none
   
; Includes
include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc
; librerias
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib

cdMaxSize  EQU 11

.DATA?
  szNumber1 db cdMaxSize dup(?)
  szNumber2 db cdMaxSize dup(?)
  iNum      dd ?
 
.DATA
  szTxtNum1 db "Ingrese primer numero: ", 0
  szTxtNum2 db "Ingrese segundo numero: ", 0
  szTxtSum  db "Suma: ", 0
  szTxtRes  db "Resta: ", 0
  number1   DD 442
  number2   dd 22
  msg       db cdMaxSize dup(0)
  iguales 	db "Son iguales",0
  mayor 	db "Es mayor",0
  menor 	db "Es menor",0
 
.CODE

  num2str PROC uses ebx edx esi
    MOV     esi, offset msg + cdMaxSize - 1
    MOV     ebx, 10
    @Next:
      DEC     esi
      xor     edx, edx
      div     ebx
      or      edx, 30h
      MOV     byte ptr [esi], dl
      or      eax, eax
    jnz     @Next
    MOV     eax, esi
    RET
  num2str ENDP
 
  str2num PROC uses ebx ecx edx esi edi

    MOV     edi, eax              
    MOV     eax, 0
    MOV     ecx, cdMaxSize
    repne   scasb
    jne     @NoFound
    sub     edi, 2
    sub     ecx, cdMaxSize
    neg     ecx
    MOV     ebx, 1                ; Factor
    MOV     esi, 0                ; AcuMULador
    @Next:
      DEC     ecx
      jl      @Exit
      xor     eax, eax            ; Limpiar registro
      MOV     al, byte ptr [edi]
      and     al, 15             
      MUL     ebx
      ADD     esi, eax            ; Acceder al acuMULador
      MOV     eax, ebx            ; Incrementar factor
      MOV     ebx, 10
      MUL     ebx
      MOV     ebx, eax
      DEC     edi                 ; Reset
    JMP     @Next
    @Exit:
    MOV     eax, esi
    @NoFound:
    RET
  str2num ENDP
 

  start:
    ; Obtener ascii
    INVOKE     StdOut, offset szTxtNum1
    INVOKE     StdIn, offset szNumber1, cdMaxSize
    INVOKE     StdOut, offset szTxtNum2
    INVOKE     StdIn, offset szNumber2, cdMaxSize
   
    ; Convertir a numeros y sumar
    MOV        eax, offset szNumber1
    CALL       str2num
    MOV        ebx, eax
   
    MOV        eax, offset szNumber2
    CALL       str2num
	
    ADD        ebx, eax
   
    ; Mostrar Resultado Suma
    INVOKE     StdOut, offset szTxtSum
    MOV        eax, ebx
    CALL       num2str
    INVOKE     StdOut, eax
	
	; Convertir a numeros y Restar
	
	MOV        eax, offset szNumber1
    CALL       str2num
    MOV        ebx, eax
   
    MOV        eax, offset szNumber2
    CALL       str2num
	
    SUB        ebx, eax
	; Mostrar Resultado Resta
   
    INVOKE     StdOut, offset szTxtRes
    MOV        eax, ebx
    CALL       num2str
    INVOKE     StdOut, eax

	; Mostrar si es mayor, menor o igual
    INVOKE     ExitProcess, 0
	
 
END start