.MODEL small

.DATA
; variable que contiene el texto que queremos mostrar
cadena DB 'Kevin Barrientos$' ; $ significa el final de la cadena
cadena_dos DB '  1084517$' ; $ significa el final de la cadena


.STACK
.CODE
Programa: ; etiqueta de inicio de programa
; inicializar programa
MOV AX, @Data ;guardando direccion de inicio de segmento de datos
MOV DS, AX

; Imprimir cadena
MOV DX, OFFSET cadena ;asignando a DX la variable cadena
MOV AH, 09h           ;decimos que se imprimira una cadena
INT 21h           ;ejecuta la interrupcion, imprimira

MOV DX, OFFSET cadena_dos ;asignando a DX la variable cadena
MOV AH, 09h           ;decimos que se imprimira una cadena
INT 21h           ;ejecuta la interrupcion, imprimira

; finalizar programa
MOV AH, 4Ch ;finalizar proceso
INT 21h     ; ejecuta la interrupcion
END Programa