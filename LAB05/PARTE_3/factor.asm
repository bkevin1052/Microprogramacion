.model small
.stack 64h
.DATA
.code
MOV AX,@DATA
mov ds,ax
call capt
;obtiene factorial de 0-4 resultados de dos digitos maximos

;FACTORIAL:
mov al,05
mov bl,al
FACT:
CMP     BL,01       ;mientras n>1
JBE     FIN         ;si es igual a uno se detiene
DEC     BL          ;aux=n-1
MUL     BX          ;AX=AX*BX ' n!=n*(n-1)!
LOOP    FACT        ;llama la rutina factorial JUMP***
FIN:
MOV     CL,00       ;limpia el registro contador (opcional)
aam
CMP     AL,0Ah;si la unidad es menor que 10d salta a decena, sino ajusta la unidad
JB      DIG2
daa
DIG2:
MOV     BL,AL
MOV     AL,AH
CMP     AL,0Ah
JB      dig ;si es menor que 10d salta a total, sino ajusta la decena
daa
MOV     CL,31h;ajusta centena
dig:
MOV     BH,AL
AND     BX,0F0Fh
OR      BX,3030h

call resultado

mov ah,01
int 21h
mov ah,4Ch
int 21h

RESULTADO:
MOV     AH,02h; posición de retorno de calculo
MOV     DL,3Dh; (=)
INT     21h; imprime caracter
MOV     DL,CL; acarreo o signo negativo
INT     21h; imprime caracter
MOV     DL,BH; digito mas significativo
INT     21h; imprime caracter
MOV     DL,BL; digito menos significativo
INT     21h; imprime caracter
RET; retornar a la interfase gráfica que lo llamo

;capturar operando
CAPT:
MOV     AH,01h
INT     21h
MOV     BH,AL
INT     21h
MOV     AH,BH
SUB     AX,3030h
RET



END