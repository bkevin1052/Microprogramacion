.MODEL small
.DATA
num1 DB 0
num2 DB 0
NA DB 0
NMS DB 0
res DB 0
multiplicacion DB 'Multiplicacion: $'
.STACK
.CODE
inicio:
;inicia inicio
    MOV AX, @DATA 
    Mov DS, AX 
    XOR AX,AX
    MOV AH,01h
    INT 21h
    SUB AL,30h ;obtiene el valor real
    MOV num1,AL
    ;leer numero 2
    XOR AX,AX
    MOV AH, 01h
    INT 21h
    SUB AL, 30h ; obtener el valor real
    MOV num2,AL
    MOV DL,num1
    CMP DL,num2
    JMP MultiplicacionSumas ;salta a la multiplicacion
    
MultiplicacionSumas:
    XOR AX,AX
    MOV CL,num1
    MOV DL,0d
    JMP SumasConsecutivas
    
SumasConsecutivas:
    ADD DL,num2
    CMP DL,9d
    JG Acarreo
    DEC CL
    CMP CL,0d
    JNE SumasConsecutivas
    JMP ResultadoMult
    
Acarreo:
    ADD NA,1d
    SUB DL,10d
    DEC CL
    CMP CL,0d
    JNE SumasConsecutivas
    JMP ResultadoMult
    
ResultadoMult:
    MOV NMS,DL
    MOV DX,offset multiplicacion
    MOV AH,09h
    INT 21h
    XOR DX,DX
    MOV DL,NA
    ADD DL,30h
    MOV AH,02h
    INT 21h
    MOV DL,NMS
    ADD DL,30h
    MOV AH,02h
    INT 21h
    JMP terminar

    

terminar:
MOV AH, 4Ch 
INT 21h
END inicio