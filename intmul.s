   .syntax unified

   @ Multiplication
   @ Jillian Empey

   .arch armv7a
   .fpu vfp

check1:
   cmp r0, #0
   beq zero
   blt check2
   mov pc, lr
check2:
   cmp r1 #0
   beq zero
   blt
   mov pc, lr
changeSigns:
   push {r1, lr}
   not r0, r0
   mov r1, #1
   bl intsub
   pop {r1, pc}

   @ ----------------------------
   .global intmul
intmul:
   /* R0: number 1(for add)/ acc
      R1: number 2(for add)/ number 1
      R2: i
      R3: number 1 copy
      R4: acc
      r5: negative: 0=ok, 1=change to neg
      */
   push {r2, r3, r4 lr}
   //check if one is zero
   cmp r1, #0
   beq zero
   cmp r0, #0
   beq zero
   bgt else
   cmp r1, #0
   bgt change1

else:
   
   mov r2, r1 // second number is i, the number of times we add number 1 to itself
   mov r1, r0 
   bl intadd //r0 is now acc
   //decrement i
   mov r0, r2
   mov r1, #1
   bl intsub
   // move i back to r2
   mov r2, r0
   //replace parameters for add
   mov r0, r4
   mov r1, r3
   //loop

zero:
   mov r0, #0
end:
   pop {r2, r3, r4, pc}
