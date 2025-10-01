@
@ Assembler program print out "Hello World"
@ using the Pico SDK.
@
@ R0 - first parameter to printf
@ R1 - second parameter to printer
@ R7 - index counter
@

.thumb_func		    @ Necessary because sdk uses BLX
.global main	            @ Provide program starting address to linker

main:
	MOV	R7, #100	@ initialize counter to 100 (CHANGED FROM 0)
	BL	stdio_init_all	@ initialize uart or usb
loop:
	LDR	R0, =helloworld	@ load address of helloworld string
	MOV	R1, R7		@ Move the counter to second parameter (MOVED UP)
	BL	printf		@ Call pico_printf
	SUB	R7, #1		@ Decrement counter (CHANGED FROM ADD)
	CMP	R7, #0 @ Check if counter reached 0 (ADDED)
	BGE	loop		@ If >= 0, continue (ADDED)	
	MOV	R7, #100	@ Reset to 100 if below 0 (ADDED)
	B	loop		@ loop forever
		
.data
	       .align  4	@ necessary alignment
helloworld: .asciz   "Hello World %d\n"

