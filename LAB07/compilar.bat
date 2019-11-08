set projectName = HolaMundo.asm
\masm32\bin\ml /c /Zd /coff HolaMundo.asm
\masm32\bin\Link /SUBSYSTEM:CONSOLE HolaMundo.obj
HolaMundo.exe