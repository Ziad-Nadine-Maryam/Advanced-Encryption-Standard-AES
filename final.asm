.model small
.data 
sf      db 000h,000h,000h,000h      ;after shifting rows 
        db 000h,000h,000h,000h
        db 000h,000h,000h,000h
        db 000h,000h,000h,000h
        
fn       db 000h,000h,000h,000h    
         db 000h,000h,000h,000h
         db 000h,000h,000h,000h
         db 000h,000h,000h,000h          

key     db 0ffh,0ffh,0ffh,0ffh
        db 0ffh,0ffh,0ffh,0ffh
        db 0ffh,0ffh,0ffh,0ffh
        db 0ffh,0ffh,0ffh,0ffh


final    db 000h,000h,000h,000h
         db 000h,000h,000h,000h
         db 000h,000h,000h,000h
         db 000h,000h,000h,000h
                                 
ckprep   db 000h,000h,000h,000h
         db 000h,000h,000h,000h
         db 000h,000h,000h,000h
         db 000h,000h,000h,000h
                                          
   n_line DB 0DH,0AH,"$"   ;for printing new line          
          
CipherKey      db 02bh,028h,0abh,009h
               db 07eh,0aeh,0f7h,0cfh
               db 015h,0d2h,015h,04fh
               db 016h,0a6h,088h,03ch  
         
         
         



;        0    1    2    3    4    5    6    7    8    9    A    B     C    D    E    F
sbox db 063h,07ch,077h,07bh,0f2h,06bh,06fh,0c5h,030h,001h,067h,02bh,0feh,0d7h,0abh,076h ;O
     db 0cah,082h,0c9h,07dh,0fah,059h,047h,0f0h,0adh,0d4h,0a2h,0afh,09ch,0a4h,072h,0c0h ;1
     db 0b7h,0fdh,093h,026h,036h,03fh,0f7h,0cch,034h,0a5h,0e5h,0f1h,071h,0d8h,031h,015h ;2
     db 004h,0c7h,023h,0c3h,018h,096h,005h,09ah,007h,012h,080h,0e2h,0ebh,027h,0b2h,075h ;3
     db 009h,083h,02ch,01ah,01bh,06eh,05ah,0a0h,052h,03bh,0d6h,0b3h,029h,0e3h,02fh,084h ;4
     db 053h,0d1h,000h,0edh,020h,0fch,0b1h,05bh,06ah,0cbh,0beh,039h,04ah,04ch,058h,0cfh ;5
     db 0d0h,0efh,0aah,0fbh,043h,04dh,033h,085h,045h,0f9h,002h,07fh,050h,03ch,09fh,0a8h ;6
     db 051h,0a3h,040h,08fh,092h,09dh,038h,0f5h,0bch,0b6h,0dah,021h,010h,0ffh,0f3h,0d2h ;7
     db 0cdh,00ch,013h,0ech,05fh,097h,044h,017h,0c4h,0a7h,07eh,03dh,064h,05dh,019h,073h ;8
     db 060h,081h,04fh,0dch,022h,02ah,090h,088h,046h,0eeh,0b8h,014h,0deh,05eh,00bh,0dbh ;9
     db 0e0h,032h,03ah,00ah,049h,006h,024h,05ch,0c2h,0d3h,0ach,062h,091h,095h,0e4h,079h ;A
     db 0e7h,0c8h,037h,06dh,08dh,0d5h,04eh,0a9h,06ch,056h,0f4h,0eah,065h,07ah,0aeh,008h ;B
     db 0bah,078h,025h,02eh,01ch,0a6h,0b4h,0c6h,0e8h,0ddh,074h,01fh,04bh,0bdh,08bh,08ah ;C
     db 070h,03eh,0b5h,066h,048h,003h,0f6h,00eh,061h,035h,057h,0b9h,086h,0c1h,01dh,09eh ;D
     db 0e1h,0f8h,098h,011h,069h,0d9h,08eh,094h,09bh,01eh,087h,0e9h,0ceh,055h,028h,0dfh ;E
     db 08ch,0a1h,089h,00dh,0bfh,0e6h,042h,068h,041h,099h,02dh,00fh,0b0h,054h,0bbh,016h ;F




