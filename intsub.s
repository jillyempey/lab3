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
   push {r2, lr}
    
   sub r0, r0, r1

   pop {r2, pc}
