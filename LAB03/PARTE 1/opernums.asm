.model small


.stack 64
.data
  
;declarando variables globales
numero1 db 0
numero2 db 0

suma db 0
resta db 0
multiplicacion db 0
division db 0
modulo db 0

msjn1 db 10,13, "Ingrese el primer numero= ",'$'; num 1
msjn2 db 10,13, "Ingrese el segundo numero= ",'$'; num 2

;mensaje para mostrar los resultados
 
msjnS db 10,13, "SUMA = ",'$'
msjnR db 10,13, "RESTA = ",'$'
msjnM db 10,13, "MULTIPLICACION = ",'$'
msjnD db 10,13, "DIVISION = ",'$' 
msjnMod db 10,13, "MODULO = ",'$' 

.code
begin proc far
    
    ;direccionamiento del procedimiento
    MOV ax, @data
    MOV ds,ax
    
    ;solicitar del teclado numero 1
    
    MOV ah, 09
    LEA dx, msjn1
    INT 21h
    MOV ah, 01
    INT 21h
    SUB al, 30h
    MOV numero1,al
    
    ;solicitar del teclado numero 2
    
    MOV ah, 09
    LEA dx, msjn2
    INT 21h
    MOV ah, 01
    INT 21h
    SUB al, 30h
    MOV numero2,al
    
    ;operaciones aritmeticas
                  
    ;SUMA             
    MOV al,numero1
    add al,numero2
    MOV suma,al  
    
    ;RESTA
    MOV al,numero1
    SUB al,numero2
    MOV resta,al
    
    ;MULTIPLICACION
    MOV al,numero1
    mul numero2
    MOV multiplicacion,al
    
    ;DIVISION
    MOV al,numero1
    div numero2
    MOV division,al
    
    ;MODULO
    MOV al, numero1
    div numero2
    MOV modulo,ah 
          
    ;IMPRIMIENDO SUMA
    MOV ah,09
    LEA dx,msjnS
    INT 21h
    MOV dl,suma
    add dl,30h 
    MOV ah,02
    INT 21h  
    
    ;IMPRIMIENDO RESTA
    MOV ah,09
    LEA dx,msjnR
    INT 21h
    MOV dl,resta
    add dl,30h 
    MOV ah,02
    INT 21h
    
    ;IMPRIMIENDO MULTIPLICACION
    MOV ah,09
    LEA dx,msjnM
    INT 21h
    MOV dl,multiplicacion
    add dl,30h 
    MOV ah,02
    INT 21h
    
    ;IMPRIMIENDO DIVISION
    MOV ah,09
    LEA dx,msjnD
    INT 21h
    MOV dl,division
    add dl,30h 
    MOV ah,02
    INT 21h
                
    ;IMPRIMIENDO MODULO     
    MOV ah,09
    LEA dx,msjnMod
    INT 21h
    MOV dl,modulo
    add dl,30h 
    MOV ah,02
    INT 21h
  
    ;cierre del programa
    MOV ah,4ch
    INT 21h
    
    begin endp
end