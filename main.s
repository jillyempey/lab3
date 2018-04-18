    .syntax unified
    .text

    @ Main file for Lab 3
    @ Jillian Empey

    .arch armv7a
    .fpu vfp 
done:
      ldr   r0, =ex
      bl    printf
      b     quit
plus:
      mov   r0, #1
      mov   r1, #2     
      ldr   r0, =pres
      bl    printf
      bl    intadd
      ldr   r1, result
      str   r0, [r1, #0]
      ldr   r0, =result
      bl    printf
      b loop 
subtract:
      b     loop
multiply:
      b     loop
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
      mov   r3, r0   //number1 in r0
      //Enter Number 2:
      ldr   r0, =pn2
      bl    printf
      ldr   r0, =scannum
      mov   r1, sp
      bl    scanf
      ldrb  r0, [sp]
      mov   r1, r3
      //Enter Operation
      ldr   r0, =po
      bl    printf
      ldr   r0, =scanchar
      mov   r1, sp
      bl    scanf
      ldrb  r0, [sp]
      cmp   r0, #43 // +
      beq   plus
      cmp   r0, #45 // -
      beq   subtract
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
      ldrb  r0, [sp]
      cmp   r0, #121
      beq   loop
      b     done
    @ You'll need to scan characters for the operation and to determine
    @ if the program should repeat.
    @ To scan a character, and compare it to another, do the following
   /*   ldr     r0, =scanchar
      mov     r1, sp          @ Save stack pointer to r1, you must create space
      bl      scanf           @ Scan user's answer
      ldr     r1, =yes        @ Put address of 'y' in r1
      ldrb    r1, [r1]        @ Load the actual character 'y' into r1
      ldrb    r0, [sp]        @ Put the user's value in r0
      cmp     r0, r1          @ Compare user's answer to char 'y'
      b       loop */           @ branch to appropriate location
    @ this only works for character scans. You'll need a different
    @ format specifier for scanf for an integer ("%d"), and you'll
    @ need to use the ldr instruction instead of ldrb to load an int.
quit:
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
    .asciz  "Result is: "
pinvalid:
    .asciz  "Invalid Operation Entered.\n"
result:
    .asciz  "%d"