;            0   1   2   3   4   5   6   7   8   9           
rcon    db   01h,02h,04h,08h,10h,20h,40h,80h,1bh,36h  ;0
        db   00h,00h,00h,00h,00h,00h,00h,00h,00h,00h  ;1
        db   00h,00h,00h,00h,00h,00h,00h,00h,00h,00h  ;2
        db   00h,00h,00h,00h,00h,00h,00h,00h,00h,00h  ;3




pt   db 000h,000h,000h,000h
         db 000h,000h,000h,000h
         db 000h,000h,000h,000h
         db 000h,000h,000h,000h    
;pt   db 032H,088h,031h,0E0h
;     db 043h,05Ah,031h,037h
;     db 0F6h,030h,098h,007h
;     db 0A8h,08Dh,0A2h,034h
        
ot   db 000h,000h,000h,000h    ;after mixing rows and subbytes
     db 000h,000h,000h,000h
     db 000h,000h,000h,000h
     db 000h,000h,000h,000h  
     
     
x   db 000h,000h,000h,000h 

y   db 000h,000h,000h,000h   

 ;           0    1    2   3    4    5    6    7    8     9   A   B     C    D    E    F    10    11  12  13    14   15   16   17   18   19   1A   1B   1C   1D   1E   1F   20  21    22   23  24    25  26    27  
zkey    db 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h    
        db 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h 
        db 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h 
        db 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h 
        

zkey2    db 000h,000h,000h,000h    
         db 000h,000h,000h,000h
         db 000h,000h,000h,000h
         db 000h,000h,000h,000h 
         
zkey3    db 000h,000h,000h,000h    
         db 000h,000h,000h,000h
         db 000h,000h,000h,000h
         db 000h,000h,000h,000h   
         
zkey4    db 000h,000h,000h,000h    
         db 000h,000h,000h,000h
         db 000h,000h,000h,000h
         db 000h,000h,000h,000h                  

                            
                            
                            
galois  db 002h,003h,001h,001h
        db 001h,002h,003h,001h
        db 001h,001h,002h,003h
        db 003h,001h,001h,002h                            



test1 db 0AH,0BH,0CH,0DH
 
tmp   db 0h    

c dw 0h    
count dw 009h 
zkeycounter dw 0h



.code
mov ax,@DATA
mov ds,ax
xor ax,ax
xor si,si







key22 proc 

 
 
;xorring pxor al,al  
; henna bamouve a5er column fel input w ashift rows  
, hena ba3mel elshiftt 
 xor si,si  
 xor di,di   
 
 mov al,CipherKey[3] 
 mov zkey[078h],al  
 mov al,CipherKey[7] 
 mov zkey[0],al
 mov al,CipherKey[11] 
 mov zkey[028h],al
 mov al,CipherKey[15] 
 mov zkey[050h],al 
 
  shiftingrows2 proc ; hena bene3mel subbytes 
    begin:      
 mov bl,zkey[di]
 cmp di,0a0h
 jz exit101  
 mov cl,sbox[bx] 
 mov zkey[di],cl
 add di,028h    
 jmp begin
 exit101: endp 
; xor al,al   
; xor si,si  
xor di,di 
 
      ; awel column mel cipherkey 
 mov al,CipherKey[0] 
 mov zkey2[0],al  
 mov al,CipherKey[4] 
 mov zkey2[4],al
 mov al,CipherKey[8] 
 mov zkey2[8],al
 mov al,CipherKey[12] 
 mov zkey2[12],al
 
 xor al,al
         ; hen a zor m3 awel column w eltan y w rcon
 mov al,zkey2[0]
 xor zkey[0],al
 mov al,zkey2[4]
 xor zkey[028h],al
 mov al,zkey2[8]
 xor zkey[050h],al
 mov al,zkey2[12]
 xor zkey[078h],al
   
 
 xor al,al  
 mov al,rcon[0]
 xor zkey[0],al
 
 
