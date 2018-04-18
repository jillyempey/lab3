    .syntax unified
    .text

    @ Main file for Lab 3
    @ Jillian Empey

    .arch armv7a
    .fpu vfp 
done:
      ldr r0, =ex
      bl printf
      b quit
    @ --------------------------------
    .global main
main:
    @ driver function main lives here, modify this for your other functions
      mov r0, #1
      mov r1, #2
      bl intadd
      cmp r0, #3
      beq done
      ldr r0, =fail
      bl printf
    @ You'll need to scan characters for the operation and to determine
    @ if the program should repeat.
    @ To scan a character, and compare it to another, do the following
 /*     ldr     r0, =scanchar
      mov     r1, sp          @ Save stack pointer to r1, you must create space
      bl      scanf           @ Scan user's answer
      ldr     r1, =yes        @ Put address of 'y' in r1
      ldrb    r1, [r1]        @ Load the actual character 'y' into r1
      ldrb    r0, [sp]        @ Put the user's value in r0
      cmp     r0, r1          @ Compare user's answer to char 'y'
      b       loop   */         @ branch to appropriate location
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
pn1:
    .asciz  "Enter Number 1: %d\n"
pn2:
    .asciz  "Enter Number 2: %d\n"
po:
    .asciz  "Enter Operation: %c\n"
pagain:
    .asciz  "Again? %c\n"
pres:
    .asciz  "Result is: %d"
pinvalid:
    .asciz  "Invalid Operation Entered.\n"


