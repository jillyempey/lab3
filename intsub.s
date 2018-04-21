   .syntax unified

   @ Subtraction
   @ Jillian Empey

   .arch armv7a
   .fpu vfp
   @ ----------------------------
   .global intsub
intsub:
   /* R0: number 1
      R1: number 2
    */ 
   push {r1, lr}
   
   neg   r1, r1
   bl    intadd

   pop {r1, pc}