;hena ana habda2 tany cycle    
 ; han2el nw tany row fel zkey2
 xor di,di 
 
 
 mov al,CipherKey[1] 
 mov zkey2[0],al  
 mov al,CipherKey[5] 
 mov zkey2[4],al
 mov al,CipherKey[9] 
 mov zkey2[8],al
 mov al,CipherKey[13] 
 mov zkey2[12],al           
 xor al,al                  
 mov al,zkey[0] 
 mov zkey3[0],al  
 mov al,zKey[028h] 
 mov zkey3[4],al
 mov al,zKey[050h] 
 mov zkey3[8],al
 mov al,zKey[078h] 
 mov zkey3[12],al      
 ;----------------- henna habda2 elxoringg 
 xor al,al
 
 mov al,zkey2[0]
 xor zkey3[0],al
 mov al,zkey2[4]
 xor zkey3[4],al
 mov al,zkey2[8]
 xor zkey3[8],al
 mov al,zkey2[12]
 xor zkey3[12],al
 ;-----------------henna hamove gove zkey
 mov al,zkey3[0] 
 mov zkey[1],al  
 mov al,zKey3[4] 
 mov zkey[029h],al
 mov al,zKey3[8] 
 mov zkey[051h],al
 mov al,zKey3[12] 
 mov zkey[079h],al  
; ;------------------  henna hamove 3rd rw      
  xor di,di 
 
 
 mov al,CipherKey[2] 
 mov zkey2[0],al  
 mov al,CipherKey[6] 
 mov zkey2[4],al
 mov al,CipherKey[10] 
 mov zkey2[8],al
 mov al,CipherKey[14] 
 mov zkey2[12],al           
 xor al,al                  
 mov al,zkey[1] 
 mov zkey3[0],al  
 mov al,zKey[029h] 
 mov zkey3[4],al
 mov al,zKey[051h] 
 mov zkey3[8],al
 mov al,zKey[079h] 
 mov zkey3[12],al      
 ;----------------- henna habda2 elxoringg 
 xor al,al
 
 mov al,zkey2[0]
 xor zkey3[0],al
 mov al,zkey2[4]
 xor zkey3[4],al
 mov al,zkey2[8]
 xor zkey3[8],al
 mov al,zkey2[12]
 xor zkey3[12],al
 ;-----------------henna hamove gove zkey
 mov al,zkey3[0] 
 mov zkey[2],al  
 mov al,zKey3[4] 
 mov zkey[02ah],al
 mov al,zKey3[8] 
 mov zkey[052h],al
 mov al,zKey3[12] 
 mov zkey[07ah],al
                  
 ;------------------  henna hamove 4th rw      
  xor di,di 
 
 
 mov al,CipherKey[3] 
 mov zkey2[0],al  
 mov al,CipherKey[7] 
 mov zkey2[4],al
 mov al,CipherKey[11] 
 mov zkey2[8],al
 mov al,CipherKey[15] 
 mov zkey2[12],al           
 xor al,al                  
 mov al,zkey[2] 
 mov zkey3[0],al  
 mov al,zKey[02ah] 
 mov zkey3[4],al
 mov al,zKey[052h] 
 mov zkey3[8],al
 mov al,zKey[07ah] 
 mov zkey3[12],al      
 ;----------------- henna habda2 elxoringg 
 xor al,al
 
 mov al,zkey2[0]
 xor zkey3[0],al
 mov al,zkey2[4]
 xor zkey3[4],al
 mov al,zkey2[8]
 xor zkey3[8],al
 mov al,zkey2[12]
 xor zkey3[12],al
 ;-----------------henna hamove gove zkey
 mov al,zkey3[0] 
 mov zkey[3],al  
 mov al,zKey3[4] 
 mov zkey[02bh],al
 mov al,zKey3[8] 
 mov zkey[053h],al
 mov al,zKey3[12] 
 mov zkey[07bh],al 
 ; hena 3amlenha manually w baloop 10 timessssss                  
 ;-------------------------------------------------------------------------------------------------------
 ;------------------------------------------------------------------------------------------------------- henna habda2 a3mel elloop beta3yy 3al zkey matrix 
  
 ; awel 7aga ha3mleha eni harotate elcolumn ela5eer ;  
 ARABNANE5ALAS PROC
 xor si,si  
 xor di,di 
 inc di   
 root:   
 ; hena ba3mel rotate l zkey 4 w asaive fee awel step 
 cmp si,03ch
 jz yalabesalama 
 mov al,zkey[si+3] 
 mov zkey4[12],al  
 mov al,zkey[si+02bh] 
 mov zkey4[0],al
 mov al,zkey[si+053h] 
 mov zkey4[4],al
 mov al,zkey[si+07bh] 
 mov zkey4[8],al 

   ;------------ hena hageblo subbytes 
   ;shiftingrows22 proc 
 mov bl,zkey4[0]
 mov cl,sbox[bx] 
 mov zkey4[0],cl
 mov bl,zkey4[4]
 mov cl,sbox[bx] 
 mov zkey4[4],cl
 mov bl,zkey4[8]
 mov cl,sbox[bx] 
 mov zkey4[8],cl
 mov bl,zkey4[12]
 mov cl,sbox[bx] 
 mov zkey4[12],cl
  
