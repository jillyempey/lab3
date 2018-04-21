   .syntax unified

   @ Multiplication
   @ Jillian Empey

   .arch armv7a
   .fpu vfp
   @ ----------------------------
   .global intmul
intmul:
   /* R3: multiplier
      R1: multiplicand
      R2: negative marker 
      R0: product
      R4: temp
    */ 
   push {r1, r2, r3, r4, lr}
   mov   r2, #0
   mov   r3, r0
   mov   r0, #0
   mov   r4, #0

   cmp   r3, #0
   bge   next
   neg   r3, r3
   mov   r2, #1
next:  
   cmp   r1, #0
   bge   bit1
   neg   r1, r1
   cmp   r2, #0
   beq   neg
   mov   r2, #0
   b     bit1
neg:
   mov   r2, #1
bit1:  
   and   r4, r3, #1
   cmp   r4, #0
   beq   bit2
   bl    intadd 
bit2:
   lsl   r1, #1
   lsr   r3, #1
   and   r4, r3, #1
   cmp   r4, #0
   beq   bit3
   bl    intadd
bit3:
   lsl   r1, #1
   lsr   r3, #1
   and   r4, r3, #1
   cmp   r4, #0
   beq   bit4
   bl    intadd
bit4:
  lsl   r1, #1
   lsr   r3, #1
   and   r4, r3, #1
   cmp   r4, #0
   beq   bit5
   bl    intadd
bit5:
  lsl   r1, #1
   lsr   r3, #1
   and   r4, r3, #1
   cmp   r4, #0
   beq   bit6
   add   r0, r0, r1
bit6:
  lsl   r1, #1
   lsr   r3, #1
   and   r4, r3, #1
   cmp   r4, #0
   beq   bit7
   bl    intadd  
bit7:
  lsl   r1, #1
   lsr   r3, #1
   and   r4, r3, #1
   cmp   r4, #0
   beq   bit8
   bl    intadd  
bit8:
  lsl   r1, #1
   lsr   r3, #1
   and   r4, r3, #1
   cmp   r4, #0
   beq   bit9
   bl    intadd  
bit9:   
   lsl   r1, #1
   lsr   r3, #1
   and   r4, r3, #1
   cmp   r4, #0
   beq   bit10
   bl    intadd  
bit10:
   lsl   r1, #1
   lsr   r3, #1
   and   r4, r3, #1
   cmp   r4, #0
   beq   bit11
   bl    intadd  
bit11:
   lsl   r1, #1
   lsr   r3, #1
   and   r4, r3, #1
   cmp   r4, #0
   beq   bit12
   bl    intadd  
bit12:
   lsl   r1, #1
   lsr   r3, #1
   and   r4, r3, #1
   cmp   r4, #0
   beq   bit13
   bl    intadd  
bit13:
   lsl   r1, #1
   lsr   r3, #1
   and   r4, r3, #1
   cmp   r4, #0
   beq   bit14
   bl    intadd  
bit14:
   lsl   r1, #1
   lsr   r3, #1
   and   r4, r3, #1
   cmp   r4, #0
   beq   bit15
   bl    intadd  
bit15:
   lsl   r1, #1
   lsr   r3, #1
   and   r4, r3, #1
   cmp   r4, #0
   beq   bit16
   bl    intadd  
bit16:
   lsl   r1, #1
   lsr   r3, #1
   and   r4, r3, #1
   cmp   r4, #0
   beq   done
   bl    intadd  

done:
   cmp   r2, #1
   bne   leave
   neg   r0, r0
leave:
   pop {r1, r2, r3, r4, pc}
