    .syntax unified
    .text
    .arch armv7a
    .fpu vfp 

    @ Main file for Lab 3
    @ Jillian Empey

plus:
      mov   r0, r5
      mov   r1, r4
      bl    intadd   //call intadd
      b     result
subtract:
      mov   r0, r5
      mov   r1, r4
      bl    intsub
      b     result
multiply:
      mov   r0, r5
      mov   r1, r4
      bl    intmul
      b     result
result:
      mov   r1, r0
      ldr   r0, =pres
      bl    printf
      b     again


    @ --------------------------------
    .global main
main:
    @ driver function main lives here, modify this for your other functions
/*      mov r0, #1
      mov r1, #2
      bl intadd
      cmp r0, #3
      beq done
      ldr r0, =fail
      bl printf*/
      //Enter Number 1: 
loop:
      ldr   r0, =pn1
      bl    printf
      ldr   r0, =scannum
      mov   r1, sp
      bl    scanf
      ldrb  r0, [sp] //scanned number in r0
      mov   r5, r0   //number1 in r3
      //Enter Number 2:
      ldr   r0, =pn2
      bl    printf
      ldr   r0, =scannum
      mov   r1, sp
      bl    scanf
      ldrb  r0, [sp]
      mov   r4, r0   //number2 in r4

      //Enter Operation
      ldr   r0, =po
      bl    printf
      ldr   r0, =scanchar
      mov   r1, sp
      bl    scanf
      ldrb  r0, [sp]
      cmp   r0, #43 // +
      beq   plus
      ldrb  r0, [sp]
      cmp   r0, #45 // -
      beq   subtract 
      ldrb  r0, [sp]
      cmp   r0, #42 // *
      beq   multiply
      // Invalid Operation
      ldr   r0, =pinvalid
      bl    printf
again:
      ldr   r0, =pagain
      bl    printf
      ldr   r0, =scanchar
      mov   r1, sp
      bl    scanf
      ldr   r1, =yes
      ldrb    r1, [r1]        @ Load the actual character 'y' into r1
      ldrb    r0, [sp]        @ Put the user's value in r0
      cmp     r0, r1 
      beq   loop

end:

ex:
   .asciz   "success\n"
fail:
   .asciz   "fail\n"
yes:
    .byte   'y'
scanchar:
    .asciz  " %c"
scannum:
    .asciz  " %d"
pn1:
    .asciz  "Enter Number 1: "
pn2:
    .asciz  "Enter Number 2: "
po:
    .asciz  "Enter Operation: "
pagain:
    .asciz  "Again? "
pres:
    .asciz  "Result is: %d\n"
pinvalid:
    .asciz  "Invalid Operation Entered.\n"

result2:
    .asciz  "  "
test:
      .asciz   "test: %d\n"

