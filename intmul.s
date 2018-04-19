   .syntax unified

   @ Multiplication
   @ Jillian Empey

   .arch armv7a
   .fpu vfp
   @ ----------------------------
   .global intmul
intmul:
   /* R0: number 1
      R1: number 2
    */ 
   push {r2, lr}
   
   mul   r0, r0, r1

   pop {r2, pc}
