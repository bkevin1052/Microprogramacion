.MODEL small
.STACK
.DATA ;En.data se declaran variables y cadenas a usar en el programa
.CODE
inicio:
  MOV AH,00h
  MOV AL,03h
  INT 10h
  MOV CX,1000
  ciclo:
  MOV AX,@data
  MOV DL,78h    ; x minuscula
  MOV AH, 02h
  INT 21h
  LOOP ciclo
  JMP saltoenter
  
  saltoenter:
  MOV AH, 01h
  INT 21h
  CMP AL,0dh    ;Se compara si la tecla es un ENTER
  JE finalizar
  JMP inicio
  
  finalizar:
  MOV ah,04ch   ;FINALIZAR EL PORGRAMA
  INT 21h   
end