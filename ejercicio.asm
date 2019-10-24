.MODEL small
.STACK
.DATA

num1 DB ?
num2 DB ?

.CODE

program:
    MOV AX, @DATA
    MOV  DB, AX
    ;leer numeros
    XOR AX, AX
    MOV AH, 01h
    INT 21h
    MOV num1, AL
    INT 21h
    MOV num2, AL

    ;Convertir a valor real
    SUB num1, 30h
    SUB num2, 30h

    ;Preparar valores para el ciclo
    MOV CL, num2
    
    Multiplicar:
        ADD BL, num1
        LOOP Multiplicar    
    Imprimir:
        MOV AH,02
        MOV DL, BL
        ADD DL, 30h
        INT 21h
        GOTO Finalizar


    Finalizar:
    MOV AH,4Ch
    INT 21h

end program