;;  ;-------------- henna habda2 aextract awel col mel matrix   
mov al,zkey[si] 
mov zkey2[0],al  
mov al,zkey[si+028h] 
mov zkey2[4],al
mov al,zKey[si+050h] 
mov zkey2[8],al
mov al,zKey[si+078h] 
mov zkey2[12],al   
xor al,al
xor bl,bl
 
 mov al,zkey2[0]
 xor zkey4[0],al
 mov al,zkey2[4]
 xor zkey4[4],al
 mov al,zkey2[8]
 xor zkey4[8],al
 mov al,zkey2[12]
 xor zkey4[12],al 
 mov bl , rcon[di]
 xor zkey4[0],bl      
 
 mov al,zkey4[0] 
 mov zkey[si+004h],al  
 mov al,zKey4[4] 
 mov zkey[si+02ch],al
 mov al,zKey4[8] 
 mov zkey[si+054h],al
 mov al,zKey4[12] 
 mov zkey[si+07ch],al 
 inc si 
 inc di 

  xor cl,cl      
 
maryam:
cmp cl,03h
jz yalabesalama 
mov al,zkey[si] 
mov zkey2[0],al  
mov al,zkey[si+028h] 
mov zkey2[4],al
mov al,zKey[si+050h] 
mov zkey2[8],al
mov al,zKey[si+078h] 
mov zkey2[12],al   
 
; hena ha3mel elxoring  
xor al,al
xor bl,bl 
 
 

mov al,zkey2[0]
 xor zkey4[0],al
 mov al,zkey2[4]
 xor zkey4[4],al
 mov al,zkey2[8]
 xor zkey4[8],al
 mov al,zkey2[12]
 xor zkey4[12],al 
       
 
 mov al,zkey4[0] 
 mov zkey[si+004h],al  
 mov al,zKey4[4] 
 mov zkey[si+02ch],al
 mov al,zKey4[8] 
 mov zkey[si+054h],al
 mov al,zKey4[12] 
 mov zkey[si+07ch],al 
 inc si
 inc cl
 jmp maryam  

  yalabesalama: 
      cmp di,0ah
      jz salamee 
      jmp root  

   salamee: endp     
 ;**** 
 ;zkeycounter   
;000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 

