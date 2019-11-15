.386
.model flat, stdcall
option casemap:none

;includes
include \masm32\include\windows.inc ;incluye formularios 
include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc
include \masm32\include\masm32rt.inc ;hace llamada a la hora del sistema

;macros

;librerias
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib

;Segmento de datos
.DATA
	pedirnum db "Ingrese un numero: ",0
.DATA?
;;;;;;;;;;;;;;
num DW 20 dup(?)
resultado DD 20 dup(?)
;;;;;;;;;;;;;;;;;

.CODE
programa:
	
	;INGRESO DE NUMERO
	INVOKE StdOut, addr pedirnum
	INVOKE StdIn, addr num, 8
	INVOKE atodw, addr num
	;MOV num1,EAX
	MOV num, AX
	;print str$(AX)
	;print str$(num)

	MOV EAX, 1
	MOV resultado,1
	MOV BX,0
	Ciclo1:
		INC BX
		MOV CX, BX
		CMP CX,2
		JB Fin
		SUB CX, 1
		MOV EDX, resultado
		Ciclo:
			ADD EDX,resultado
			SUB CX,1
			CMP CX,0
			JA Ciclo
			MOV resultado, EDX
		Fin:
		CMP BX,num
		JB Ciclo1
	print str$(resultado)

	;finalizar
finalizar:
	INVOKE ExitProcess,0
END programa