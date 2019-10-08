.model small
.stack 64
.data
mayor1 Db 'Es mayor','$'
menor1 Db 'Es menor','$'
igual1 Db 'Son iguales','$'
.code
  inicio:
   mov ah,01
   int 21h
    mov bl,al
   mov ah,01
   int 21h
   mov cl,al
   cmp bl,cl
   ja mayor
   jb menor
   je igual
   mayor:
   mov ax,@data
   mov ds,ax
   mov ah,09
   mov dx,offset mayor1
   int 21h
   jmp salir
   menor:
   mov ax,@data
   mov ds,ax
   mov ah,09
   mov dx,offset menor1
   int 21h
   jmp salir
   igual:
   mov ax,@data
   mov ds,ax
   mov ah,09
   mov dx,offset igual1
   int 21h
   jmp salir
   salir:
   mov ah,4ch
   int 21h
  end inicio