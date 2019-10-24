.model small
.stack
.data
num1 db 0
num2 db 0
cuenta dw 0
NA DB 0
NMS DB 0
uni db 0 ;unidades
dece db 0 ;decenas
res db , 13,10, "Multiplicacion por sumas sucesivas: ", '$'         ; el 13,10 es para dar salto de linea
msg db , 13,10, "Ingrese un numero: ", '$'         ; el 13,10 es para dar salto de linea
msg2 db , 13,10, "Ingrese otro numero: ", '$'         ; el 13,10 es para dar salto de linea
.code

inicio:

MOV AX, @DATA
MOV DS,AX

MOV AH,00h
MOV AL,03h
INT 10h

XOR AX,AX ;Limpia el registro AX para num 1

MOV AH, 09h
LEA DX, msg
INT 21h

MOV AH, 01h
INT 21h
SUB AL, 30h
MOV num1, AL

XOR AX,AX ;Limpia el registro AX para num 2

MOV AH, 09h
LEA DX, msg2
INT 21h

MOV AH, 01h
INT 21h
SUB AL, 30h
MOV num2, AL
XOR AX, AX
MOV AL,num2
MOV cuenta,AX

MOV DL, num1
CMP DL, num2
JMP Sumas ;Multiplicacion por sumas


Sumas:
XOR AX,AX
JMP SumasConsecutivas

SumasConsecutivas:
XOR CX,CX 
MOV CX, cuenta
Multiplicacion:
ADD AL,num1
LOOP Multiplicacion
JMP Resultado

Resultado:
MOV NMS, AL
MOV DX, offset res
MOV AH, 09h
INT 21h

ADD AL, 30h
MOV AH, 02h
INT 21h

ADD AL, 30h
MOV AH, 02h
INT 21h
JMP finalizar

finalizar:
mov ah,04ch ;FINALIZAR PROGRAMA
int 21h



end