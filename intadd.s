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
      R2: Cin
      R3: Cout
      R4: returnvar
      R5: clearbit for isolating bits
      R6: blank
      R7: total 
    */ 
   push {r2, r3, r4, r5, r6, r7, lr}

   push {r0, r1}  // save num1 and num2
   

   mov r2, #0 // initialize cin to 0
   mov r3, #0 // initialize cout to 0
   mov r5, #1 // initialize clearbit to 1
   mov   r7, #0
loop: 
   ldr   r0, [sp, #4]
   ldr   r1, [sp, #0]
   // isolate bit i to work with
   and r0, r0, r5
   and r1, r1, r5
   // sumi = a xor b xor cin 
   eor   r4, r0, r1
   eor   r4, r4, r2
   //calc cout
   and   r3, r0, r1 //a and b
   push  {r3}
   and   r6, r1, r2 //b and c
   and   r3, r0, r2 //a and c
   orr   r3, r3, r6
   pop   {r6}
   orr   r3, r3, r6 // carryout now in r3
   mov   r2, r3      //carryout->carry in
   orr   r7, r4, r7  //set new bit
   lsl   r5, #1       //shift clearbit to left
   lsl   r2, #1      // shift carry 
   cmp   r5, #0   //if clearbit is 0, then overflow has happened/we are done
   bne   loop
done: 
   mov   r0, r7
   add   sp, sp, #8
   pop {r2, r3, r4, r5, r6, r7, pc}
