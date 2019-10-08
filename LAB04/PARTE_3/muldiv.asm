.MODEL small
.DATA
num1 DB 0
num2 DB 0
NA DB 0
NMS DB 0
res DB 0
multiplicacion DB 'Multiplicacion: $'
division DB 'Division: $'
residuo DB 'Residuo: $'
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
    JMP DivisionRestas
    
DivisionRestas:
    XOR AX,AX
    MOV DL,num1
    MOV CL,0d
    JMP RestasConsecutivas
    
RestasConsecutivas:
    SUB DL,num2
    CMP DL,0d
    JE DivisionEntera
    CMP DL,num2
    JL DivisionConResiduo
    INC CL
    JMP RestasConsecutivas
    
DivisionEntera:
    INC CL
    MOV DX,offset division
    MOV AH,09h
    INT 21h
    XOR DX,DX
    MOV DL,CL
    ADD DL,30h
    MOV AH,02h ;muestra el resultado de la division
    INT 21h
    JMP terminar
    
DivisionConResiduo:
    INC CL
    MOV res,DL
    MOV DX,offset division
    MOV AH,09h
    INT 21h
    XOR DX,DX
    MOV DL,CL
    ADD DL,30h
    MOV AH,02h
    INT 21h
    MOV DX,offset residuo
    MOV AH,09h
    INT 21h
    XOR DX,DX
    MOV DL,res
    ADD DL,30h
    MOV AH,02h
    INT 21h
    JMP terminar
    
terminar:
MOV AH, 4Ch 
INT 21h
END inicio