xor si,si
      MOV AX,@DATA        ;for moving data to data segment
      MOV DS,AX
     
      XOR BX,BX        ;initially BX value is equal to 0
      MOV CL,4      
     
     
      MOV AH,1         ;for taking input
      INT 21h
     
      
      INPUT1:                                        
          cmp si,16
          jz nadoo
          CMP AL,0DH   ;compare whether the pressed key is 'ENTER' or not
          JE LINE1     ;If it is equal to 'Enter' then stop taking first value
         
     
          CMP AL,41h   ;compare the input whether it is letter or digit.39h is the ascii value of 9
          JGE LETTER1
         
          sub AL,48   ;if it is digit then convert it's ascii value to real value by masking
          JMP SHIFT1
         
      LETTER1:          ;if it is letter then subtract 37h from it to find it's real value
          SUB AL,37H    
           cmp si,16
          jz nadoo
      SHIFT1:
          SHL BX,CL    ;shift bx 4 digit left for taking next value
          OR  BL,AL    ;making 'or' will add the current value with previous value
           cmp si,16
          jz nadoo
          INT 21h
           
         
          JMP INPUT1
         
      LINE1:
       mov pt[si],bl
        inc si
      cmp si,16
          jz nadoo
     
          LEA DX,n_line
          MOV AH,9
          INT 21h
         
          XOR DX,DX   ;set dx value zero
         
          MOV AH,1
          INT 21h  
           
            ;inc si
          jmp INPUT1
          
         
          
     nadoo: 
  
           ; di elli bet3melie elinput xored m3 elcipherkey 
     
 ;zkeycounter 
 xor AX,AX
 xor BX,BX
 xor DX,DX
 xor CX,CX
xor bp,bp  
xor di,di 
xor si,si 
mov cx,count
awel7aagaa:
mov al,CipherKey[si]
xor pt[si],al 
inc si 
cmp si,010h
 jnz awel7aagaa 
 













 
     
LOOPIEEE:
xor ax,ax
xor si,si 

subbytes proc  
start:mov bl,pt[si]

cmp si,16
jz exit  


mov cl,sbox[bx] 
mov ot[si],cl
inc si
jmp start
exit:  endp


;shifting proc
;
;xor si,si 
; 
;mov ch,test1[si]
;mov tmp,ch
;
;
;dodo:
;xor di,di
;ADD di,si
;Add di,1h
;mov bh,test1[di] 
;mov test1[si],bh
;inc si
;cmp si,3
;jz final
;jmp dodo
;final:
;mov test1[si] ,ch
;endp
;end   

Shifting proc    
    mov ch,ot[4]
    mov tmp,ch  
    mov ch,ot[5]
    mov ot[4],ch 
    mov ch,ot[6]
    mov ot[5],ch 
    mov ch,ot[7]
    mov ot[6],ch 
    mov ch,tmp 
    mov ot[7],ch 
    mov ch,ot[8]
    mov tmp,ch
    mov ch,ot[10]
    mov ot[8],ch
    mov ch,tmp
    mov ot[10],ch
    mov ch,ot[9]
    mov tmp,ch
    mov ch,ot[11]
    mov ot[9],ch
    mov ch,tmp
    mov ot[11],ch  
    mov ch,ot[12]
    mov tmp,ch
    mov ch,ot[15]
    mov ot[12],ch
    mov ch,ot[14]
    mov ot[15],ch
    mov ch,ot[13]
    mov ot[14],ch   
    mov ch,tmp
    mov ot[13],ch       
                       
endp


MixColumns proc   
      
 
;ban2el awal col gowa x
   xor bx,bx
  beginning:     
       xor di,di
       xor si,si
       add si,c
       mov bl,ot[si] 
       mov x[di],bl
       add si,4
       inc di
       mov bl,ot[si] 
       mov x[di],bl
       add si,4
       inc di
       mov bl,ot[si] 
       mov x[di],bl
       add si,4
       inc di
       mov bl,ot[si] 
       mov x[di],bl
       add si,4
       inc di   
       xor di,di   
       xor si,si   
       xor bp,bp 
       add bp,c
       
       xor ch,ch
       xor bl,bl
               ;---------------------- 
       
    galoisMethod:   
       cmp si,4 
       jz end3
       mov ch,x[si]
       mov bl,galois[di]   
      ; mov al,y[si]
       cmp bl,001h 
       jz case1
       cmp bl,002h
       jz case2
       cmp bl,003h
       jz case3
       
       
     
     
     
  case1:mov y[si],ch
         jmp end2
  

