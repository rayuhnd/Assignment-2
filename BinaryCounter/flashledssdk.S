@ Assembler program to flash three LEDs connected to the
@ Raspberry Pi Pico GPIO port using the Pico SDK.
@

	.EQU	LED_PIN1, 0
	.EQU	LED_PIN2, 1
	.EQU	LED_PIN3, 2
	.EQU	GPIO_OUT, 1
	.EQU	sleep_time, 1500

.thumb_func	@ Necessary because sdk uses BLX
.global main    @ Provide program starting address

main:
	MOV	R0, #LED_PIN1
	BL	gpio_init
	MOV	R0, #LED_PIN1
	MOV	R1, #GPIO_OUT
	BL	link_gpio_set_dir
	MOV	R0, #LED_PIN2
	BL	gpio_init
	MOV	R0, #LED_PIN2
	MOV	R1, #GPIO_OUT
	BL	link_gpio_set_dir
	MOV	R0, #LED_PIN3
	BL	gpio_init
	MOV	R0, #LED_PIN3
	MOV	R1, #GPIO_OUT
	BL	link_gpio_set_dir
	
loop:   
	@ COUNT UP SEQUENCE (000 to 111) 
	MOV	R0, #LED_PIN1   @001
	MOV	R1, #1
	BL	link_gpio_put
	LDR	R0, =sleep_time
	BL	sleep_ms
	MOV	R0, #LED_PIN1  
	MOV	R1, #0
	BL	link_gpio_put
	MOV	R0, #LED_PIN2   @010
	MOV	R1, #1
	BL	link_gpio_put
	LDR	R0, =sleep_time
	BL	sleep_ms
	MOV	R0, #LED_PIN1   @011
	MOV	R1, #1
	BL	link_gpio_put
	LDR	R0, =sleep_time
	BL	sleep_ms
	MOV	R0, #LED_PIN1
	MOV	R1, #0
	BL	link_gpio_put
	MOV	R0, #LED_PIN2
	MOV	R1, #0
	BL	link_gpio_put
	MOV	R0, #LED_PIN3  @100
	MOV	R1, #1
	BL	link_gpio_put
	LDR	R0, =sleep_time
	BL	sleep_ms
	MOV	R0, #LED_PIN1   @101
	MOV	R1, #1
	BL	link_gpio_put
	LDR	R0, =sleep_time
	BL	sleep_ms
	MOV	R0, #LED_PIN1  
	MOV	R1, #0
	BL	link_gpio_put
	MOV	R0, #LED_PIN2   @110
	MOV	R1, #1
	BL	link_gpio_put
	LDR	R0, =sleep_time
	BL	sleep_ms
	MOV	R0, #LED_PIN1   @111
	MOV	R1, #1
	BL	link_gpio_put
	LDR	R0, =sleep_time
	BL	sleep_ms
	
	@ COUNT DOWN SEQUENCE (111 to 000) 
	MOV	R0, #LED_PIN1   @110 (turn off pin1 from 111)
	MOV	R1, #0
	BL	link_gpio_put
	LDR	R0, =sleep_time
	BL	sleep_ms
	MOV	R0, #LED_PIN1   @101 (turn on pin1, turn off pin2)
	MOV	R1, #1
	BL	link_gpio_put
	MOV	R0, #LED_PIN2
	MOV	R1, #0
	BL	link_gpio_put
	LDR	R0, =sleep_time
	BL	sleep_ms
	MOV	R0, #LED_PIN1   @100 (turn off pin1)
	MOV	R1, #0
	BL	link_gpio_put
	LDR	R0, =sleep_time
	BL	sleep_ms
	MOV	R0, #LED_PIN2   @011 (turn on pin1 and pin2, turn off pin3)
	MOV	R1, #1
	BL	link_gpio_put
	MOV	R0, #LED_PIN1
	MOV	R1, #1
	BL	link_gpio_put
	MOV	R0, #LED_PIN3
	MOV	R1, #0
	BL	link_gpio_put
	LDR	R0, =sleep_time
	BL	sleep_ms
	MOV	R0, #LED_PIN1   @010 (turn off pin1)
	MOV	R1, #0
	BL	link_gpio_put
	LDR	R0, =sleep_time
	BL	sleep_ms
	MOV	R0, #LED_PIN1   @001 (turn on pin1, turn off pin2)
	MOV	R1, #1
	BL	link_gpio_put
	MOV	R0, #LED_PIN2
	MOV	R1, #0
	BL	link_gpio_put
	LDR	R0, =sleep_time
	BL	sleep_ms
	MOV	R0, #LED_PIN1   @000 (turn off pin1)
	MOV	R1, #0
	BL	link_gpio_put
	LDR	R0, =sleep_time
	BL	sleep_ms
	B       loop
