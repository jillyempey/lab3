   .syntax unified

   @ Addition
   @ Jillian Empey

   .arch armv7a
   .fpu vfp
   @ ----------------------------
   .global intadd
intadd:
   /* R0: number 1
      R1: number 2
    */ 
   push {r2, lr}
   mov r2, r0 // copy r2
   
   add r0, r0, r1


/*   eor r0, r0, r1
   and r1, r1, r2
   orr r0, r0, r1*/
   pop {r2, pc}