case2:
test ch,080h
jnz m
shl ch,1

mov y[si],ch
jmp end2
m: shl ch,1
xor ch,01bh
mov y[si],ch
jmp end2


case3: mov dl,x[si]

test ch,080h
jnz am
shl ch,1 
xor ch,dl
mov y[si],ch
jmp end2
am:shl ch,1 
xor ch,01bh
xor ch,dl
mov y[si],ch
jmp end2   
          
          
    end2: inc si  
          inc di 
          jmp galoisMethod        
       
     
    
end3: xor si,si 
 
 xor ax,ax
mov al,y[si]
l:inc si            ; elmethod elli bet3mel addition w summation 
   cmp si,4
jz to
xor al,y[si]
jmp l

to: xor si,si           ;el7etta elli betgeeb elfinal value 

mov sf[bp],al  
  add bp,4 
  jmp finallee 
  
finallee:    
             xor si,si 
             cmp di,010h 
             jz bye 
             jnz galoisMethod 
 
 
 
 
 
 
 
 bye : inc c 
       cmp c,04h 
       jz endzizo
       jnz beginning 
      endzizo:
      sub c,04h  
      endp
 
     
 
 Roundkey proc
            xor si,si
             xor ah,ah 
             
             
 endzizo2:   mov ah,key[si]  
          
             cmp si,16        
             jz endnado  
        
        xor ah,sf[si] 
        mov final[si],ah
          inc si
          jmp endzizo2    
          

  endnado:
 endp
  
  
  
  
  
keyschedule proc  
shiftrows :mov bl,pt[si]

cmp si,16
jz exit2  


mov cl,sbox[bx] 
mov ot[si],cl
inc si
jmp start
exit2:  endp        
;////////////////////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

xor al,al 
xor si,si
xor di,di
  

methodie:
 
xor bp,bp
mov bp,zkeycounter


mov al,zkey[si+bp]
mov zkey3[si],al
mov al,zkey[si+bp+028h]
mov zkey3[si+4],al
mov al,zkey[si+bp+050h]
mov zkey3[si+8],al
mov al,zkey[si+bp+078h]
mov zkey3[si+12],al  
inc si 
jmp testie
testie:
      cmp si,4 
      jnz methodie
      jz baybayee
baybayee:   
xor al,al 
xor si,si 
methodie2:
mov al,sf[si]  
mov fn[si],al
inc si 
jmp testie2
testie2:
      cmp si,010h 
      jnz methodie2
      jz baybayee2
baybayee2: 
xor al,al 
xor si,si 
methodie3:
mov al ,zkey3[si]
xor fn[si],al
inc si
jmp testie3
testie3:
      cmp si,010h
      jnz methodie3
      jz baybayee3
baybayee3: 
xor al,al 
xor si,si 
methodie4:
mov al,fn[si]  
mov pt[si],al
inc si 
jmp testie4
testie4:
      cmp si,010h 
      jnz methodie4
      jz baybayee4
baybayee4:  
        ; xor di,di 
;          
;          
;          
;         
;          dec cx 
;          add zkeycounter,004h 
;         
;          cmp cx,0
;          jnz LOOPIEEE 
;          jmp el7     
;           
;el7: hlt    
mov cx,count
dec cx
mov count,cx 
          add zkeycounter,004h 
         
          cmp cx,0
          jnz LOOPIEEE 
          jmp el7     
           
el7: xor ax,ax
xor si,si 

subbytes21 proc  
start21:mov bl,pt[si]

cmp si,16
jz exit21  


