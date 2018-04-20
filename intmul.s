   .syntax unified

   @ Multiplication
   @ Jillian Empey

   .arch armv7a
   .fpu vfp
   @ ----------------------------
   .global intmul
intmul:
   /* R0: multiplier
      R1: multiplicand
      R3: product
      R4: temp
    */ 
   push {r2, r3, r4, lr}
   mov   r2, #0
   mov   r3, #0
   mov   r4, #0
   cmp   r0, #0
   bge   next
   neg   r0, r0
   mov   r2, #1
next:
   cmp   r1, #0
   bge   bit1
   neg   r1, r1
   cmp   r2, #0
   blt   bit1
   mov   r2, #1
bit1:  
   and   r4, r0, #1
   cmp   r4, #0
   beq   bit2
   add   r3, r3, r1
bit2:
   lsl   r1, #1
   lsr   r0, #1
   and   r4, r0, #1
   cmp   r4, #0
   beq   bit3
   add   r3, r3, r1
bit3:
   lsl   r1, #1
   lsr   r0, #1
   and   r4, r0, #1
   cmp   r4, #0
   beq   bit4
   add   r3, r3, r1
bit4:
  lsl   r1, #1
   lsr   r0, #1
   and   r4, r0, #1
   cmp   r4, #0
   beq   bit5
   add   r3, r3, r1
bit5:
  lsl   r1, #1
   lsr   r0, #1
   and   r4, r0, #1
   cmp   r4, #0
   beq   bit6
   add   r3, r3, r1
bit6:
  lsl   r1, #1
   lsr   r0, #1
   and   r4, r0, #1
   cmp   r4, #0
   beq   bit7
   add   r3, r3, r1
bit7:
  lsl   r1, #1
   lsr   r0, #1
   and   r4, r0, #1
   cmp   r4, #0
   beq   bit8
   add   r3, r3, r1
bit8:
  lsl   r1, #1
   lsr   r0, #1
   and   r4, r0, #1
   cmp   r4, #0
   beq   bit9
   add   r3, r3, r1
bit9:   
   lsl   r1, #1
   lsr   r0, #1
   and   r4, r0, #1
   cmp   r4, #0
   beq   bit10
   add   r3, r3, r1
bit10:
   lsl   r1, #1
   lsr   r0, #1
   and   r4, r0, #1
   cmp   r4, #0
   beq   bit11
   add   r3, r3, r1
bit11:
   lsl   r1, #1
   lsr   r0, #1
   and   r4, r0, #1
   cmp   r4, #0
   beq   bit12
   add   r3, r3, r1
bit12:
   lsl   r1, #1
   lsr   r0, #1
   and   r4, r0, #1
   cmp   r4, #0
   beq   bit13
   add   r3, r3, r1
bit13:
   lsl   r1, #1
   lsr   r0, #1
   and   r4, r0, #1
   cmp   r4, #0
   beq   bit14
   add   r3, r3, r1
bit14:
   lsl   r1, #1
   lsr   r0, #1
   and   r4, r0, #1
   cmp   r4, #0
   beq   bit15
   add   r3, r3, r1
bit15:
   lsl   r1, #1
   lsr   r0, #1
   and   r4, r0, #1
   cmp   r4, #0
   beq   bit16
   add   r3, r3, r1
bit16:
   lsl   r1, #1
   lsr   r0, #1
   and   r4, r0, #1
   cmp   r4, #0
   beq   done
   add   r3, r3, r1

done:
   mov r0, r3
   cmp   r2, #1
   bne   leave
   neg   r0, r0
leave:
   pop {r2, r3, r4, pc}
