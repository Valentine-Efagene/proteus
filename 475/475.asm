
org 100h      
          
;MODE 0, PORT A AS INPUT
mov dx, 06h
mov al, 90h
out dx, al 

read: 
mov dx, 00h
in al, dx  
cmp al, 7fh
jne read

start: 
;MODE 0, ALL PORTS OUTPUT
mov dx, 06h
mov al, 80h
out dx, al

;PRINT 4
mov dx, 00h
mov al, 66h
out dx, al
        
;PRINT 7
mov dx, 02h
mov al, 07h
out dx, al
        
;PRINT 5
mov dx, 04h
mov al, 6Dh
out dx, al
hlt