mov cl,sbox[bx] 
mov ot[si],cl
inc si
jmp start21
exit21:  endp 
Shifting21 proc    
    mov ch,ot[4]
    mov tmp,ch  
    mov ch,ot[5]
    mov ot[4],ch 
    mov ch,ot[6]
    mov ot[5],ch 
    mov ch,ot[7]
    mov ot[6],ch 
    mov ch,tmp 
    mov ot[7],ch 
    mov ch,ot[8]
    mov tmp,ch
    mov ch,ot[10]
    mov ot[8],ch
    mov ch,tmp
    mov ot[10],ch
    mov ch,ot[9]
    mov tmp,ch
    mov ch,ot[11]
    mov ot[9],ch
    mov ch,tmp
    mov ot[11],ch  
    mov ch,ot[12]
    mov tmp,ch
    mov ch,ot[15]
    mov ot[12],ch
    mov ch,ot[14]
    mov ot[15],ch
    mov ch,ot[13]
    mov ot[14],ch   
    mov ch,tmp
    mov ot[13],ch       
                       
endp 
methodie21:
;xor bp,bp
;mov bp,zkeycounter


mov al,zkey[024h]
mov zkey3[0],al
mov al,zkey[024h+028h]
mov zkey3[4],al
mov al,zkey[024h+050h]
mov zkey3[8],al
mov al,zkey[024h+078h]
mov zkey3[12],al
mov al,zkey[025h]
mov zkey3[1],al
mov al,zkey[025h+028h]
mov zkey3[5],al
mov al,zkey[025h+050h]
mov zkey3[9],al
mov al,zkey[025h+078h]
mov zkey3[13],al  
mov al,zkey[026h]
mov zkey3[2],al
mov al,zkey[026h+028h]
mov zkey3[6],al
mov al,zkey[026h+050h]
mov zkey3[10],al
mov al,zkey[026h+078h]
mov zkey3[14],al  
mov al,zkey[027h]
mov zkey3[3],al
mov al,zkey[027h+028h]
mov zkey3[7],al
mov al,zkey[027h+050h]
mov zkey3[11],al
mov al,zkey[027h+078h]
mov zkey3[15],al    

baybayee21:   
xor al,al 
xor si,si 
methodie221:
mov al,ot[si]  
mov fn[si],al
inc si 
jmp testie221
testie221:
      cmp si,010h 
      jnz methodie221
      jz baybayee221
baybayee221: 
xor al,al 
xor si,si 
methodie321:
mov al ,zkey3[si]
xor fn[si],al
inc si
jmp testie321
testie321:
      cmp si,010h
      jnz methodie321
      jz baybayee321
baybayee321: 
xor al,al 
xor si,si 
methodie421:
mov al,fn[si]  
mov pt[si],al
inc si 
jmp testie421
testie421:
      cmp si,010h 
      jnz methodie421
      jz finnisheetooo
finnisheetooo:  
 xor bl,bl
 xor cl,cl
 xor dl,dl
 xor si,si
 xor ah,ah

output1:
;mov dl,0Ah
;int 21h
;mov dl,0Dh
;int 21h
 
LEA DX,n_line
          MOV AH,9
         INT 21h
         
mov bl,pt[si]
mov cl, bl
mov ch,bl  

and cl,0fh
and ch ,0f0h    
shr ch,4
CMP cl,09h
jg letter
jmp number
: ;hena 3aiza atest lw el7ara 7arf wala num ;; lw num
 
letter:
add cl,37h
cmp ch,09h
jg letter2
jmp number2
letter2:
add ch,37h
jmp r
number:add cl,48
cmp ch,09h
jg letter2
jmp number2    
     
 number2:
 add ch,48    
           
 
 
r:
mov ah,02h
mov dl,ch
int 21h
mov ah,02h
mov dl,cl
int 21h
inc si  
cmp si,010h
jnz output1 
jmp ziadmaryamnadine
;hena 3aiza atest lw el7ara 7arf wala num ;; lw num




   
;mov dl,0Ah
;int 21h
;mov dl,0Dh
;int 21h    
;inc si  


ziadmaryamnadine:
 ; RET
        
    ENDP
  ; END MAIN

;     =====================================================================      