	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	goToL1Instructs
	.type	goToL1Instructs, %function
goToL1Instructs:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	ldr	r7, .L2
	ldr	r6, .L2+4
	str	r7, [r6, #0]
	ldr	r6, .L2+8
	mov	lr, #0
	str	lr, [r6, #0]
	ldr	r6, .L2+12
	mov	ip, #67108864
	str	lr, [r6, #0]
	mov	r5, #256
	mov	lr, #7680	@ movhi
	ldr	r4, .L2+16
	strh	r5, [ip, #0]	@ movhi
	strh	lr, [ip, #8]	@ movhi
	mov	r0, #3
	ldr	r1, .L2+20
	mov	r2, #100663296
	mov	r3, #8256
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L2+24
	add	r2, r2, #61440
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L2+28
	mov	r2, #83886080
	mov	r3, r5
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bx	lr
.L3:
	.align	2
.L2:
	.word	updateL1Instructs
	.word	state
	.word	hOff
	.word	vOff
	.word	DMANow
	.word	l1instructsTiles
	.word	l1instructsMap
	.word	l1instructsPal
	.size	goToL1Instructs, .-goToL1Instructs
	.align	2
	.global	goToLevel1
	.type	goToLevel1, %function
goToLevel1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L5
	ldr	r2, .L5+4
	stmfd	sp!, {r3, r4, r5, lr}
	str	r1, [r2, #0]
	mov	r3, #67108864
	mov	r2, #4352	@ movhi
	strh	r2, [r3, #0]	@ movhi
	mov	r2, #7680	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldr	r0, .L5+8
	ldr	r3, .L5+12
	mov	lr, pc
	bx	r3
	mov	r2, #100663296
	mov	r3, #8192
	ldr	r4, .L5+16
	mov	r5, r2
	mov	r0, #3
	ldr	r1, .L5+20
	add	r3, r3, #48
	mov	lr, pc
	bx	r4
	add	r2, r5, #61440
	mov	r0, #3
	ldr	r1, .L5+24
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	add	r2, r5, #65536
	mov	r0, #3
	ldr	r1, .L5+28
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L5+32
	add	r2, r2, #512
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L6:
	.align	2
.L5:
	.word	updateLevel1
	.word	state
	.word	level1_bgPal
	.word	loadPalette
	.word	DMANow
	.word	level1_bgTiles
	.word	level1_bgMap
	.word	spriteTiles
	.word	spritePal
	.size	goToLevel1, .-goToLevel1
	.align	2
	.global	goToLevel2
	.type	goToLevel2, %function
goToLevel2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	mov	r1, #24064	@ movhi
	mov	r3, #67108864
	ldr	ip, .L8
	strh	r1, [r3, #8]	@ movhi
	ldr	r1, .L8+4
	mov	r2, #7424
	str	ip, [r1, #0]
	add	r2, r2, #4
	mov	r1, #5888	@ movhi
	strh	r1, [r3, #0]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	ldr	r0, .L8+8
	ldr	r3, .L8+12
	mov	lr, pc
	bx	r3
	mov	r5, #100663296
	mov	r3, #5120
	ldr	r4, .L8+16
	mov	r2, r5
	mov	r0, #3
	ldr	r1, .L8+20
	add	r3, r3, #16
	mov	lr, pc
	bx	r4
	add	r2, r5, #61440
	mov	r0, #3
	ldr	r1, .L8+24
	mov	r3, #2048
	mov	lr, pc
	bx	r4
	mov	r3, #7232
	add	r2, r5, #16384
	mov	r0, #3
	ldr	r1, .L8+28
	add	r3, r3, #48
	mov	lr, pc
	bx	r4
	add	r2, r5, #59392
	mov	r0, #3
	ldr	r1, .L8+32
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	add	r2, r5, #65536
	mov	r0, #3
	ldr	r1, .L8+36
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L8+40
	add	r2, r2, #512
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	updateLevel2
	.word	state
	.word	farIslandPal
	.word	loadPalette
	.word	DMANow
	.word	farIslandTiles
	.word	farIslandMap
	.word	palmTreesTiles
	.word	palmTreesMap
	.word	spriteTiles
	.word	spritePal
	.size	goToLevel2, .-goToLevel2
	.align	2
	.global	goToLevel3
	.type	goToLevel3, %function
goToLevel3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	mov	r1, #24064	@ movhi
	mov	r3, #67108864
	ldr	ip, .L11
	strh	r1, [r3, #8]	@ movhi
	ldr	r1, .L11+4
	mov	r2, #7424
	str	ip, [r1, #0]
	add	r2, r2, #4
	mov	r1, #5888	@ movhi
	strh	r1, [r3, #0]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	ldr	r0, .L11+8
	ldr	r3, .L11+12
	mov	lr, pc
	bx	r3
	mov	r5, #100663296
	mov	r3, #5120
	ldr	r4, .L11+16
	mov	r2, r5
	mov	r0, #3
	ldr	r1, .L11+20
	add	r3, r3, #16
	mov	lr, pc
	bx	r4
	add	r2, r5, #61440
	mov	r0, #3
	ldr	r1, .L11+24
	mov	r3, #2048
	mov	lr, pc
	bx	r4
	mov	r3, #7232
	add	r2, r5, #16384
	mov	r0, #3
	ldr	r1, .L11+28
	add	r3, r3, #48
	mov	lr, pc
	bx	r4
	add	r2, r5, #59392
	mov	r0, #3
	ldr	r1, .L11+32
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	add	r2, r5, #65536
	mov	r0, #3
	ldr	r1, .L11+36
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L11+40
	add	r2, r2, #512
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L12:
	.align	2
.L11:
	.word	updateLevel3
	.word	state
	.word	farIslandPal
	.word	loadPalette
	.word	DMANow
	.word	farIslandTiles
	.word	farIslandMap
	.word	palmTreesTiles
	.word	palmTreesMap
	.word	spriteTiles
	.word	spritePal
	.size	goToLevel3, .-goToLevel3
	.align	2
	.global	goToPause1
	.type	goToPause1, %function
goToPause1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r6, .L14
	ldr	lr, .L14+4
	str	r6, [lr, #0]
	ldr	lr, .L14+8
	mov	r6, #0
	mov	ip, #67108864
	str	r6, [lr, #0]
	mov	r5, #256
	mov	lr, #24064	@ movhi
	ldr	r4, .L14+12
	strh	r5, [ip, #0]	@ movhi
	strh	lr, [ip, #8]	@ movhi
	mov	r0, #3
	ldr	r1, .L14+16
	mov	r2, #100663296
	mov	r3, #896
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L14+20
	add	r2, r2, #61440
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L14+24
	mov	r2, #83886080
	mov	r3, r5
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L15:
	.align	2
.L14:
	.word	updatePause1
	.word	state
	.word	vOff
	.word	DMANow
	.word	pauseTiles
	.word	pauseMap
	.word	pausePal
	.size	goToPause1, .-goToPause1
	.align	2
	.global	goToPause2
	.type	goToPause2, %function
goToPause2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r6, .L17
	ldr	lr, .L17+4
	str	r6, [lr, #0]
	ldr	lr, .L17+8
	mov	ip, #67108864
	mov	r5, #256
	mov	r6, #0
	strh	r5, [ip, #0]	@ movhi
	str	r6, [lr, #0]
	mov	lr, #24064	@ movhi
	ldr	r4, .L17+12
	strh	lr, [ip, #8]	@ movhi
	mov	r0, #3
	ldr	r1, .L17+16
	mov	r2, #100663296
	mov	r3, #896
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L17+20
	add	r2, r2, #61440
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L17+24
	mov	r2, #83886080
	mov	r3, r5
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	updatePause2
	.word	state
	.word	hOff
	.word	DMANow
	.word	pauseTiles
	.word	pauseMap
	.word	pausePal
	.size	goToPause2, .-goToPause2
	.align	2
	.global	goToPause3
	.type	goToPause3, %function
goToPause3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r6, .L20
	ldr	lr, .L20+4
	str	r6, [lr, #0]
	ldr	lr, .L20+8
	mov	r6, #0
	mov	ip, #67108864
	str	r6, [lr, #0]
	mov	r5, #256
	mov	lr, #24064	@ movhi
	ldr	r4, .L20+12
	strh	r5, [ip, #0]	@ movhi
	strh	lr, [ip, #8]	@ movhi
	mov	r0, #3
	ldr	r1, .L20+16
	mov	r2, #100663296
	mov	r3, #896
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L20+20
	add	r2, r2, #61440
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L20+24
	mov	r2, #83886080
	mov	r3, r5
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	updatePause3
	.word	state
	.word	hOff
	.word	DMANow
	.word	pauseTiles
	.word	pauseMap
	.word	pausePal
	.size	goToPause3, .-goToPause3
	.align	2
	.global	goToWin
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	ldr	r7, .L23
	ldr	r6, .L23+4
	str	r7, [r6, #0]
	ldr	r6, .L23+8
	mov	lr, #0
	str	lr, [r6, #0]
	ldr	r6, .L23+12
	mov	ip, #67108864
	str	lr, [r6, #0]
	mov	r5, #256
	mov	lr, #7680	@ movhi
	ldr	r4, .L23+16
	strh	r5, [ip, #0]	@ movhi
	strh	lr, [ip, #8]	@ movhi
	mov	r0, #3
	ldr	r1, .L23+20
	mov	r2, #100663296
	mov	r3, #1360
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L23+24
	add	r2, r2, #61440
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L23+28
	mov	r2, #83886080
	mov	r3, r5
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bx	lr
.L24:
	.align	2
.L23:
	.word	updateWin
	.word	state
	.word	hOff
	.word	vOff
	.word	DMANow
	.word	winTiles
	.word	winMap
	.word	winPal
	.size	goToWin, .-goToWin
	.align	2
	.global	updateFinalCutScene
	.type	updateFinalCutScene, %function
updateFinalCutScene:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L28
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L28+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxne	lr
	b	goToWin
.L29:
	.align	2
.L28:
	.word	oldButtons
	.word	buttons
	.size	updateFinalCutScene, .-updateFinalCutScene
	.align	2
	.global	init1
	.type	init1, %function
init1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, r8}
	ldr	ip, .L35
	ldr	r3, .L35+4
	mov	r0, #3
	sub	sp, sp, #84
	str	r0, [ip, #0]
	mov	ip, #20
	str	ip, [r3, #0]
	mov	ip, #120
	str	ip, [r3, #8]
	mov	ip, #15
	ldr	r1, .L35+8
	str	ip, [r3, #20]
	mov	ip, #31
	str	ip, [r3, #16]
	mov	r3, #160
	str	r3, [r1, #4]
	mvn	r3, #0
	mov	r2, #23
	str	r3, [sp, #24]
	ldr	r3, .L35+12
	mov	r6, #0
	str	r2, [sp, #20]
	str	r2, [sp, #16]
	mov	r2, #5
	str	r0, [r1, #0]
	str	r6, [sp, #0]
	str	r6, [sp, #8]
	str	r6, [sp, #4]
	str	r6, [sp, #12]
	str	r6, [sp, #28]
	str	r6, [sp, #32]
	str	r2, [r3, #0]
	ldr	r7, .L35+16
	mov	r8, sp
.L31:
	mov	r4, r8
	ldmia	r4!, {r0, r1, r2, r3}
	add	r5, r7, r6
	mov	ip, r5
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	add	r6, r6, #44
	ldmia	r4, {r0, r1, r2}
	cmp	r6, #220
	stmia	ip, {r0, r1, r2}
	bne	.L31
	mov	r3, #16
	ldr	r2, .L35+20
	str	r3, [sp, #64]
	str	r3, [sp, #60]
	mvn	r3, #0
	mov	r6, #0
	str	r3, [sp, #68]
	ldr	r3, .L35+24
	str	r6, [r2, #0]
	mov	r2, #3
	str	r6, [sp, #44]
	str	r6, [sp, #52]
	str	r6, [sp, #48]
	str	r6, [sp, #56]
	str	r6, [sp, #72]
	str	r6, [sp, #76]
	str	r2, [r3, #0]
	ldr	r7, .L35+28
	add	r8, sp, #44
.L32:
	mov	r4, r8
	ldmia	r4!, {r0, r1, r2, r3}
	add	r5, r7, r6
	mov	ip, r5
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	add	r6, r6, #36
	ldr	r3, [r4, #0]
	cmp	r6, #108
	str	r3, [ip, #0]
	bne	.L32
	ldr	r3, .L35+32
	mov	r2, #0
	str	r2, [r3, #0]
	add	sp, sp, #84
	ldmfd	sp!, {r4, r5, r6, r7, r8}
	bx	lr
.L36:
	.align	2
.L35:
	.word	playerHealth
	.word	player
	.word	health
	.word	enemy3Count
	.word	enemies3
	.word	enemy3Timer
	.word	parachuteCount
	.word	parachute
	.word	parachuteTimer
	.size	init1, .-init1
	.align	2
	.global	init3
	.type	init3, %function
init3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 136
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, r8}
	ldr	r5, .L44
	ldr	r3, .L44+4
	mov	r2, #3
	sub	sp, sp, #140
	str	r2, [r5, #0]
	mov	r5, #123
	str	r5, [r3, #0]
	mov	r5, #120
	str	r5, [r3, #8]
	mov	r5, #15
	str	r5, [r3, #20]
	mov	r5, #31
	mov	r6, #0
	ldr	r4, .L44+8
	str	r5, [r3, #16]
	mov	r5, #100
	ldr	ip, .L44+12
	str	r6, [r3, #32]
	str	r6, [r3, #36]
	str	r5, [r3, #40]
	mov	r3, #160
	ldr	r0, .L44+16
	str	r3, [r4, #4]
	mov	r3, #200
	str	r3, [ip, #4]
	mov	r3, #40
	str	r3, [r0, #4]
	ldr	r3, .L44+20
	str	r6, [r3, #0]
	mov	r3, #147
	str	r3, [sp, #92]
	mov	r3, #1
	str	r3, [sp, #120]
	ldr	r3, .L44+24
	mov	r1, #23
	str	r2, [r4, #0]
	str	r2, [ip, #0]
	str	r2, [r0, #0]
	mov	r2, #5
	str	r6, [sp, #100]
	str	r6, [sp, #96]
	str	r6, [sp, #104]
	str	r1, [sp, #112]
	str	r1, [sp, #108]
	str	r6, [sp, #132]
	str	r6, [sp, #124]
	str	r2, [r3, #0]
	ldr	r7, .L44+28
	add	r8, sp, #92
.L38:
	mov	r4, r8
	ldmia	r4!, {r0, r1, r2, r3}
	add	r5, r7, r6
	mov	ip, r5
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	add	r6, r6, #44
	ldmia	r4, {r0, r1, r2}
	cmp	r6, #220
	stmia	ip, {r0, r1, r2}
	bne	.L38
	mov	r3, #23
	ldr	r2, .L44+32
	mov	r6, #0
	str	r3, [sp, #68]
	str	r3, [sp, #64]
	mov	r3, #1
	str	r6, [r2, #0]
	str	r3, [sp, #76]
	mov	r2, #150
	ldr	r3, .L44+36
	str	r2, [sp, #48]
	mov	r2, #5
	str	r6, [sp, #56]
	str	r6, [sp, #52]
	str	r6, [sp, #60]
	str	r6, [sp, #88]
	str	r6, [sp, #80]
	str	r2, [r3, #0]
	ldr	r7, .L44+40
	add	r8, sp, #48
.L39:
	mov	r4, r8
	ldmia	r4!, {r0, r1, r2, r3}
	add	r5, r7, r6
	mov	ip, r5
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	add	r6, r6, #44
	ldmia	r4, {r0, r1, r2}
	cmp	r6, #220
	stmia	ip, {r0, r1, r2}
	bne	.L39
	mov	r3, #1
	mov	r2, #16
	ldr	r1, .L44+44
	str	r3, [sp, #4]
	str	r3, [sp, #28]
	ldr	r3, .L44+48
	mov	r6, #0
	str	r2, [sp, #24]
	str	r2, [sp, #20]
	mov	r2, #5
	str	r6, [r1, #0]
	str	r6, [sp, #12]
	str	r6, [sp, #8]
	str	r6, [sp, #16]
	str	r6, [sp, #32]
	str	r6, [sp, #44]
	str	r6, [sp, #36]
	str	r2, [r3, #0]
	ldr	r7, .L44+52
	add	r8, sp, #4
.L40:
	mov	r4, r8
	ldmia	r4!, {r0, r1, r2, r3}
	add	r5, r7, r6
	mov	ip, r5
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	add	r6, r6, #44
	ldmia	r4, {r0, r1, r2}
	cmp	r6, #220
	stmia	ip, {r0, r1, r2}
	bne	.L40
	ldr	r3, .L44+56
	mov	r2, #0
	str	r2, [r3, #0]
	add	sp, sp, #140
	ldmfd	sp!, {r4, r5, r6, r7, r8}
	bx	lr
.L45:
	.align	2
.L44:
	.word	playerHealth
	.word	player
	.word	health
	.word	stamina
	.word	enemDead
	.word	enemiesDead
	.word	enemy2Count
	.word	enemies2
	.word	enemy2Timer
	.word	enemy2FlipCount
	.word	enemies2Flip
	.word	enemy2FlipTimer
	.word	enemy4Count
	.word	enemies4
	.word	enemy4Timer
	.size	init3, .-init3
	.align	2
	.global	hideSprites
	.type	hideSprites, %function
hideSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L49
	mov	r3, #0
.L47:
	mov	r1, #512	@ movhi
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L47
	bx	lr
.L50:
	.align	2
.L49:
	.word	shadowOAM
	.size	hideSprites, .-hideSprites
	.align	2
	.global	spawnEnemy1
	.type	spawnEnemy1, %function
spawnEnemy1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	str	r4, [sp, #-4]!
	ldr	r3, .L57
	ldr	r2, .L57+4
	mov	r1, #1
.L55:
	ldr	r0, [r3, #32]
	cmp	r0, #0
	beq	.L52
	ldrb	r0, [r3, #8]	@ zero_extendqisi2
	orr	r0, r0, #-16777216
	orr	r0, r0, #16711680
	orr	r0, r0, #36864
	ldrb	ip, [r3, #0]	@ zero_extendqisi2
	strh	r0, [r2, #10]	@ movhi
	mov	r0, #4	@ movhi
	strh	ip, [r2, #8]	@ movhi
	strh	r0, [r2, #12]	@ movhi
.L53:
	add	r1, r1, #1
	cmp	r1, #6
	add	r3, r3, #44
	add	r2, r2, #8
	bne	.L55
	ldmfd	sp!, {r4}
	bx	lr
.L52:
	ldr	r0, [r3, #36]
	cmp	r0, #0
	ble	.L54
	ldrb	ip, [r3, #8]	@ zero_extendqisi2
	mvn	ip, ip, asl #17
	mvn	ip, ip, lsr #17
	ldrb	r4, [r3, #0]	@ zero_extendqisi2
	sub	r0, r0, #1
	strh	ip, [r2, #10]	@ movhi
	mov	ip, #264	@ movhi
	strh	r4, [r2, #8]	@ movhi
	strh	ip, [r2, #12]	@ movhi
	str	r0, [r3, #36]
	b	.L53
.L54:
	streq	r0, [r3, #32]
	moveq	r0, #512	@ movhi
	streqh	r0, [r2, #8]	@ movhi
	b	.L53
.L58:
	.align	2
.L57:
	.word	enemies1
	.word	shadowOAM
	.size	spawnEnemy1, .-spawnEnemy1
	.align	2
	.global	spawnEnemy1Flip
	.type	spawnEnemy1Flip, %function
spawnEnemy1Flip:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	str	r4, [sp, #-4]!
	ldr	r3, .L65
	ldr	r2, .L65+4
	add	r0, r3, #220
.L63:
	ldr	r1, [r3, #32]
	cmp	r1, #0
	beq	.L60
	ldrb	r1, [r3, #8]	@ zero_extendqisi2
	mvn	r1, r1, asl #17
	mvn	r1, r1, lsr #17
	ldrb	ip, [r3, #0]	@ zero_extendqisi2
	strh	r1, [r2, #50]	@ movhi
	mov	r1, #4	@ movhi
	strh	ip, [r2, #48]	@ movhi
	strh	r1, [r2, #52]	@ movhi
.L61:
	add	r3, r3, #44
	cmp	r3, r0
	add	r2, r2, #8
	bne	.L63
	ldmfd	sp!, {r4}
	bx	lr
.L60:
	ldr	r1, [r3, #36]
	cmp	r1, #0
	ble	.L62
	ldrb	ip, [r3, #8]	@ zero_extendqisi2
	mvn	ip, ip, asl #17
	mvn	ip, ip, lsr #17
	ldrb	r4, [r3, #0]	@ zero_extendqisi2
	sub	r1, r1, #1
	strh	ip, [r2, #50]	@ movhi
	mov	ip, #264	@ movhi
	strh	r4, [r2, #48]	@ movhi
	strh	ip, [r2, #52]	@ movhi
	str	r1, [r3, #36]
	b	.L61
.L62:
	streq	r1, [r3, #32]
	moveq	r1, #512	@ movhi
	streqh	r1, [r2, #48]	@ movhi
	b	.L61
.L66:
	.align	2
.L65:
	.word	enemies1Flip
	.word	shadowOAM
	.size	spawnEnemy1Flip, .-spawnEnemy1Flip
	.align	2
	.global	updateOAM2
	.type	updateOAM2, %function
updateOAM2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r5, .L104
	ldr	r2, [r5, #0]
	ldr	r3, [r5, #32]
	ldr	r4, .L104+4
	mvn	r2, r2, asl #17
	mvn	r2, r2, lsr #17
	cmp	r3, #0
	strh	r2, [r4, #0]	@ movhi
	beq	.L88
	cmp	r3, #1
	beq	.L89
.L70:
	bl	spawnEnemy1
	bl	spawnEnemy1Flip
	ldr	r3, .L104+8
	ldr	r3, [r3, #0]
	cmp	r3, #3
	beq	.L90
.L72:
	cmp	r3, #2
	beq	.L91
	cmp	r3, #1
	beq	.L92
	mov	r2, #999424
	add	r2, r2, #576
	cmp	r3, r2
	beq	.L93
.L73:
	ldr	r3, [r5, #40]
	cmp	r3, #100
	beq	.L94
.L76:
	cmp	r3, #75
	beq	.L95
	cmp	r3, #50
	beq	.L96
	cmp	r3, #25
	beq	.L97
	cmp	r3, #0
	beq	.L98
.L77:
	ldr	r3, .L104+12
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L99
.L81:
	cmp	r3, #1
	beq	.L100
	cmp	r3, #2
	beq	.L101
	cmp	r3, #3
	beq	.L102
	cmp	r3, #4
	beq	.L103
.L67:
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L88:
	ldr	r2, [r5, #36]
	cmp	r2, #0
	bne	.L69
	ldr	r3, [r5, #8]
	mvn	r3, r3, asl #17
	mvn	r3, r3, lsr #17
	strh	r3, [r4, #2]	@ movhi
	strh	r2, [r4, #4]	@ movhi
	bl	spawnEnemy1
	bl	spawnEnemy1Flip
	ldr	r3, .L104+8
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bne	.L72
.L90:
	ldr	r3, .L104+16
	ldmia	r3, {r2, r3}	@ phole ldm
	orr	r3, r3, #16384
	strh	r3, [r4, #98]	@ movhi
	mov	r3, #24	@ movhi
	strh	r3, [r4, #100]	@ movhi
	ldr	r3, [r5, #40]
	orr	r2, r2, #16384
	cmp	r3, #100
	strh	r2, [r4, #96]	@ movhi
	bne	.L76
.L94:
	ldr	r3, .L104+20
	ldmia	r3, {r2, r3}	@ phole ldm
	orr	r3, r3, #16384
	strh	r3, [r4, #106]	@ movhi
	mov	r3, #256	@ movhi
	strh	r3, [r4, #108]	@ movhi
	ldr	r3, .L104+12
	ldr	r3, [r3, #0]
	orr	r2, r2, #16384
	cmp	r3, #0
	strh	r2, [r4, #104]	@ movhi
	bne	.L81
.L99:
	ldr	r3, .L104+24
	mov	r2, #268	@ movhi
.L86:
	ldrh	r1, [r3, #0]
	ldrh	r3, [r3, #4]
	strh	r2, [r4, #116]	@ movhi
	strh	r1, [r4, #112]	@ movhi
	strh	r3, [r4, #114]	@ movhi
	b	.L67
.L69:
	cmp	r2, #1
	bne	.L70
	ldr	r2, [r5, #8]
	orr	r2, r2, #-16777216
	orr	r2, r2, #16711680
	orr	r2, r2, #36864
	strh	r2, [r4, #2]	@ movhi
	strh	r3, [r4, #4]	@ movhi
	b	.L70
.L91:
	ldr	r3, .L104+16
	ldr	r2, [r3, #0]
	ldrh	r3, [r3, #4]
	orr	r2, r2, #16384
	mov	r1, #28	@ movhi
	strh	r2, [r4, #96]	@ movhi
	strh	r3, [r4, #98]	@ movhi
	strh	r1, [r4, #100]	@ movhi
	b	.L73
.L95:
	ldr	r3, .L104+20
	ldmia	r3, {r2, r3}	@ phole ldm
	orr	r2, r2, #16384
	orr	r3, r3, #16384
	mov	r1, #288	@ movhi
	strh	r2, [r4, #104]	@ movhi
	strh	r3, [r4, #106]	@ movhi
	strh	r1, [r4, #108]	@ movhi
	b	.L77
.L89:
	ldr	r3, [r5, #36]
	cmp	r3, #0
	moveq	r1, #2	@ movhi
	streqh	r1, [r4, #4]	@ movhi
	beq	.L70
	cmp	r3, #1
	bne	.L70
	ldr	r3, [r5, #8]
	orr	r3, r3, #-16777216
	orr	r3, r3, #16711680
	orr	r3, r3, #36864
	mov	r2, #2	@ movhi
	strh	r3, [r4, #2]	@ movhi
	strh	r2, [r4, #4]	@ movhi
	b	.L70
.L92:
	ldr	r3, .L104+16
	ldrh	r1, [r3, #0]
	ldrh	r3, [r3, #4]
	mov	r2, #31	@ movhi
	strh	r2, [r4, #100]	@ movhi
	strh	r1, [r4, #96]	@ movhi
	strh	r3, [r4, #98]	@ movhi
	b	.L73
.L98:
	ldr	r3, .L104+20
	ldmia	r3, {r2, r3}	@ phole ldm
	orr	r2, r2, #16384
	orr	r3, r3, #16384
	mov	r1, #260	@ movhi
	strh	r2, [r4, #104]	@ movhi
	strh	r3, [r4, #106]	@ movhi
	strh	r1, [r4, #108]	@ movhi
	b	.L77
.L103:
	ldr	r3, .L104+24
	mov	r2, #272	@ movhi
	b	.L86
.L96:
	ldr	r3, .L104+20
	ldmia	r3, {r2, r3}	@ phole ldm
	orr	r2, r2, #16384
	orr	r3, r3, #16384
	strh	r2, [r4, #104]	@ movhi
	mov	r2, #320	@ movhi
	strh	r3, [r4, #106]	@ movhi
	strh	r2, [r4, #108]	@ movhi
	b	.L77
.L100:
	mov	r3, #268
	ldr	r2, .L104+24
	add	r3, r3, #1
.L87:
	ldrh	r1, [r2, #0]
	ldrh	r2, [r2, #4]
	strh	r1, [r4, #112]	@ movhi
	strh	r2, [r4, #114]	@ movhi
	strh	r3, [r4, #116]	@ movhi
	b	.L67
.L97:
	ldr	r3, .L104+20
	ldmia	r3, {r2, r3}	@ phole ldm
	orr	r3, r3, #16384
	orr	r2, r2, #16384
	strh	r3, [r4, #106]	@ movhi
	mov	r3, #352	@ movhi
	strh	r2, [r4, #104]	@ movhi
	strh	r3, [r4, #108]	@ movhi
	b	.L77
.L93:
	ldr	r3, .L104+16
	ldr	r2, [r3, #0]
	ldr	r1, [r3, #4]
	orr	r2, r2, #16384
	mvn	r3, r1, asl #18
	mvn	r3, r3, lsr #18
	strh	r2, [r4, #96]	@ movhi
	mov	r2, #56	@ movhi
	strh	r3, [r4, #98]	@ movhi
	strh	r2, [r4, #100]	@ movhi
	b	.L73
.L101:
	mov	r3, #268
	ldr	r2, .L104+24
	add	r3, r3, #2
	b	.L87
.L102:
	mov	r3, #268
	ldr	r2, .L104+24
	add	r3, r3, #3
	b	.L87
.L105:
	.align	2
.L104:
	.word	player
	.word	shadowOAM
	.word	playerHealth
	.word	enemiesDead
	.word	health
	.word	stamina
	.word	enemDead
	.size	updateOAM2, .-updateOAM2
	.align	2
	.global	spawnEnemy2
	.type	spawnEnemy2, %function
spawnEnemy2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	str	r4, [sp, #-4]!
	ldr	r3, .L112
	ldr	r2, .L112+4
	mov	r1, #1
.L110:
	ldr	r0, [r3, #32]
	cmp	r0, #0
	beq	.L107
	ldrb	r0, [r3, #8]	@ zero_extendqisi2
	orr	r0, r0, #-16777216
	orr	r0, r0, #16711680
	orr	r0, r0, #36864
	ldrb	ip, [r3, #0]	@ zero_extendqisi2
	strh	r0, [r2, #10]	@ movhi
	mov	r0, #8	@ movhi
	strh	ip, [r2, #8]	@ movhi
	strh	r0, [r2, #12]	@ movhi
.L108:
	add	r1, r1, #1
	cmp	r1, #6
	add	r3, r3, #44
	add	r2, r2, #8
	bne	.L110
	ldmfd	sp!, {r4}
	bx	lr
.L107:
	ldr	r0, [r3, #36]
	cmp	r0, #0
	ble	.L109
	ldrb	ip, [r3, #8]	@ zero_extendqisi2
	mvn	ip, ip, asl #17
	mvn	ip, ip, lsr #17
	ldrb	r4, [r3, #0]	@ zero_extendqisi2
	sub	r0, r0, #1
	strh	ip, [r2, #10]	@ movhi
	mov	ip, #264	@ movhi
	strh	r4, [r2, #8]	@ movhi
	strh	ip, [r2, #12]	@ movhi
	str	r0, [r3, #36]
	b	.L108
.L109:
	streq	r0, [r3, #32]
	moveq	r0, #512	@ movhi
	streqh	r0, [r2, #8]	@ movhi
	b	.L108
.L113:
	.align	2
.L112:
	.word	enemies2
	.word	shadowOAM
	.size	spawnEnemy2, .-spawnEnemy2
	.align	2
	.global	spawnEnemy2Flip
	.type	spawnEnemy2Flip, %function
spawnEnemy2Flip:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	str	r4, [sp, #-4]!
	ldr	r3, .L120
	ldr	r2, .L120+4
	add	r0, r3, #220
.L118:
	ldr	r1, [r3, #32]
	cmp	r1, #0
	beq	.L115
	ldrb	r1, [r3, #8]	@ zero_extendqisi2
	mvn	r1, r1, asl #17
	mvn	r1, r1, lsr #17
	ldrb	ip, [r3, #0]	@ zero_extendqisi2
	strh	r1, [r2, #50]	@ movhi
	mov	r1, #8	@ movhi
	strh	ip, [r2, #48]	@ movhi
	strh	r1, [r2, #52]	@ movhi
.L116:
	add	r3, r3, #44
	cmp	r3, r0
	add	r2, r2, #8
	bne	.L118
	ldmfd	sp!, {r4}
	bx	lr
.L115:
	ldr	r1, [r3, #36]
	cmp	r1, #0
	ble	.L117
	ldrb	ip, [r3, #8]	@ zero_extendqisi2
	mvn	ip, ip, asl #17
	mvn	ip, ip, lsr #17
	ldrb	r4, [r3, #0]	@ zero_extendqisi2
	sub	r1, r1, #1
	strh	ip, [r2, #50]	@ movhi
	mov	ip, #264	@ movhi
	strh	r4, [r2, #48]	@ movhi
	strh	ip, [r2, #52]	@ movhi
	str	r1, [r3, #36]
	b	.L116
.L117:
	streq	r1, [r3, #32]
	moveq	r1, #512	@ movhi
	streqh	r1, [r2, #48]	@ movhi
	b	.L116
.L121:
	.align	2
.L120:
	.word	enemies2Flip
	.word	shadowOAM
	.size	spawnEnemy2Flip, .-spawnEnemy2Flip
	.align	2
	.global	spawnEnemy3
	.type	spawnEnemy3, %function
spawnEnemy3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L126
	ldr	r2, .L126+4
	mov	r1, #1
.L124:
	ldr	r0, [r3, #0]
	cmp	r0, #0
	add	r1, r1, #1
	beq	.L123
	ldr	r0, [r3, #-24]
	mvn	r0, r0, asl #17
	mvn	r0, r0, lsr #17
	strh	r0, [r2, #10]	@ movhi
	ldrh	r0, [r3, #-32]
	strh	r0, [r2, #8]	@ movhi
	mov	r0, #16	@ movhi
	strh	r0, [r2, #12]	@ movhi
.L123:
	cmp	r1, #6
	add	r3, r3, #44
	add	r2, r2, #8
	bne	.L124
	bx	lr
.L127:
	.align	2
.L126:
	.word	enemies3+32
	.word	shadowOAM
	.size	spawnEnemy3, .-spawnEnemy3
	.align	2
	.global	spawnEnemy4
	.type	spawnEnemy4, %function
spawnEnemy4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L132
	ldr	r2, .L132+4
	add	r0, r3, #220
.L130:
	ldr	r1, [r3, #0]
	cmp	r1, #0
	beq	.L129
	ldr	r1, [r3, #-24]
	ldrb	ip, [r3, #-32]	@ zero_extendqisi2
	orr	r1, r1, #16384
	strh	r1, [r2, #90]	@ movhi
	mov	r1, #20	@ movhi
	strh	ip, [r2, #88]	@ movhi
	strh	r1, [r2, #92]	@ movhi
.L129:
	add	r3, r3, #44
	cmp	r3, r0
	add	r2, r2, #8
	bne	.L130
	bx	lr
.L133:
	.align	2
.L132:
	.word	enemies4+32
	.word	shadowOAM
	.size	spawnEnemy4, .-spawnEnemy4
	.align	2
	.global	updateOAM3
	.type	updateOAM3, %function
updateOAM3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r5, .L180
	ldr	r2, [r5, #0]
	ldr	r3, [r5, #32]
	ldr	r4, .L180+4
	mvn	r2, r2, asl #17
	mvn	r2, r2, lsr #17
	cmp	r3, #0
	strh	r2, [r4, #0]	@ movhi
	beq	.L160
	cmp	r3, #1
	beq	.L161
.L137:
	bl	spawnEnemy2
	bl	spawnEnemy2Flip
	bl	spawnEnemy4
	ldr	r3, .L180+8
	ldr	r3, [r3, #0]
	cmp	r3, #3
	beq	.L162
.L139:
	cmp	r3, #2
	beq	.L163
	cmp	r3, #1
	beq	.L164
	mov	r2, #999424
	add	r2, r2, #576
	cmp	r3, r2
	beq	.L165
.L140:
	ldr	r3, [r5, #40]
	cmp	r3, #100
	beq	.L166
.L143:
	cmp	r3, #75
	beq	.L167
	cmp	r3, #50
	beq	.L168
	cmp	r3, #25
	beq	.L169
	cmp	r3, #0
	beq	.L170
.L144:
	ldr	r3, .L180+12
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L171
.L148:
	cmp	r3, #1
	beq	.L172
	cmp	r3, #2
	beq	.L173
	cmp	r3, #3
	beq	.L174
	cmp	r3, #4
	beq	.L175
	cmp	r3, #5
	beq	.L176
	cmp	r3, #6
	beq	.L177
	cmp	r3, #7
	beq	.L178
	cmp	r3, #8
	beq	.L179
	cmp	r3, #9
	bne	.L134
	ldr	r2, .L180+16
	mov	r3, #276
	add	r3, r3, #1
	strh	r3, [r4, #148]	@ movhi
	ldrh	r3, [r2, #0]
	ldrh	r2, [r2, #4]
	strh	r3, [r4, #144]	@ movhi
	strh	r2, [r4, #146]	@ movhi
	b	.L134
.L160:
	ldr	r2, [r5, #36]
	cmp	r2, #0
	bne	.L136
	ldr	r3, [r5, #8]
	mvn	r3, r3, asl #17
	mvn	r3, r3, lsr #17
	strh	r3, [r4, #2]	@ movhi
	strh	r2, [r4, #4]	@ movhi
	bl	spawnEnemy2
	bl	spawnEnemy2Flip
	bl	spawnEnemy4
	ldr	r3, .L180+8
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bne	.L139
.L162:
	ldr	r3, .L180+20
	ldmia	r3, {r2, r3}	@ phole ldm
	orr	r3, r3, #16384
	strh	r3, [r4, #130]	@ movhi
	mov	r3, #24	@ movhi
	strh	r3, [r4, #132]	@ movhi
	ldr	r3, [r5, #40]
	orr	r2, r2, #16384
	cmp	r3, #100
	strh	r2, [r4, #128]	@ movhi
	bne	.L143
.L166:
	ldr	r3, .L180+24
	ldmia	r3, {r2, r3}	@ phole ldm
	orr	r3, r3, #16384
	strh	r3, [r4, #138]	@ movhi
	mov	r3, #256	@ movhi
	strh	r3, [r4, #140]	@ movhi
	ldr	r3, .L180+12
	ldr	r3, [r3, #0]
	orr	r2, r2, #16384
	cmp	r3, #0
	strh	r2, [r4, #136]	@ movhi
	bne	.L148
.L171:
	ldr	r3, .L180+16
	mov	r2, #268	@ movhi
.L158:
	ldrh	r1, [r3, #0]
	ldrh	r3, [r3, #4]
	strh	r2, [r4, #148]	@ movhi
	strh	r1, [r4, #144]	@ movhi
	strh	r3, [r4, #146]	@ movhi
.L134:
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L136:
	cmp	r2, #1
	bne	.L137
	ldr	r2, [r5, #8]
	orr	r2, r2, #-16777216
	orr	r2, r2, #16711680
	orr	r2, r2, #36864
	strh	r2, [r4, #2]	@ movhi
	strh	r3, [r4, #4]	@ movhi
	b	.L137
.L163:
	ldr	r3, .L180+20
	ldr	r2, [r3, #0]
	ldrh	r3, [r3, #4]
	orr	r2, r2, #16384
	mov	r1, #28	@ movhi
	strh	r2, [r4, #128]	@ movhi
	strh	r3, [r4, #130]	@ movhi
	strh	r1, [r4, #132]	@ movhi
	b	.L140
.L167:
	ldr	r3, .L180+24
	ldmia	r3, {r2, r3}	@ phole ldm
	orr	r2, r2, #16384
	orr	r3, r3, #16384
	mov	r1, #288	@ movhi
	strh	r2, [r4, #136]	@ movhi
	strh	r3, [r4, #138]	@ movhi
	strh	r1, [r4, #140]	@ movhi
	b	.L144
.L161:
	ldr	r3, [r5, #36]
	cmp	r3, #0
	moveq	r1, #2	@ movhi
	streqh	r1, [r4, #4]	@ movhi
	beq	.L137
	cmp	r3, #1
	bne	.L137
	ldr	r3, [r5, #8]
	orr	r3, r3, #-16777216
	orr	r3, r3, #16711680
	orr	r3, r3, #36864
	mov	r2, #2	@ movhi
	strh	r3, [r4, #2]	@ movhi
	strh	r2, [r4, #4]	@ movhi
	b	.L137
.L164:
	ldr	r3, .L180+20
	ldrh	r1, [r3, #0]
	ldrh	r3, [r3, #4]
	mov	r2, #31	@ movhi
	strh	r2, [r4, #132]	@ movhi
	strh	r1, [r4, #128]	@ movhi
	strh	r3, [r4, #130]	@ movhi
	b	.L140
.L170:
	ldr	r3, .L180+24
	ldmia	r3, {r2, r3}	@ phole ldm
	orr	r2, r2, #16384
	orr	r3, r3, #16384
	mov	r1, #260	@ movhi
	strh	r2, [r4, #136]	@ movhi
	strh	r3, [r4, #138]	@ movhi
	strh	r1, [r4, #140]	@ movhi
	b	.L144
.L168:
	ldr	r3, .L180+24
	ldmia	r3, {r2, r3}	@ phole ldm
	orr	r2, r2, #16384
	orr	r3, r3, #16384
	strh	r2, [r4, #136]	@ movhi
	mov	r2, #320	@ movhi
	strh	r3, [r4, #138]	@ movhi
	strh	r2, [r4, #140]	@ movhi
	b	.L144
.L172:
	mov	r3, #268
	ldr	r2, .L180+16
	add	r3, r3, #1
.L159:
	ldrh	r1, [r2, #0]
	ldrh	r2, [r2, #4]
	strh	r1, [r4, #144]	@ movhi
	strh	r2, [r4, #146]	@ movhi
	strh	r3, [r4, #148]	@ movhi
	b	.L134
.L165:
	ldr	r3, .L180+20
	ldr	r2, [r3, #0]
	ldr	r1, [r3, #4]
	orr	r2, r2, #16384
	mvn	r3, r1, asl #18
	mvn	r3, r3, lsr #18
	strh	r2, [r4, #128]	@ movhi
	mov	r2, #56	@ movhi
	strh	r3, [r4, #130]	@ movhi
	strh	r2, [r4, #132]	@ movhi
	b	.L140
.L169:
	ldr	r3, .L180+24
	ldmia	r3, {r2, r3}	@ phole ldm
	orr	r3, r3, #16384
	orr	r2, r2, #16384
	strh	r3, [r4, #138]	@ movhi
	mov	r3, #352	@ movhi
	strh	r2, [r4, #136]	@ movhi
	strh	r3, [r4, #140]	@ movhi
	b	.L144
.L173:
	mov	r3, #268
	ldr	r2, .L180+16
	add	r3, r3, #2
	b	.L159
.L174:
	mov	r3, #268
	ldr	r2, .L180+16
	add	r3, r3, #3
	b	.L159
.L175:
	ldr	r3, .L180+16
	mov	r2, #272	@ movhi
	b	.L158
.L176:
	mov	r3, #272
	ldr	r2, .L180+16
	add	r3, r3, #1
	b	.L159
.L177:
	mov	r3, #272
	ldr	r2, .L180+16
	add	r3, r3, #2
	b	.L159
.L178:
	mov	r3, #272
	ldr	r2, .L180+16
	add	r3, r3, #3
	b	.L159
.L179:
	ldr	r3, .L180+16
	mov	r2, #276	@ movhi
	b	.L158
.L181:
	.align	2
.L180:
	.word	player
	.word	shadowOAM
	.word	playerHealth
	.word	enemiesDead
	.word	enemDead
	.word	health
	.word	stamina
	.size	updateOAM3, .-updateOAM3
	.align	2
	.global	spawnParachute
	.type	spawnParachute, %function
spawnParachute:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L186
	ldr	r2, .L186+4
	add	r0, r3, #108
.L184:
	ldr	r1, [r3, #0]
	cmp	r1, #0
	beq	.L183
	ldr	r1, [r3, #-24]
	ldrb	ip, [r3, #-32]	@ zero_extendqisi2
	orr	r1, r1, #16384
	strh	r1, [r2, #90]	@ movhi
	mov	r1, #84	@ movhi
	strh	ip, [r2, #88]	@ movhi
	strh	r1, [r2, #92]	@ movhi
.L183:
	add	r3, r3, #36
	cmp	r3, r0
	add	r2, r2, #8
	bne	.L184
	bx	lr
.L187:
	.align	2
.L186:
	.word	parachute+32
	.word	shadowOAM
	.size	spawnParachute, .-spawnParachute
	.align	2
	.global	updateOAM1
	.type	updateOAM1, %function
updateOAM1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L199
	stmfd	sp!, {r4, lr}
	ldr	r1, [r3, #0]
	ldr	r2, [r3, #36]
	ldr	r4, .L199+4
	mvn	r1, r1, asl #17
	mvn	r1, r1, lsr #17
	cmp	r2, #0
	strh	r1, [r4, #0]	@ movhi
	bne	.L189
	ldr	r3, [r3, #8]
	orr	r3, r3, #-16777216
	orr	r3, r3, #16711680
	orr	r3, r3, #40960
	mov	r2, #22	@ movhi
	strh	r3, [r4, #2]	@ movhi
	strh	r2, [r4, #4]	@ movhi
.L190:
	bl	spawnEnemy3
	bl	spawnParachute
	ldr	r3, .L199+8
	ldr	r3, [r3, #0]
	cmp	r3, #3
	beq	.L195
.L191:
	cmp	r3, #2
	beq	.L196
	cmp	r3, #1
	beq	.L197
	mov	r2, #999424
	add	r2, r2, #576
	cmp	r3, r2
	beq	.L198
.L188:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L189:
	cmp	r2, #1
	bne	.L190
	ldr	r3, [r3, #8]
	orr	r3, r3, #-16777216
	orr	r3, r3, #16711680
	orr	r3, r3, #45056
	strh	r3, [r4, #2]	@ movhi
	mov	r3, #22	@ movhi
	strh	r3, [r4, #4]	@ movhi
	bl	spawnEnemy3
	bl	spawnParachute
	ldr	r3, .L199+8
	ldr	r3, [r3, #0]
	cmp	r3, #3
	bne	.L191
.L195:
	ldr	r3, .L199+12
	ldmia	r3, {r2, r3}	@ phole ldm
	orr	r2, r2, #16384
	orr	r3, r3, #16384
	strh	r2, [r4, #96]	@ movhi
	mov	r2, #24	@ movhi
	strh	r3, [r4, #98]	@ movhi
	strh	r2, [r4, #100]	@ movhi
	b	.L188
.L198:
	ldr	r3, .L199+12
	ldr	r1, [r3, #4]
	ldr	r2, [r3, #0]
	mvn	r3, r1, asl #18
	mvn	r3, r3, lsr #18
	orr	r2, r2, #16384
	strh	r3, [r4, #98]	@ movhi
	mov	r3, #56	@ movhi
	strh	r2, [r4, #96]	@ movhi
	strh	r3, [r4, #100]	@ movhi
	b	.L188
.L196:
	ldr	r3, .L199+12
	ldr	r2, [r3, #0]
	ldrh	r3, [r3, #4]
	orr	r2, r2, #16384
	strh	r3, [r4, #98]	@ movhi
	mov	r3, #28	@ movhi
	strh	r2, [r4, #96]	@ movhi
	strh	r3, [r4, #100]	@ movhi
	b	.L188
.L197:
	ldr	r3, .L199+12
	mov	r2, #31	@ movhi
	strh	r2, [r4, #100]	@ movhi
	ldrh	r2, [r3, #0]
	ldrh	r3, [r3, #4]
	strh	r2, [r4, #96]	@ movhi
	strh	r3, [r4, #98]	@ movhi
	b	.L188
.L200:
	.align	2
.L199:
	.word	player
	.word	shadowOAM
	.word	playerHealth
	.word	health
	.size	updateOAM1, .-updateOAM1
	.align	2
	.global	setupSounds
	.type	setupSounds, %function
setupSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mvn	r2, #1264
	mov	r3, #67108864
	sub	r2, r2, #1
	mov	r1, #128	@ movhi
	strh	r1, [r3, #132]	@ movhi
	strh	r2, [r3, #130]	@ movhi
	mov	r2, #0	@ movhi
	strh	r2, [r3, #128]	@ movhi
	bx	lr
	.size	setupSounds, .-setupSounds
	.global	__aeabi_idiv
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_ddiv
	.global	__aeabi_d2iz
	.align	2
	.global	playSoundA
	.type	playSoundA, %function
playSoundA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L203+8
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	ip, [ip, #0]
	mov	r8, r0
	mov	r5, #0
	mov	r4, #67108864
	add	ip, ip, #12
	mov	r6, r2
	add	fp, r4, #256
	add	r2, r4, #160
	mov	sl, r1
	mov	r9, r3
	mov	r1, r8
	mov	r0, #1
	mov	r3, #910163968
	str	r5, [ip, #8]
	ldr	ip, .L203+12
	mov	lr, pc
	bx	ip
	mov	r1, r6
	ldr	r3, .L203+16
	mov	r0, #16777216
	strh	r5, [fp, #2]	@ movhi
	mov	lr, pc
	bx	r3
	rsb	r3, r0, #0
	mov	r3, r3, asl #16
	ldr	r4, .L203+20
	mov	r3, r3, lsr #16
	strh	r3, [fp, #0]	@ movhi
	mov	r3, #128	@ movhi
	str	r8, [r4, #0]
	strh	r3, [fp, #2]	@ movhi
	mov	r3, #1
	ldr	r7, .L203+24
	str	r3, [r4, #12]
	str	r9, [r4, #16]
	mov	r0, sl
	str	sl, [r4, #4]
	str	r6, [r4, #8]
	mov	lr, pc
	bx	r7
	adr	r3, .L203
	ldmia	r3, {r2-r3}
	ldr	ip, .L203+28
	mov	lr, pc
	bx	ip
	mov	r8, r0
	mov	r0, r6
	mov	r9, r1
	mov	lr, pc
	bx	r7
	ldr	ip, .L203+32
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	mov	lr, pc
	bx	ip
	ldr	r3, .L203+36
	mov	lr, pc
	bx	r3
	str	r5, [r4, #28]
	str	r0, [r4, #20]
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L204:
	.align	3
.L203:
	.word	1443109011
	.word	1078844686
	.word	dma
	.word	DMANow
	.word	__aeabi_idiv
	.word	soundA
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.size	playSoundA, .-playSoundA
	.align	2
	.global	updateSplash
	.type	updateSplash, %function
updateSplash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L212
	ldr	r3, [r4, #0]
	tst	r3, #4
	beq	.L206
	ldr	r2, .L212+4
	ldr	r2, [r2, #0]
	tst	r2, #4
	beq	.L210
.L206:
	tst	r3, #8
	beq	.L205
	ldr	r3, .L212+4
	ldr	r4, [r3, #0]
	ands	r4, r4, #8
	beq	.L211
.L205:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L211:
	bl	goToLevel1
	mov	r1, #315392
	mov	r2, #11008
	mov	r3, #1
	ldr	r0, .L212+8
	add	r1, r1, #4000
	add	r2, r2, #17
	bl	playSoundA
	ldr	r3, .L212+12
.L208:
	mov	r2, #512	@ movhi
	strh	r2, [r3, r4]	@ movhi
	add	r4, r4, #8
	cmp	r4, #1024
	bne	.L208
	ldmfd	sp!, {r4, lr}
	b	init1
.L210:
	bl	goToL1Instructs
	ldr	r3, [r4, #0]
	b	.L206
.L213:
	.align	2
.L212:
	.word	oldButtons
	.word	buttons
	.word	gameSound0
	.word	shadowOAM
	.size	updateSplash, .-updateSplash
	.align	2
	.global	goToSplash
	.type	goToSplash, %function
goToSplash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r7, .L215
	ldr	r6, .L215+4
	str	r7, [r6, #0]
	ldr	r6, .L215+8
	mov	lr, #0
	str	lr, [r6, #0]
	ldr	r6, .L215+12
	mov	ip, #67108864
	str	lr, [r6, #0]
	mov	r5, #256
	mov	lr, #7680	@ movhi
	ldr	r4, .L215+16
	strh	r5, [ip, #0]	@ movhi
	strh	lr, [ip, #8]	@ movhi
	mov	r0, #3
	ldr	r1, .L215+20
	mov	r2, #100663296
	mov	r3, #6464
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L215+24
	add	r2, r2, #61440
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r0, #3
	ldr	r1, .L215+28
	mov	r2, #83886080
	mov	lr, pc
	bx	r4
	mov	r1, #495616
	add	r1, r1, #2624
	mov	r2, #11008
	ldr	r0, .L215+32
	add	r1, r1, #11
	add	r2, r2, #17
	mov	r3, #1
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	b	playSoundA
.L216:
	.align	2
.L215:
	.word	updateSplash
	.word	state
	.word	hOff
	.word	vOff
	.word	DMANow
	.word	titleScreenTiles
	.word	titleScreenMap
	.word	titleScreenPal
	.word	titleSong
	.size	goToSplash, .-goToSplash
	.align	2
	.global	updateWin
	.type	updateWin, %function
updateWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L219
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L219+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxne	lr
	b	goToSplash
.L220:
	.align	2
.L219:
	.word	oldButtons
	.word	buttons
	.size	updateWin, .-updateWin
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r2, .L225
	mov	r3, #0
.L222:
	mov	r1, #512	@ movhi
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L222
	bl	goToSplash
	mvn	r2, #1264
	mov	r5, #67108864
	sub	r2, r2, #1
	mov	r3, #128	@ movhi
	mov	r1, #0	@ movhi
	strh	r3, [r5, #132]	@ movhi
	strh	r1, [r5, #128]	@ movhi
	strh	r2, [r5, #130]	@ movhi
	add	r3, r5, #512
	ldrh	r1, [r3, #0]
	mov	r2, #50331648
	ldr	r0, .L225+4
	add	r2, r2, #28672
	orr	r1, r1, #1
	str	r0, [r2, #4092]
	strh	r1, [r3, #0]	@ movhi
	ldrh	r2, [r5, #4]
	orr	r2, r2, #8
	strh	r2, [r5, #4]	@ movhi
	mov	r2, #1	@ movhi
	ldr	r8, .L225+8
	ldr	r4, .L225+12
	ldr	r7, .L225+16
	ldr	r6, .L225+20
	strh	r2, [r3, #8]	@ movhi
.L223:
	ldr	r2, [r4, #0]
	ldr	r3, [r5, #304]
	str	r2, [r8, #0]
	str	r3, [r4, #0]
	ldr	ip, [r7, #0]
	mov	lr, pc
	bx	ip
	mov	lr, pc
	bx	r6
	b	.L223
.L226:
	.align	2
.L225:
	.word	shadowOAM
	.word	interruptHandler
	.word	oldButtons
	.word	buttons
	.word	state
	.word	waitForVblank
	.size	main, .-main
	.align	2
	.global	updateLose3
	.type	updateLose3, %function
updateLose3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L234
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L228
	ldr	r2, .L234+4
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L232
.L228:
	tst	r3, #4
	beq	.L227
	ldr	r3, .L234+4
	ldr	r4, [r3, #0]
	ands	r4, r4, #4
	beq	.L233
.L227:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L233:
	bl	goToLevel3
	mov	r1, #331776
	add	r1, r1, #312
	mov	r2, #11008
	mov	r3, #1
	ldr	r0, .L234+8
	add	r1, r1, #2
	add	r2, r2, #17
	bl	playSoundA
	ldr	r3, .L234+12
.L230:
	mov	r2, #512	@ movhi
	strh	r2, [r3, r4]	@ movhi
	add	r4, r4, #8
	cmp	r4, #1024
	bne	.L230
	ldmfd	sp!, {r4, lr}
	b	init3
.L232:
	bl	goToSplash
	ldr	r3, [r4, #0]
	b	.L228
.L235:
	.align	2
.L234:
	.word	oldButtons
	.word	buttons
	.word	gameSound
	.word	shadowOAM
	.size	updateLose3, .-updateLose3
	.align	2
	.global	updateLose1
	.type	updateLose1, %function
updateLose1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L243
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L237
	ldr	r2, .L243+4
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L241
.L237:
	tst	r3, #4
	beq	.L236
	ldr	r3, .L243+4
	ldr	r4, [r3, #0]
	ands	r4, r4, #4
	beq	.L242
.L236:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L242:
	bl	goToLevel1
	mov	r1, #315392
	mov	r2, #11008
	mov	r3, #1
	ldr	r0, .L243+8
	add	r1, r1, #4000
	add	r2, r2, #17
	bl	playSoundA
	ldr	r3, .L243+12
.L239:
	mov	r2, #512	@ movhi
	strh	r2, [r3, r4]	@ movhi
	add	r4, r4, #8
	cmp	r4, #1024
	bne	.L239
	ldmfd	sp!, {r4, lr}
	b	init1
.L241:
	bl	goToSplash
	ldr	r3, [r4, #0]
	b	.L237
.L244:
	.align	2
.L243:
	.word	oldButtons
	.word	buttons
	.word	gameSound0
	.word	shadowOAM
	.size	updateLose1, .-updateLose1
	.align	2
	.global	updateL3Instructs
	.type	updateL3Instructs, %function
updateL3Instructs:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L252
	ldr	r3, [r4, #0]
	tst	r3, #4
	beq	.L246
	ldr	r2, .L252+4
	ldr	r2, [r2, #0]
	tst	r2, #4
	beq	.L250
.L246:
	tst	r3, #8
	beq	.L245
	ldr	r3, .L252+4
	ldr	r4, [r3, #0]
	ands	r4, r4, #8
	beq	.L251
.L245:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L251:
	bl	goToLevel3
	mov	r1, #331776
	add	r1, r1, #312
	mov	r2, #11008
	mov	r3, #1
	ldr	r0, .L252+8
	add	r1, r1, #2
	add	r2, r2, #17
	bl	playSoundA
	ldr	r3, .L252+12
.L248:
	mov	r2, #512	@ movhi
	strh	r2, [r3, r4]	@ movhi
	add	r4, r4, #8
	cmp	r4, #1024
	bne	.L248
	ldmfd	sp!, {r4, lr}
	b	init3
.L250:
	bl	goToSplash
	ldr	r3, [r4, #0]
	b	.L246
.L253:
	.align	2
.L252:
	.word	oldButtons
	.word	buttons
	.word	gameSound
	.word	shadowOAM
	.size	updateL3Instructs, .-updateL3Instructs
	.align	2
	.global	updateL1Instructs
	.type	updateL1Instructs, %function
updateL1Instructs:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L261
	ldr	r3, [r4, #0]
	tst	r3, #4
	beq	.L255
	ldr	r2, .L261+4
	ldr	r2, [r2, #0]
	tst	r2, #4
	beq	.L259
.L255:
	tst	r3, #8
	beq	.L254
	ldr	r3, .L261+4
	ldr	r4, [r3, #0]
	ands	r4, r4, #8
	beq	.L260
.L254:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L260:
	bl	goToLevel1
	mov	r1, #315392
	mov	r2, #11008
	mov	r3, #1
	ldr	r0, .L261+8
	add	r1, r1, #4000
	add	r2, r2, #17
	bl	playSoundA
	ldr	r3, .L261+12
.L257:
	mov	r2, #512	@ movhi
	strh	r2, [r3, r4]	@ movhi
	add	r4, r4, #8
	cmp	r4, #1024
	bne	.L257
	ldmfd	sp!, {r4, lr}
	b	init1
.L259:
	bl	goToSplash
	ldr	r3, [r4, #0]
	b	.L255
.L262:
	.align	2
.L261:
	.word	oldButtons
	.word	buttons
	.word	gameSound0
	.word	shadowOAM
	.size	updateL1Instructs, .-updateL1Instructs
	.align	2
	.global	updatePause3
	.type	updatePause3, %function
updatePause3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L270
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L264
	ldr	r2, .L270+4
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L268
.L264:
	tst	r3, #4
	beq	.L263
	ldr	r3, .L270+4
	ldr	r4, [r3, #0]
	ands	r4, r4, #4
	beq	.L269
.L263:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L269:
	bl	goToLevel3
	mov	r1, #331776
	add	r1, r1, #312
	mov	r2, #11008
	mov	r3, #1
	ldr	r0, .L270+8
	add	r1, r1, #2
	add	r2, r2, #17
	bl	playSoundA
	ldr	r3, .L270+12
.L266:
	mov	r2, #512	@ movhi
	strh	r2, [r3, r4]	@ movhi
	add	r4, r4, #8
	cmp	r4, #1024
	bne	.L266
	ldmfd	sp!, {r4, lr}
	b	init3
.L268:
	mov	r3, #67108864
	add	r3, r3, #256
	mov	r1, #128	@ movhi
	strh	r1, [r3, #2]	@ movhi
	strh	r1, [r3, #6]	@ movhi
	ldr	r3, .L270+16
	mov	r2, #1
	str	r2, [r3, #12]
	ldr	r3, .L270+20
	str	r2, [r3, #12]
	bl	goToLevel3
	ldr	r3, [r4, #0]
	b	.L264
.L271:
	.align	2
.L270:
	.word	oldButtons
	.word	buttons
	.word	gameSound
	.word	shadowOAM
	.word	soundA
	.word	soundB
	.size	updatePause3, .-updatePause3
	.align	2
	.global	updatePause1
	.type	updatePause1, %function
updatePause1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L279
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L273
	ldr	r2, .L279+4
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L277
.L273:
	tst	r3, #4
	beq	.L272
	ldr	r3, .L279+4
	ldr	r4, [r3, #0]
	ands	r4, r4, #4
	beq	.L278
.L272:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L278:
	bl	goToLevel1
	mov	r1, #315392
	mov	r2, #11008
	mov	r3, #1
	ldr	r0, .L279+8
	add	r1, r1, #4000
	add	r2, r2, #17
	bl	playSoundA
	ldr	r3, .L279+12
.L275:
	mov	r2, #512	@ movhi
	strh	r2, [r3, r4]	@ movhi
	add	r4, r4, #8
	cmp	r4, #1024
	bne	.L275
	ldmfd	sp!, {r4, lr}
	b	init1
.L277:
	mov	r3, #67108864
	add	r3, r3, #256
	mov	r1, #128	@ movhi
	strh	r1, [r3, #2]	@ movhi
	strh	r1, [r3, #6]	@ movhi
	ldr	r3, .L279+16
	mov	r2, #1
	str	r2, [r3, #12]
	ldr	r3, .L279+20
	str	r2, [r3, #12]
	bl	goToLevel1
	ldr	r3, [r4, #0]
	b	.L273
.L280:
	.align	2
.L279:
	.word	oldButtons
	.word	buttons
	.word	gameSound0
	.word	shadowOAM
	.word	soundA
	.word	soundB
	.size	updatePause1, .-updatePause1
	.align	2
	.global	playSoundB
	.type	playSoundB, %function
playSoundB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L282+8
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	ip, [ip, #0]
	mov	r8, r0
	mov	r5, #0
	mov	r4, #67108864
	add	ip, ip, #24
	mov	r6, r2
	add	fp, r4, #256
	add	r2, r4, #164
	mov	sl, r1
	mov	r9, r3
	mov	r1, r8
	mov	r0, #2
	mov	r3, #910163968
	str	r5, [ip, #8]
	ldr	ip, .L282+12
	mov	lr, pc
	bx	ip
	mov	r1, r6
	ldr	r3, .L282+16
	mov	r0, #16777216
	strh	r5, [fp, #6]	@ movhi
	mov	lr, pc
	bx	r3
	rsb	r3, r0, #0
	mov	r3, r3, asl #16
	ldr	r4, .L282+20
	mov	r3, r3, lsr #16
	strh	r3, [fp, #4]	@ movhi
	mov	r3, #128	@ movhi
	str	r8, [r4, #0]
	strh	r3, [fp, #6]	@ movhi
	mov	r3, #1
	ldr	r7, .L282+24
	str	r3, [r4, #12]
	str	r9, [r4, #16]
	mov	r0, sl
	str	sl, [r4, #4]
	str	r6, [r4, #8]
	mov	lr, pc
	bx	r7
	adr	r3, .L282
	ldmia	r3, {r2-r3}
	ldr	ip, .L282+28
	mov	lr, pc
	bx	ip
	mov	r8, r0
	mov	r0, r6
	mov	r9, r1
	mov	lr, pc
	bx	r7
	ldr	ip, .L282+32
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	mov	lr, pc
	bx	ip
	ldr	r3, .L282+36
	mov	lr, pc
	bx	r3
	str	r5, [r4, #28]
	str	r0, [r4, #20]
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L283:
	.align	3
.L282:
	.word	1443109011
	.word	1078844686
	.word	dma
	.word	DMANow
	.word	__aeabi_idiv
	.word	soundB
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.size	playSoundB, .-playSoundB
	.align	2
	.global	interruptHandler
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	mov	r3, #67108864
	add	r3, r3, #512
	ldrh	r2, [r3, #2]
	tst	r2, #1
	mov	r2, #0	@ movhi
	strh	r2, [r3, #8]	@ movhi
	beq	.L285
	ldr	r2, .L293
	ldr	r3, [r2, #12]
	cmp	r3, #0
	beq	.L286
	ldr	r3, [r2, #28]
	ldr	r1, [r2, #20]
	add	r3, r3, #1
	cmp	r3, r1
	str	r3, [r2, #28]
	ble	.L286
	ldr	r3, [r2, #16]
	cmp	r3, #0
	bne	.L290
	ldr	r1, .L293+4
	ldr	r0, [r1, #0]
	mov	r1, #67108864
	add	r0, r0, #12
	add	r1, r1, #256
	str	r3, [r0, #8]
	str	r3, [r2, #12]
	strh	r3, [r1, #2]	@ movhi
.L286:
	ldr	r2, .L293+8
	ldr	r3, [r2, #12]
	cmp	r3, #0
	bne	.L291
.L288:
	mov	r3, #67108864
	add	r3, r3, #512
	mov	r2, #1	@ movhi
	strh	r2, [r3, #2]	@ movhi
.L285:
	mov	r3, #67108864
	add	r3, r3, #512
	mov	r2, #1	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldmfd	sp!, {r3, lr}
	bx	lr
.L291:
	ldr	r3, [r2, #28]
	ldr	r1, [r2, #20]
	add	r3, r3, #1
	cmp	r3, r1
	str	r3, [r2, #28]
	ble	.L288
	ldr	r3, [r2, #16]
	cmp	r3, #0
	bne	.L292
	ldr	r1, .L293+4
	ldr	r0, [r1, #0]
	mov	r1, #67108864
	add	r0, r0, #24
	add	r1, r1, #256
	str	r3, [r0, #8]
	str	r3, [r2, #12]
	strh	r3, [r1, #6]	@ movhi
	b	.L288
.L290:
	ldmia	r2, {r0, r1, r2}	@ phole ldm
	bl	playSoundA
	b	.L286
.L292:
	ldmia	r2, {r0, r1, r2}	@ phole ldm
	bl	playSoundB
	b	.L288
.L294:
	.align	2
.L293:
	.word	soundA
	.word	dma
	.word	soundB
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	pauseSound
	.type	pauseSound, %function
pauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
	mov	r3, #0
	add	r2, r2, #256
	strh	r3, [r2, #2]	@ movhi
	strh	r3, [r2, #6]	@ movhi
	ldr	r2, .L296
	str	r3, [r2, #12]
	ldr	r2, .L296+4
	str	r3, [r2, #12]
	bx	lr
.L297:
	.align	2
.L296:
	.word	soundA
	.word	soundB
	.size	pauseSound, .-pauseSound
	.align	2
	.global	unpauseSound
	.type	unpauseSound, %function
unpauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	add	r3, r3, #256
	mov	r1, #128
	strh	r1, [r3, #2]	@ movhi
	strh	r1, [r3, #6]	@ movhi
	ldr	r3, .L299
	mov	r2, #1
	str	r2, [r3, #12]
	ldr	r3, .L299+4
	str	r2, [r3, #12]
	bx	lr
.L300:
	.align	2
.L299:
	.word	soundA
	.word	soundB
	.size	unpauseSound, .-unpauseSound
	.align	2
	.global	stopSound
	.type	stopSound, %function
stopSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L302
	ldr	r1, [r3, #0]
	mov	r2, #67108864
	mov	r3, #0
	add	r2, r2, #256
	add	r0, r1, #12
	add	r1, r1, #24
	str	r3, [r0, #8]
	str	r3, [r1, #8]
	strh	r3, [r2, #2]	@ movhi
	strh	r3, [r2, #6]	@ movhi
	ldr	r2, .L302+4
	str	r3, [r2, #12]
	ldr	r2, .L302+8
	str	r3, [r2, #12]
	bx	lr
.L303:
	.align	2
.L302:
	.word	dma
	.word	soundA
	.word	soundB
	.size	stopSound, .-stopSound
	.align	2
	.global	goToFinalCutScene
	.type	goToFinalCutScene, %function
goToFinalCutScene:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r7, .L305
	ldr	r6, .L305+4
	str	r7, [r6, #0]
	ldr	r6, .L305+8
	mov	lr, #0
	str	lr, [r6, #0]
	ldr	r6, .L305+12
	mov	ip, #67108864
	str	lr, [r6, #0]
	mov	r5, #256
	mov	lr, #7680	@ movhi
	mov	r3, #5440
	ldr	r4, .L305+16
	strh	r5, [ip, #0]	@ movhi
	strh	lr, [ip, #8]	@ movhi
	mov	r0, #3
	ldr	r1, .L305+20
	mov	r2, #100663296
	add	r3, r3, #32
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L305+24
	add	r2, r2, #61440
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L305+28
	mov	r2, #83886080
	mov	r3, r5
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	b	stopSound
.L306:
	.align	2
.L305:
	.word	updateFinalCutScene
	.word	state
	.word	hOff
	.word	vOff
	.word	DMANow
	.word	finalCutSceneTiles
	.word	finalCutSceneMap
	.word	finalCutScenePal
	.size	goToFinalCutScene, .-goToFinalCutScene
	.align	2
	.global	goToLose3
	.type	goToLose3, %function
goToLose3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r7, .L308
	ldr	r6, .L308+4
	str	r7, [r6, #0]
	ldr	r6, .L308+8
	mov	lr, #0
	str	lr, [r6, #0]
	ldr	r6, .L308+12
	mov	ip, #67108864
	str	lr, [r6, #0]
	mov	r5, #256
	mov	lr, #7680	@ movhi
	ldr	r4, .L308+16
	strh	r5, [ip, #0]	@ movhi
	strh	lr, [ip, #8]	@ movhi
	mov	r0, #3
	ldr	r1, .L308+20
	mov	r2, #100663296
	mov	r3, #1232
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L308+24
	add	r2, r2, #61440
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L308+28
	mov	r2, #83886080
	mov	r3, r5
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	b	stopSound
.L309:
	.align	2
.L308:
	.word	updateLose3
	.word	state
	.word	hOff
	.word	vOff
	.word	DMANow
	.word	lose2_3Tiles
	.word	lose2_3Map
	.word	lose2_3Pal
	.size	goToLose3, .-goToLose3
	.align	2
	.global	enemy4PlayerCollisionCheck
	.type	enemy4PlayerCollisionCheck, %function
enemy4PlayerCollisionCheck:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r3, [r1, #32]
	cmp	r3, #0
	mov	r4, r1
	mov	r5, r0
	ldrne	r6, .L344
	bne	.L311
	ldr	r3, [r1, #36]
	cmp	r3, #0
	ldrne	r6, .L344
	beq	.L342
.L312:
	cmp	r3, #1
	bne	.L341
	ldr	r3, [r5, #32]
	cmp	r3, #0
	beq	.L341
	ldr	r3, [r5, #8]
	ldr	r1, [r5, #20]
	ldr	r2, [r4, #8]
	add	r1, r3, r1
	cmp	r1, r2
	blt	.L341
	ldr	r1, [r4, #20]
	add	r2, r2, r1
	cmp	r3, r2
	bgt	.L341
	ldr	r1, [r5, #16]
	ldr	r2, [r5, #0]
	ldr	r3, [r4, #0]
	add	r2, r1, r2
	cmp	r2, r3
	bne	.L341
	mov	r1, #6592
	mov	r2, #11008
	mov	r3, #0
	ldr	r0, .L344+4
	add	r1, r1, #40
	add	r2, r2, #17
	bl	playSoundB
	ldr	r3, [r6, #0]
	sub	r3, r3, #1
	str	r3, [r6, #0]
	ldr	r3, [r4, #32]
.L311:
	cmp	r3, #1
	beq	.L320
.L341:
	ldr	r3, [r6, #0]
.L318:
	cmp	r3, #0
	beq	.L343
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L320:
	ldr	r3, [r4, #36]
	cmp	r3, #1
	bne	.L341
	ldr	r3, [r5, #32]
	cmp	r3, #0
	beq	.L341
	ldr	r3, [r5, #8]
	ldr	r1, [r5, #20]
	ldr	r2, [r4, #8]
	add	r1, r3, r1
	cmp	r1, r2
	blt	.L341
	ldr	r1, [r4, #20]
	add	r2, r2, r1
	cmp	r3, r2
	bgt	.L341
	ldr	r1, [r5, #16]
	ldr	r2, [r5, #0]
	ldr	r3, [r4, #0]
	add	r2, r1, r2
	cmp	r2, r3
	bne	.L341
	mov	r1, #6592
	mov	r2, #11008
	mov	r3, #0
	ldr	r0, .L344+4
	add	r1, r1, #40
	add	r2, r2, #17
	bl	playSoundB
	ldr	r3, [r6, #0]
	sub	r3, r3, #1
	str	r3, [r6, #0]
	b	.L318
.L342:
	ldr	r2, [r0, #32]
	cmp	r2, #0
	beq	.L340
	ldr	r2, [r0, #8]
	ldr	r0, [r0, #20]
	ldr	r1, [r1, #8]
	add	r0, r2, r0
	cmp	r0, r1
	blt	.L340
	ldr	r0, [r4, #20]
	add	r1, r1, r0
	cmp	r2, r1
	bgt	.L340
	ldr	r0, [r5, #16]
	ldr	r1, [r5, #0]
	ldr	r2, [r4, #0]
	add	r1, r0, r1
	cmp	r1, r2
	bne	.L340
	ldr	r6, .L344
	mov	r1, #6592
	mov	r2, #11008
	add	r2, r2, #17
	ldr	r0, .L344+4
	add	r1, r1, #40
	bl	playSoundB
	ldr	r2, [r6, #0]
	ldr	r3, [r4, #32]
	sub	r2, r2, #1
	cmp	r3, #0
	str	r2, [r6, #0]
	bne	.L311
	ldr	r3, [r4, #36]
	b	.L312
.L340:
	ldr	r6, .L344
	b	.L341
.L343:
	ldmfd	sp!, {r4, r5, r6, lr}
	b	goToLose3
.L345:
	.align	2
.L344:
	.word	playerHealth
	.word	oofSound
	.size	enemy4PlayerCollisionCheck, .-enemy4PlayerCollisionCheck
	.align	2
	.global	enemy2FlipPlayerCollisionCheck
	.type	enemy2FlipPlayerCollisionCheck, %function
enemy2FlipPlayerCollisionCheck:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r5, [r1, #32]
	cmp	r5, #0
	mov	r4, r1
	mov	r6, r0
	ldrne	r8, .L386
	bne	.L347
	ldr	r7, [r1, #36]
	cmp	r7, #0
	ldrne	r8, .L386
	beq	.L378
.L348:
	cmp	r7, #1
	bne	.L354
	ldr	r3, [r6, #32]
	cmp	r3, #0
	beq	.L353
	ldr	r1, [r4, #20]
	ldr	r3, [r4, #8]
	ldr	r2, [r6, #8]
	add	r3, r1, r3
	cmp	r2, r3
	beq	.L379
.L353:
	mov	r3, #0
	str	r3, [r6, #40]
	b	.L354
.L379:
	ldr	r3, [r6, #40]
	cmp	r3, #0
	bne	.L354
	mov	r1, #6592
	mov	r2, #11008
	add	r2, r2, #17
	ldr	r0, .L386+4
	add	r1, r1, #40
	bl	playSoundB
	ldr	r3, [r8, #0]
	mvn	r2, #1
	sub	r3, r3, #1
	str	r7, [r6, #40]
	str	r2, [r6, #28]
	str	r3, [r8, #0]
	ldr	r5, [r4, #32]
.L347:
	cmp	r5, #1
	beq	.L380
.L354:
	ldr	r3, [r8, #0]
	ldr	r4, .L386+8
.L359:
	cmp	r3, #0
	beq	.L381
	ldr	r3, [r4, #0]
	cmp	r3, #10
	beq	.L382
.L346:
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L378:
	ldr	r3, [r0, #32]
	cmp	r3, #0
	beq	.L349
	ldr	r1, [r1, #20]
	ldr	r3, [r4, #8]
	ldr	r2, [r0, #8]
	add	r3, r1, r3
	cmp	r2, r3
	beq	.L383
.L349:
	mov	r3, #0
	str	r3, [r6, #40]
.L377:
	ldr	r8, .L386
	b	.L354
.L381:
	bl	goToLose3
	ldr	r3, [r4, #0]
	cmp	r3, #10
	bne	.L346
.L382:
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	b	goToFinalCutScene
.L380:
	ldr	r7, [r4, #36]
	cmp	r7, #1
	ldrne	r3, [r8, #0]
	beq	.L384
.L356:
	cmp	r7, #0
	bne	.L376
	ldr	r2, [r6, #32]
	cmp	r2, #0
	beq	.L361
	ldr	r0, [r4, #20]
	ldr	r2, [r4, #8]
	ldr	r1, [r6, #8]
	add	r2, r0, r2
	cmp	r1, r2
	beq	.L385
.L361:
	mov	r2, #0
	str	r2, [r6, #40]
.L376:
	ldr	r4, .L386+8
	b	.L359
.L384:
	ldr	r3, [r6, #32]
	cmp	r3, #0
	beq	.L357
	ldr	r1, [r4, #20]
	ldr	r3, [r4, #8]
	ldr	r2, [r6, #8]
	add	r3, r1, r3
	cmp	r2, r3
	bne	.L357
	ldr	r3, [r6, #40]
	cmp	r3, #0
	bne	.L354
	mov	r1, #6592
	mov	r2, #11008
	add	r2, r2, #17
	ldr	r0, .L386+4
	add	r1, r1, #40
	bl	playSoundB
	ldr	r2, [r4, #32]
	ldr	r3, [r8, #0]
	cmp	r2, #1
	sub	r3, r3, #1
	mvn	r2, #1
	str	r5, [r6, #40]
	str	r2, [r6, #28]
	str	r3, [r8, #0]
	ldreq	r7, [r4, #36]
	beq	.L356
	ldr	r4, .L386+8
	b	.L359
.L357:
	mov	r3, #0
	str	r3, [r6, #40]
	ldr	r4, .L386+8
	ldr	r3, [r8, #0]
	b	.L359
.L383:
	ldr	r3, [r0, #40]
	cmp	r3, #0
	bne	.L377
	ldr	r8, .L386
	mov	r1, #6592
	mov	r2, #11008
	mov	r3, r7
	add	r2, r2, #17
	ldr	r0, .L386+4
	add	r1, r1, #40
	bl	playSoundB
	ldr	r5, [r4, #32]
	ldr	r3, [r8, #0]
	mov	r2, #1
	sub	r3, r3, #1
	cmp	r5, #0
	str	r2, [r6, #40]
	mvn	r2, #1
	str	r2, [r6, #28]
	str	r3, [r8, #0]
	ldreq	r7, [r4, #36]
	beq	.L348
	b	.L347
.L385:
	ldr	r2, [r6, #40]
	cmp	r2, #0
	bne	.L376
	ldr	r4, .L386+8
	ldr	r2, [r4, #0]
	add	r2, r2, #1
	mov	r1, #20
	str	r2, [r4, #0]
	mov	r2, #1
	str	r1, [r6, #36]
	str	r7, [r6, #32]
	str	r2, [r6, #40]
	b	.L359
.L387:
	.align	2
.L386:
	.word	playerHealth
	.word	oofSound
	.word	enemiesDead
	.size	enemy2FlipPlayerCollisionCheck, .-enemy2FlipPlayerCollisionCheck
	.align	2
	.global	enemy2PlayerCollisionCheck
	.type	enemy2PlayerCollisionCheck, %function
enemy2PlayerCollisionCheck:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r5, [r1, #32]
	cmp	r5, #0
	mov	r4, r1
	mov	r6, r0
	ldrne	r8, .L424
	bne	.L389
	ldr	r7, [r1, #36]
	cmp	r7, #0
	ldrne	r8, .L424
	beq	.L420
.L390:
	cmp	r7, #1
	bne	.L396
	ldr	r3, [r6, #32]
	cmp	r3, #0
	beq	.L395
	ldr	r3, [r6, #8]
	ldr	r1, [r6, #20]
	ldr	r2, [r4, #8]
	add	r1, r3, r1
	cmp	r1, r2
	blt	.L395
	ldr	r1, [r4, #20]
	add	r2, r2, r1
	cmp	r3, r2
	bgt	.L395
	ldr	r3, [r6, #40]
	cmp	r3, #0
	bne	.L396
	mov	r1, #6592
	mov	r2, #11008
	add	r2, r2, #17
	ldr	r0, .L424+4
	add	r1, r1, #40
	bl	playSoundB
	ldr	r3, [r8, #0]
	mov	r2, #2
	sub	r3, r3, #1
	str	r7, [r6, #40]
	str	r2, [r6, #28]
	str	r3, [r8, #0]
	ldr	r5, [r4, #32]
.L389:
	cmp	r5, #1
	beq	.L421
.L396:
	ldr	r3, [r8, #0]
	ldr	r4, .L424+8
.L401:
	cmp	r3, #0
	beq	.L422
	ldr	r3, [r4, #0]
	cmp	r3, #10
	beq	.L423
.L388:
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L420:
	ldr	r3, [r0, #32]
	cmp	r3, #0
	beq	.L391
	ldr	r3, [r0, #8]
	ldr	r1, [r0, #20]
	ldr	r2, [r4, #8]
	add	r1, r3, r1
	cmp	r1, r2
	blt	.L391
	ldr	r1, [r4, #20]
	add	r2, r2, r1
	cmp	r3, r2
	bgt	.L391
	ldr	r3, [r0, #40]
	cmp	r3, #0
	bne	.L419
	ldr	r8, .L424
	mov	r1, #6592
	mov	r2, #11008
	mov	r3, r7
	add	r2, r2, #17
	ldr	r0, .L424+4
	add	r1, r1, #40
	bl	playSoundB
	ldr	r5, [r4, #32]
	ldr	r3, [r8, #0]
	mov	r2, #1
	sub	r3, r3, #1
	cmp	r5, #0
	str	r2, [r6, #40]
	mov	r2, #2
	str	r2, [r6, #28]
	str	r3, [r8, #0]
	ldreq	r7, [r4, #36]
	beq	.L390
	b	.L389
.L391:
	mov	r3, #0
	str	r3, [r6, #40]
.L419:
	ldr	r8, .L424
	b	.L396
.L422:
	bl	goToLose3
	ldr	r3, [r4, #0]
	cmp	r3, #10
	bne	.L388
.L423:
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	b	goToFinalCutScene
.L421:
	ldr	r7, [r4, #36]
	cmp	r7, #0
	ldrne	r3, [r8, #0]
	bne	.L398
	ldr	r3, [r6, #32]
	cmp	r3, #0
	beq	.L399
	ldr	r3, [r6, #8]
	ldr	r1, [r6, #20]
	ldr	r2, [r4, #8]
	add	r1, r3, r1
	cmp	r1, r2
	blt	.L399
	ldr	r1, [r4, #20]
	add	r2, r2, r1
	cmp	r3, r2
	bgt	.L399
	ldr	r3, [r6, #40]
	cmp	r3, #0
	bne	.L396
	mov	r1, #6592
	mov	r2, #11008
	add	r2, r2, #17
	ldr	r0, .L424+4
	add	r1, r1, #40
	bl	playSoundB
	ldr	r2, [r4, #32]
	ldr	r3, [r8, #0]
	cmp	r2, #1
	sub	r3, r3, #1
	mov	r2, #2
	str	r5, [r6, #40]
	str	r2, [r6, #28]
	str	r3, [r8, #0]
	ldreq	r7, [r4, #36]
	bne	.L418
.L398:
	cmp	r7, #1
	beq	.L416
.L418:
	ldr	r4, .L424+8
	b	.L401
.L416:
	ldr	r2, [r6, #32]
	cmp	r2, #0
	beq	.L403
	ldr	r2, [r6, #8]
	ldr	r0, [r6, #20]
	ldr	r1, [r4, #8]
	add	r0, r2, r0
	cmp	r0, r1
	blt	.L403
	ldr	r0, [r4, #20]
	add	r1, r1, r0
	cmp	r2, r1
	bgt	.L403
	ldr	r2, [r6, #40]
	cmp	r2, #0
	bne	.L418
	ldr	r4, .L424+8
	ldr	r1, [r4, #0]
	mov	r0, #20
	add	r1, r1, #1
	str	r0, [r6, #36]
	str	r1, [r4, #0]
	str	r2, [r6, #32]
	str	r7, [r6, #40]
	b	.L401
.L403:
	mov	r2, #0
	str	r2, [r6, #40]
	ldr	r4, .L424+8
	b	.L401
.L399:
	mov	r3, #0
	str	r3, [r6, #40]
	ldr	r4, .L424+8
	ldr	r3, [r8, #0]
	b	.L401
.L395:
	mov	r3, #0
	str	r3, [r6, #40]
	b	.L396
.L425:
	.align	2
.L424:
	.word	playerHealth
	.word	oofSound
	.word	enemiesDead
	.size	enemy2PlayerCollisionCheck, .-enemy2PlayerCollisionCheck
	.global	__aeabi_idivmod
	.align	2
	.global	update3
	.type	update3, %function
update3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	ldr	r0, .L468
	ldr	r3, .L468+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L468+8
	ldr	r2, [r3, #0]
	ldr	r4, .L468+12
	add	r2, r2, #1
	ldr	r8, .L468+16
	mov	r0, r2
	ldr	r1, [r4, #0]
	str	r2, [r3, #0]
	mov	lr, pc
	bx	r8
	cmp	r1, #0
	beq	.L427
	ldr	r6, .L468+20
	ldr	r3, [r6, #0]
	cmp	r3, #0
	ldrgt	r5, .L468+24
	ble	.L429
.L428:
	ldr	r7, .L468+28
	mov	r4, #0
.L434:
	add	sl, r4, r4, asl #2
	add	sl, r4, sl, asl #1
	add	sl, r5, sl, asl #2
	mov	r0, sl
	mov	lr, pc
	bx	r7
	mov	r0, sl
	ldr	r1, .L468
	bl	enemy2PlayerCollisionCheck
	ldr	r3, [r6, #0]
	add	r4, r4, #1
	cmp	r3, r4
	bgt	.L434
.L429:
	ldr	r3, .L468+32
	ldr	r2, [r3, #0]
	ldr	r4, .L468+36
	add	r2, r2, #1
	mov	r0, r2
	ldr	r1, [r4, #0]
	str	r2, [r3, #0]
	mov	lr, pc
	bx	r8
	cmp	r1, #0
	beq	.L435
	ldr	r6, .L468+40
	ldr	r3, [r6, #0]
	cmp	r3, #0
	ldrgt	r5, .L468+44
	ble	.L437
.L436:
	ldr	r7, .L468+48
	mov	r4, #0
.L442:
	add	sl, r4, r4, asl #2
	add	sl, r4, sl, asl #1
	add	sl, r5, sl, asl #2
	mov	r0, sl
	mov	lr, pc
	bx	r7
	mov	r0, sl
	ldr	r1, .L468
	bl	enemy2FlipPlayerCollisionCheck
	ldr	r3, [r6, #0]
	add	r4, r4, #1
	cmp	r3, r4
	bgt	.L442
.L437:
	ldr	r3, .L468+52
	ldr	r2, [r3, #0]
	ldr	r4, .L468+56
	add	r2, r2, #1
	mov	r0, r2
	ldr	r1, [r4, #0]
	str	r2, [r3, #0]
	mov	lr, pc
	bx	r8
	cmp	r1, #0
	ldrne	r6, .L468+60
	bne	.L443
	ldr	r6, .L468+60
	ldr	r3, [r6, #0]
	cmp	r3, #0
	ble	.L426
	ldr	r5, .L468+64
	ldr	r0, [r5, #32]
	cmp	r0, #0
	movne	r2, r5
	beq	.L445
.L447:
	add	r1, r1, #1
	cmp	r3, r1
	ble	.L448
	ldr	r0, [r2, #76]
	cmp	r0, #0
	add	r2, r2, #44
	mov	r0, r1
	bne	.L447
.L445:
	add	r3, r0, r0, asl #2
	add	r0, r0, r3, asl #1
	add	r7, r5, r0, asl #2
	ldr	r3, [r7, #16]
	mov	r8, #1
	rsb	r3, r3, #0
	str	r3, [r5, r0, asl #2]
	str	r8, [r7, #32]
	ldr	r3, .L468+68
	mov	lr, pc
	bx	r3
	ldr	r3, .L468+72
	smull	r2, r3, r0, r3
	mov	r2, r0, asr #31
	add	r3, r3, r0
	rsb	r3, r2, r3, asr #7
	rsb	r3, r3, r3, asl #4
	sub	r0, r0, r3, asl #4
	mov	r3, #250
	str	r0, [r7, #8]
	str	r8, [r7, #24]
	str	r3, [r4, #0]
.L443:
	ldr	r3, [r6, #0]
	cmp	r3, #0
	ldrgt	r5, .L468+64
	ble	.L426
.L448:
	ldr	r7, .L468+76
	mov	r4, #0
.L450:
	add	r8, r4, r4, asl #2
	add	r8, r4, r8, asl #1
	add	r8, r5, r8, asl #2
	mov	r0, r8
	mov	lr, pc
	bx	r7
	mov	r0, r8
	ldr	r1, .L468
	bl	enemy4PlayerCollisionCheck
	ldr	r3, [r6, #0]
	add	r4, r4, #1
	cmp	r3, r4
	bgt	.L450
.L426:
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	bx	lr
.L435:
	ldr	r6, .L468+40
	ldr	r0, [r6, #0]
	cmp	r0, #0
	ble	.L437
	ldr	r5, .L468+44
	ldr	r2, [r5, #32]
	cmp	r2, #0
	movne	r3, r5
	bne	.L440
	b	.L438
.L441:
	ldr	r2, [r3, #76]
	cmp	r2, #0
	add	r3, r3, #44
	mov	r2, r1
	beq	.L438
.L440:
	add	r1, r1, #1
	cmp	r1, r0
	blt	.L441
	b	.L436
.L427:
	ldr	r6, .L468+20
	ldr	r0, [r6, #0]
	cmp	r0, #0
	ble	.L429
	ldr	r5, .L468+24
	ldr	r2, [r5, #32]
	cmp	r2, #0
	movne	r3, r5
	bne	.L432
	b	.L430
.L433:
	ldr	r2, [r3, #76]
	cmp	r2, #0
	add	r3, r3, #44
	mov	r2, r1
	beq	.L430
.L432:
	add	r1, r1, #1
	cmp	r1, r0
	blt	.L433
	b	.L428
.L430:
	add	r3, r2, r2, asl #2
	add	r2, r2, r3, asl #1
	mov	r0, #125
	add	r3, r5, r2, asl #2
	mov	r1, #1
	str	r0, [r5, r2, asl #2]
	mvn	r2, #23
	str	r1, [r3, #32]
	str	r2, [r3, #8]
	str	r1, [r3, #28]
	mov	r3, #150
	str	r3, [r4, #0]
	b	.L428
.L438:
	add	r3, r2, r2, asl #2
	add	r2, r2, r3, asl #1
	add	r3, r5, r2, asl #2
	mov	r1, #1
	str	r1, [r3, #32]
	mov	r1, #125
	str	r1, [r5, r2, asl #2]
	mov	r2, #241
	str	r2, [r3, #8]
	mvn	r2, #0
	str	r2, [r3, #28]
	mov	r3, #200
	str	r3, [r4, #0]
	b	.L436
.L469:
	.align	2
.L468:
	.word	player
	.word	updatePlayer
	.word	enemy2Timer
	.word	timeToNxtEnemy2
	.word	__aeabi_idivmod
	.word	enemy2Count
	.word	enemies2
	.word	updateEnemy2
	.word	enemy2FlipTimer
	.word	timeToNxtEnemy2Flip
	.word	enemy2FlipCount
	.word	enemies2Flip
	.word	updateEnemy2Flip
	.word	enemy4Timer
	.word	timeToNxtEnemy4
	.word	enemy4Count
	.word	enemies4
	.word	rand
	.word	-2004318071
	.word	updateEnemy4
	.size	update3, .-update3
	.align	2
	.global	updateLevel3
	.type	updateLevel3, %function
updateLevel3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r3, .L482
	mov	lr, pc
	bx	r3
	bl	update3
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #32
	ldreq	r4, .L482+4
	ldreq	r3, [r4, #0]
	subeq	r3, r3, #1
	streq	r3, [r4, #0]
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	ldrne	r4, .L482+4
	tst	r3, #16
	ldreq	r3, [r4, #0]
	ldr	r5, .L482+8
	addeq	r3, r3, #1
	streq	r3, [r4, #0]
	ldr	r3, [r5, #0]
	tst	r3, #8
	beq	.L473
	ldr	r2, .L482+12
	ldr	r2, [r2, #0]
	ands	r2, r2, #8
	beq	.L481
.L473:
	tst	r3, #2
	beq	.L474
	ldr	r3, .L482+12
	ldr	r3, [r3, #0]
	tst	r3, #2
	moveq	r3, #999424
	ldreq	r2, .L482+16
	addeq	r3, r3, #576
	streq	r3, [r2, #0]
.L474:
	mov	r3, #67108864
	ldr	r5, [r3, #304]
	ands	r5, r5, #1
	bne	.L475
	mov	r1, #4224
	mov	r2, #11008
	add	r1, r1, #6
	add	r2, r2, #17
	mov	r3, r5
	ldr	r0, .L482+20
	bl	playSoundB
	ldr	r3, .L482+24
	ldr	r2, [r3, #40]
	cmp	r2, #0
	subgt	r2, r2, #1
	movgt	r1, #1
	strgt	r1, [r3, #32]
	strgt	r2, [r3, #40]
	strle	r5, [r3, #32]
.L477:
	ldr	r2, [r4, #0]
	add	r2, r2, r2, lsr #31
	mov	r2, r2, asl #15
	mov	r2, r2, lsr #16
	mov	r3, #67108864
	strh	r2, [r3, #16]	@ movhi
	strh	r2, [r3, #20]	@ movhi
	bl	updateOAM3
	mov	r0, #3
	ldr	r1, .L482+28
	mov	r2, #117440512
	mov	r3, #512
	ldr	ip, .L482+32
	mov	lr, pc
	bx	ip
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L475:
	ldr	r3, .L482+24
	ldr	r2, [r3, #40]
	cmp	r2, #99
	mov	r1, #0
	addle	r2, r2, #1
	str	r1, [r3, #32]
	strle	r2, [r3, #40]
	b	.L477
.L481:
	mov	r3, #67108864
	add	r3, r3, #256
	strh	r2, [r3, #2]	@ movhi
	strh	r2, [r3, #6]	@ movhi
	ldr	r3, .L482+36
	str	r2, [r3, #12]
	ldr	r3, .L482+40
	str	r2, [r3, #12]
	bl	goToPause3
	ldr	r3, [r5, #0]
	b	.L473
.L483:
	.align	2
.L482:
	.word	waitForVblank
	.word	hOff
	.word	oldButtons
	.word	buttons
	.word	playerHealth
	.word	punching
	.word	player
	.word	shadowOAM
	.word	DMANow
	.word	soundA
	.word	soundB
	.size	updateLevel3, .-updateLevel3
	.align	2
	.global	goToLose2
	.type	goToLose2, %function
goToLose2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r7, .L485
	ldr	r6, .L485+4
	str	r7, [r6, #0]
	ldr	r6, .L485+8
	mov	lr, #0
	str	lr, [r6, #0]
	ldr	r6, .L485+12
	mov	ip, #67108864
	str	lr, [r6, #0]
	mov	r5, #256
	mov	lr, #7680	@ movhi
	ldr	r4, .L485+16
	strh	r5, [ip, #0]	@ movhi
	strh	lr, [ip, #8]	@ movhi
	mov	r0, #3
	ldr	r1, .L485+20
	mov	r2, #100663296
	mov	r3, #1232
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L485+24
	add	r2, r2, #61440
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L485+28
	mov	r2, #83886080
	mov	r3, r5
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	b	stopSound
.L486:
	.align	2
.L485:
	.word	updateLose2
	.word	state
	.word	hOff
	.word	vOff
	.word	DMANow
	.word	lose2_3Tiles
	.word	lose2_3Map
	.word	lose2_3Pal
	.size	goToLose2, .-goToLose2
	.align	2
	.global	goToLose1
	.type	goToLose1, %function
goToLose1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r7, .L488
	ldr	r6, .L488+4
	str	r7, [r6, #0]
	ldr	r6, .L488+8
	mov	lr, #0
	str	lr, [r6, #0]
	ldr	r6, .L488+12
	mov	ip, #67108864
	str	lr, [r6, #0]
	mov	r5, #256
	mov	lr, #7680	@ movhi
	ldr	r4, .L488+16
	strh	r5, [ip, #0]	@ movhi
	strh	lr, [ip, #8]	@ movhi
	mov	r0, #3
	ldr	r1, .L488+20
	mov	r2, #100663296
	mov	r3, #1536
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L488+24
	add	r2, r2, #61440
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L488+28
	mov	r2, #83886080
	mov	r3, r5
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	b	stopSound
.L489:
	.align	2
.L488:
	.word	updateLose1
	.word	state
	.word	hOff
	.word	vOff
	.word	DMANow
	.word	lose1Tiles
	.word	lose1Map
	.word	lose1Pal
	.size	goToLose1, .-goToLose1
	.align	2
	.global	enemy3PlayerCollisionCheck
	.type	enemy3PlayerCollisionCheck, %function
enemy3PlayerCollisionCheck:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r3, [r1, #36]
	cmp	r3, #0
	mov	r4, r1
	mov	r5, r0
	ldrne	r6, .L523
	bne	.L491
	ldr	r1, [r0, #8]
	ldr	r2, [r0, #20]
	ldr	r0, [r4, #8]
	add	r2, r1, r2
	cmp	r2, r0
	beq	.L492
	ldr	r7, [r4, #0]
	ldr	r2, [r4, #16]
	ldr	ip, [r5, #0]
	ldr	r6, .L523
	add	r8, r7, r2
.L493:
	ldr	r3, [r4, #20]
	add	r0, r0, r3
	cmp	r0, r1
	beq	.L519
.L495:
	cmp	ip, r8
	beq	.L498
.L517:
	ldr	r3, [r4, #36]
.L491:
	cmp	r3, #1
	beq	.L501
.L518:
	ldr	r3, [r6, #0]
.L502:
	cmp	r3, #0
	beq	.L520
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L501:
	ldr	r3, [r5, #8]
	ldr	r2, [r5, #20]
	ldr	r1, [r4, #8]
	add	r2, r3, r2
	cmp	r2, r1
	beq	.L503
	ldr	ip, [r4, #0]
	ldr	r2, [r4, #16]
	ldr	r0, [r5, #0]
	add	r7, ip, r2
.L504:
	ldr	r8, [r4, #20]
	add	r1, r1, r8
	cmp	r1, r3
	beq	.L521
.L506:
	cmp	r0, r7
	bne	.L518
	ldr	r3, [r5, #8]
	ldr	r1, [r5, #20]
	ldr	r2, [r4, #8]
	add	r1, r3, r1
	cmp	r1, r2
	blt	.L518
	ldr	r1, [r4, #20]
	add	r2, r2, r1
	cmp	r3, r2
	bgt	.L518
	mov	r1, #6592
	mov	r2, #11008
	mov	r3, #0
	ldr	r0, .L523+4
	add	r1, r1, #40
	add	r2, r2, #17
	bl	playSoundB
	ldr	r3, [r6, #0]
	sub	r3, r3, #1
	str	r3, [r6, #0]
	b	.L502
.L520:
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	b	goToLose1
.L498:
	ldr	r3, [r5, #8]
	ldr	r1, [r5, #20]
	ldr	r2, [r4, #8]
	add	r1, r3, r1
	cmp	r1, r2
	blt	.L517
	ldr	r1, [r4, #20]
	add	r2, r2, r1
	cmp	r3, r2
	bgt	.L517
	mov	r1, #6592
	mov	r2, #11008
	mov	r3, #0
	ldr	r0, .L523+4
	add	r1, r1, #40
	add	r2, r2, #17
	bl	playSoundB
	ldr	r3, [r6, #0]
	sub	r3, r3, #1
	str	r3, [r6, #0]
	ldr	r3, [r4, #36]
	b	.L491
.L492:
	ldr	ip, [r5, #0]
	ldr	r2, [r5, #16]
	ldr	r7, [r4, #0]
	add	r2, ip, r2
	cmp	r2, r7
	bge	.L494
	ldr	r2, [r4, #16]
	ldr	r6, .L523
	add	r8, r7, r2
	b	.L493
.L519:
	ldr	r3, [r5, #16]
	add	r3, ip, r3
	cmp	r3, r7
	addlt	r8, r7, r2
	blt	.L495
	cmp	ip, r8
	bgt	.L517
	mov	r1, #6592
	mov	r2, #11008
	add	r2, r2, #17
	mov	r3, #0
	ldr	r0, .L523+4
	add	r1, r1, #40
	bl	playSoundB
	ldr	r2, [r6, #0]
	ldr	r3, [r4, #0]
	ldr	r8, [r4, #16]
	sub	r2, r2, #1
	str	r2, [r6, #0]
	ldr	ip, [r5, #0]
	add	r8, r8, r3
	b	.L495
.L521:
	ldr	r3, [r5, #16]
	add	r3, r0, r3
	cmp	r3, ip
	addlt	r7, ip, r2
	blt	.L506
	cmp	r0, r7
	bgt	.L518
	mov	r1, #6592
	mov	r2, #11008
	ldr	r0, .L523+4
	add	r2, r2, #17
	mov	r3, #0
	add	r1, r1, #40
	bl	playSoundB
	ldr	r2, [r6, #0]
	ldr	r3, [r4, #0]
	ldr	r7, [r4, #16]
	sub	r2, r2, #1
	str	r2, [r6, #0]
	ldr	r0, [r5, #0]
	add	r7, r7, r3
	b	.L506
.L503:
	ldr	r0, [r5, #0]
	ldr	r2, [r5, #16]
	ldr	ip, [r4, #0]
	add	r2, r0, r2
	cmp	r2, ip
	blt	.L522
	ldr	r2, [r4, #16]
	add	r7, ip, r2
	cmp	r0, r7
	bgt	.L504
	mov	r1, #6592
	mov	r2, #11008
	ldr	r0, .L523+4
	add	r1, r1, #40
	add	r2, r2, #17
	mov	r3, #0
	bl	playSoundB
	ldr	r3, [r6, #0]
	ldr	ip, [r4, #0]
	ldr	r2, [r4, #16]
	sub	r3, r3, #1
	str	r3, [r6, #0]
	ldr	r1, [r4, #8]
	ldr	r3, [r5, #8]
	ldr	r0, [r5, #0]
	add	r7, ip, r2
	b	.L504
.L494:
	ldr	r2, [r4, #16]
	add	r8, r7, r2
	cmp	ip, r8
	ldrgt	r6, .L523
	bgt	.L493
	ldr	r6, .L523
	mov	r1, #6592
	mov	r2, #11008
	ldr	r0, .L523+4
	add	r1, r1, #40
	add	r2, r2, #17
	bl	playSoundB
	ldr	r3, [r6, #0]
	ldr	r7, [r4, #0]
	ldr	r2, [r4, #16]
	sub	r3, r3, #1
	str	r3, [r6, #0]
	ldr	r1, [r5, #8]
	ldr	r0, [r4, #8]
	ldr	ip, [r5, #0]
	add	r8, r7, r2
	b	.L493
.L522:
	ldr	r2, [r4, #16]
	add	r7, ip, r2
	b	.L504
.L524:
	.align	2
.L523:
	.word	playerHealth
	.word	oofSound
	.size	enemy3PlayerCollisionCheck, .-enemy3PlayerCollisionCheck
	.align	2
	.global	goToL3Instructs
	.type	goToL3Instructs, %function
goToL3Instructs:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r7, .L526
	ldr	r6, .L526+4
	str	r7, [r6, #0]
	ldr	r6, .L526+8
	mov	lr, #0
	str	lr, [r6, #0]
	ldr	r6, .L526+12
	mov	ip, #67108864
	str	lr, [r6, #0]
	mov	r5, #256
	mov	lr, #7680	@ movhi
	mov	r3, #6592
	ldr	r4, .L526+16
	strh	r5, [ip, #0]	@ movhi
	strh	lr, [ip, #8]	@ movhi
	mov	r0, #3
	ldr	r1, .L526+20
	mov	r2, #100663296
	add	r3, r3, #48
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L526+24
	add	r2, r2, #61440
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L526+28
	mov	r2, #83886080
	mov	r3, r5
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	b	stopSound
.L527:
	.align	2
.L526:
	.word	updateL3Instructs
	.word	state
	.word	hOff
	.word	vOff
	.word	DMANow
	.word	level3_bgTiles
	.word	level3_bgMap
	.word	level3_bgPal
	.size	goToL3Instructs, .-goToL3Instructs
	.align	2
	.global	enemy1FlipPlayerCollisionCheck
	.type	enemy1FlipPlayerCollisionCheck, %function
enemy1FlipPlayerCollisionCheck:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r5, [r1, #32]
	cmp	r5, #0
	mov	r4, r1
	mov	r6, r0
	ldrne	r8, .L568
	bne	.L529
	ldr	r7, [r1, #36]
	cmp	r7, #0
	ldrne	r8, .L568
	beq	.L560
.L530:
	cmp	r7, #1
	bne	.L536
	ldr	r3, [r6, #32]
	cmp	r3, #0
	beq	.L535
	ldr	r1, [r4, #20]
	ldr	r3, [r4, #8]
	ldr	r2, [r6, #8]
	add	r3, r1, r3
	cmp	r2, r3
	beq	.L561
.L535:
	mov	r3, #0
	str	r3, [r6, #40]
	b	.L536
.L561:
	ldr	r3, [r6, #40]
	cmp	r3, #0
	bne	.L536
	mov	r1, #6592
	mov	r2, #11008
	add	r2, r2, #17
	ldr	r0, .L568+4
	add	r1, r1, #40
	bl	playSoundB
	ldr	r3, [r8, #0]
	mvn	r2, #1
	sub	r3, r3, #1
	str	r7, [r6, #40]
	str	r2, [r6, #28]
	str	r3, [r8, #0]
	ldr	r5, [r4, #32]
.L529:
	cmp	r5, #1
	beq	.L562
.L536:
	ldr	r3, [r8, #0]
	ldr	r4, .L568+8
.L541:
	cmp	r3, #0
	beq	.L563
	ldr	r3, [r4, #0]
	cmp	r3, #5
	beq	.L564
.L528:
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L560:
	ldr	r3, [r0, #32]
	cmp	r3, #0
	beq	.L531
	ldr	r1, [r1, #20]
	ldr	r3, [r4, #8]
	ldr	r2, [r0, #8]
	add	r3, r1, r3
	cmp	r2, r3
	beq	.L565
.L531:
	mov	r3, #0
	str	r3, [r6, #40]
.L559:
	ldr	r8, .L568
	b	.L536
.L563:
	bl	goToLose2
	ldr	r3, [r4, #0]
	cmp	r3, #5
	bne	.L528
.L564:
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	b	goToL3Instructs
.L562:
	ldr	r7, [r4, #36]
	cmp	r7, #1
	ldrne	r3, [r8, #0]
	beq	.L566
.L538:
	cmp	r7, #0
	bne	.L558
	ldr	r2, [r6, #32]
	cmp	r2, #0
	beq	.L543
	ldr	r0, [r4, #20]
	ldr	r2, [r4, #8]
	ldr	r1, [r6, #8]
	add	r2, r0, r2
	cmp	r1, r2
	beq	.L567
.L543:
	mov	r2, #0
	str	r2, [r6, #40]
.L558:
	ldr	r4, .L568+8
	b	.L541
.L566:
	ldr	r3, [r6, #32]
	cmp	r3, #0
	beq	.L539
	ldr	r1, [r4, #20]
	ldr	r3, [r4, #8]
	ldr	r2, [r6, #8]
	add	r3, r1, r3
	cmp	r2, r3
	bne	.L539
	ldr	r3, [r6, #40]
	cmp	r3, #0
	bne	.L536
	mov	r1, #6592
	mov	r2, #11008
	add	r2, r2, #17
	ldr	r0, .L568+4
	add	r1, r1, #40
	bl	playSoundB
	ldr	r2, [r4, #32]
	ldr	r3, [r8, #0]
	cmp	r2, #1
	sub	r3, r3, #1
	mvn	r2, #1
	str	r5, [r6, #40]
	str	r2, [r6, #28]
	str	r3, [r8, #0]
	ldreq	r7, [r4, #36]
	beq	.L538
	ldr	r4, .L568+8
	b	.L541
.L539:
	mov	r3, #0
	str	r3, [r6, #40]
	ldr	r4, .L568+8
	ldr	r3, [r8, #0]
	b	.L541
.L565:
	ldr	r3, [r0, #40]
	cmp	r3, #0
	bne	.L559
	ldr	r8, .L568
	mov	r1, #6592
	mov	r2, #11008
	mov	r3, r7
	add	r2, r2, #17
	ldr	r0, .L568+4
	add	r1, r1, #40
	bl	playSoundB
	ldr	r5, [r4, #32]
	ldr	r3, [r8, #0]
	mov	r2, #1
	sub	r3, r3, #1
	cmp	r5, #0
	str	r2, [r6, #40]
	mvn	r2, #1
	str	r2, [r6, #28]
	str	r3, [r8, #0]
	ldreq	r7, [r4, #36]
	beq	.L530
	b	.L529
.L567:
	ldr	r2, [r6, #40]
	cmp	r2, #0
	bne	.L558
	ldr	r4, .L568+8
	ldr	r2, [r4, #0]
	add	r2, r2, #1
	mov	r1, #20
	str	r2, [r4, #0]
	mov	r2, #1
	str	r1, [r6, #36]
	str	r7, [r6, #32]
	str	r2, [r6, #40]
	b	.L541
.L569:
	.align	2
.L568:
	.word	playerHealth
	.word	oofSound
	.word	enemiesDead
	.size	enemy1FlipPlayerCollisionCheck, .-enemy1FlipPlayerCollisionCheck
	.align	2
	.global	enemy1PlayerCollisionCheck
	.type	enemy1PlayerCollisionCheck, %function
enemy1PlayerCollisionCheck:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r5, [r1, #32]
	cmp	r5, #0
	mov	r4, r1
	mov	r6, r0
	ldrne	r8, .L606
	bne	.L571
	ldr	r7, [r1, #36]
	cmp	r7, #0
	ldrne	r8, .L606
	beq	.L602
.L572:
	cmp	r7, #1
	bne	.L578
	ldr	r3, [r6, #32]
	cmp	r3, #0
	beq	.L577
	ldr	r3, [r6, #8]
	ldr	r1, [r6, #20]
	ldr	r2, [r4, #8]
	add	r1, r3, r1
	cmp	r1, r2
	blt	.L577
	ldr	r1, [r4, #20]
	add	r2, r2, r1
	cmp	r3, r2
	bgt	.L577
	ldr	r3, [r6, #40]
	cmp	r3, #0
	bne	.L578
	mov	r1, #6592
	mov	r2, #11008
	add	r2, r2, #17
	ldr	r0, .L606+4
	add	r1, r1, #40
	bl	playSoundB
	ldr	r3, [r8, #0]
	mov	r2, #2
	sub	r3, r3, #1
	str	r7, [r6, #40]
	str	r2, [r6, #28]
	str	r3, [r8, #0]
	ldr	r5, [r4, #32]
.L571:
	cmp	r5, #1
	beq	.L603
.L578:
	ldr	r3, [r8, #0]
	ldr	r4, .L606+8
.L583:
	cmp	r3, #0
	beq	.L604
	ldr	r3, [r4, #0]
	cmp	r3, #5
	beq	.L605
.L570:
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L602:
	ldr	r3, [r0, #32]
	cmp	r3, #0
	beq	.L573
	ldr	r3, [r0, #8]
	ldr	r1, [r0, #20]
	ldr	r2, [r4, #8]
	add	r1, r3, r1
	cmp	r1, r2
	blt	.L573
	ldr	r1, [r4, #20]
	add	r2, r2, r1
	cmp	r3, r2
	bgt	.L573
	ldr	r3, [r0, #40]
	cmp	r3, #0
	bne	.L601
	ldr	r8, .L606
	mov	r1, #6592
	mov	r2, #11008
	mov	r3, r7
	add	r2, r2, #17
	ldr	r0, .L606+4
	add	r1, r1, #40
	bl	playSoundB
	ldr	r5, [r4, #32]
	ldr	r3, [r8, #0]
	mov	r2, #1
	sub	r3, r3, #1
	cmp	r5, #0
	str	r2, [r6, #40]
	mov	r2, #2
	str	r2, [r6, #28]
	str	r3, [r8, #0]
	ldreq	r7, [r4, #36]
	beq	.L572
	b	.L571
.L573:
	mov	r3, #0
	str	r3, [r6, #40]
.L601:
	ldr	r8, .L606
	b	.L578
.L604:
	bl	goToLose2
	ldr	r3, [r4, #0]
	cmp	r3, #5
	bne	.L570
.L605:
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	b	goToL3Instructs
.L603:
	ldr	r7, [r4, #36]
	cmp	r7, #0
	ldrne	r3, [r8, #0]
	bne	.L580
	ldr	r3, [r6, #32]
	cmp	r3, #0
	beq	.L581
	ldr	r3, [r6, #8]
	ldr	r1, [r6, #20]
	ldr	r2, [r4, #8]
	add	r1, r3, r1
	cmp	r1, r2
	blt	.L581
	ldr	r1, [r4, #20]
	add	r2, r2, r1
	cmp	r3, r2
	bgt	.L581
	ldr	r3, [r6, #40]
	cmp	r3, #0
	bne	.L578
	mov	r1, #6592
	mov	r2, #11008
	add	r2, r2, #17
	ldr	r0, .L606+4
	add	r1, r1, #40
	bl	playSoundB
	ldr	r2, [r4, #32]
	ldr	r3, [r8, #0]
	cmp	r2, #1
	sub	r3, r3, #1
	mov	r2, #2
	str	r5, [r6, #40]
	str	r2, [r6, #28]
	str	r3, [r8, #0]
	ldreq	r7, [r4, #36]
	bne	.L600
.L580:
	cmp	r7, #1
	beq	.L598
.L600:
	ldr	r4, .L606+8
	b	.L583
.L598:
	ldr	r2, [r6, #32]
	cmp	r2, #0
	beq	.L585
	ldr	r2, [r6, #8]
	ldr	r0, [r6, #20]
	ldr	r1, [r4, #8]
	add	r0, r2, r0
	cmp	r0, r1
	blt	.L585
	ldr	r0, [r4, #20]
	add	r1, r1, r0
	cmp	r2, r1
	bgt	.L585
	ldr	r2, [r6, #40]
	cmp	r2, #0
	bne	.L600
	ldr	r4, .L606+8
	ldr	r1, [r4, #0]
	mov	r0, #20
	add	r1, r1, #1
	str	r0, [r6, #36]
	str	r1, [r4, #0]
	str	r2, [r6, #32]
	str	r7, [r6, #40]
	b	.L583
.L585:
	mov	r2, #0
	str	r2, [r6, #40]
	ldr	r4, .L606+8
	b	.L583
.L581:
	mov	r3, #0
	str	r3, [r6, #40]
	ldr	r4, .L606+8
	ldr	r3, [r8, #0]
	b	.L583
.L577:
	mov	r3, #0
	str	r3, [r6, #40]
	b	.L578
.L607:
	.align	2
.L606:
	.word	playerHealth
	.word	oofSound
	.word	enemiesDead
	.size	enemy1PlayerCollisionCheck, .-enemy1PlayerCollisionCheck
	.align	2
	.global	update2
	.type	update2, %function
update2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	ldr	r0, .L635
	ldr	r3, .L635+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L635+8
	ldr	r2, [r3, #0]
	ldr	r4, .L635+12
	add	r2, r2, #1
	ldr	r8, .L635+16
	mov	r0, r2
	ldr	r1, [r4, #0]
	str	r2, [r3, #0]
	mov	lr, pc
	bx	r8
	cmp	r1, #0
	beq	.L609
	ldr	r6, .L635+20
	ldr	r3, [r6, #0]
	cmp	r3, #0
	ldrgt	r5, .L635+24
	ble	.L611
.L610:
	ldr	r7, .L635+28
	mov	r4, #0
.L616:
	add	sl, r4, r4, asl #2
	add	sl, r4, sl, asl #1
	add	sl, r5, sl, asl #2
	mov	r0, sl
	mov	lr, pc
	bx	r7
	mov	r0, sl
	ldr	r1, .L635
	bl	enemy1PlayerCollisionCheck
	ldr	r3, [r6, #0]
	add	r4, r4, #1
	cmp	r3, r4
	bgt	.L616
.L611:
	ldr	r3, .L635+32
	ldr	r2, [r3, #0]
	ldr	r4, .L635+36
	add	r2, r2, #1
	mov	r0, r2
	ldr	r1, [r4, #0]
	str	r2, [r3, #0]
	mov	lr, pc
	bx	r8
	cmp	r1, #0
	beq	.L617
	ldr	r6, .L635+40
	ldr	r3, [r6, #0]
	cmp	r3, #0
	ldrgt	r5, .L635+44
	ble	.L608
.L618:
	ldr	r7, .L635+48
	mov	r4, #0
.L624:
	add	r8, r4, r4, asl #2
	add	r8, r4, r8, asl #1
	add	r8, r5, r8, asl #2
	mov	r0, r8
	mov	lr, pc
	bx	r7
	mov	r0, r8
	ldr	r1, .L635
	bl	enemy1FlipPlayerCollisionCheck
	ldr	r3, [r6, #0]
	add	r4, r4, #1
	cmp	r3, r4
	bgt	.L624
.L608:
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	bx	lr
.L617:
	ldr	r6, .L635+40
	ldr	r3, [r6, #0]
	cmp	r3, #0
	ble	.L608
	ldr	r5, .L635+44
	ldr	r0, [r5, #32]
	cmp	r0, #0
	movne	r2, r5
	bne	.L622
	b	.L620
.L623:
	ldr	r0, [r2, #76]
	cmp	r0, #0
	add	r2, r2, #44
	mov	r0, r1
	beq	.L620
.L622:
	add	r1, r1, #1
	cmp	r1, r3
	blt	.L623
	b	.L618
.L609:
	ldr	r6, .L635+20
	ldr	r0, [r6, #0]
	cmp	r0, #0
	ble	.L611
	ldr	r5, .L635+24
	ldr	r2, [r5, #32]
	cmp	r2, #0
	movne	r3, r5
	bne	.L614
	b	.L612
.L615:
	ldr	r2, [r3, #76]
	cmp	r2, #0
	add	r3, r3, #44
	mov	r2, r1
	beq	.L612
.L614:
	add	r1, r1, #1
	cmp	r1, r0
	blt	.L615
	b	.L610
.L612:
	add	r3, r2, r2, asl #2
	add	r2, r2, r3, asl #1
	mov	r0, #125
	add	r3, r5, r2, asl #2
	str	r0, [r5, r2, asl #2]
	mvn	r2, #23
	mov	r1, #1
	str	r2, [r3, #8]
	mvn	r2, #0
	str	r1, [r3, #32]
	str	r1, [r3, #28]
	str	r2, [r3, #36]
	mov	r3, #150
	str	r3, [r4, #0]
	b	.L610
.L620:
	add	r3, r0, r0, asl #2
	add	r0, r0, r3, asl #1
	add	r3, r5, r0, asl #2
	mov	r2, #1
	str	r2, [r3, #32]
	mov	r2, #125
	str	r2, [r5, r0, asl #2]
	mov	r2, #241
	str	r2, [r3, #8]
	mvn	r2, #0
	str	r2, [r3, #28]
	mov	r3, #200
	str	r3, [r4, #0]
	b	.L618
.L636:
	.align	2
.L635:
	.word	player
	.word	updatePlayer
	.word	enemy1Timer
	.word	timeToNxtEnemy1
	.word	__aeabi_idivmod
	.word	enemy1Count
	.word	enemies1
	.word	updateEnemy1
	.word	enemy1FlipTimer
	.word	timeToNxtEnemy1Flip
	.word	enemy1FlipCount
	.word	enemies1Flip
	.word	updateEnemy1Flip
	.size	update2, .-update2
	.align	2
	.global	updateLevel2
	.type	updateLevel2, %function
updateLevel2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r3, .L649
	mov	lr, pc
	bx	r3
	bl	update2
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #32
	ldreq	r4, .L649+4
	ldreq	r3, [r4, #0]
	subeq	r3, r3, #1
	streq	r3, [r4, #0]
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	ldrne	r4, .L649+4
	tst	r3, #16
	ldreq	r3, [r4, #0]
	ldr	r5, .L649+8
	addeq	r3, r3, #1
	streq	r3, [r4, #0]
	ldr	r3, [r5, #0]
	tst	r3, #8
	beq	.L640
	ldr	r2, .L649+12
	ldr	r2, [r2, #0]
	ands	r2, r2, #8
	beq	.L648
.L640:
	tst	r3, #2
	beq	.L641
	ldr	r3, .L649+12
	ldr	r3, [r3, #0]
	tst	r3, #2
	moveq	r3, #999424
	ldreq	r2, .L649+16
	addeq	r3, r3, #576
	streq	r3, [r2, #0]
.L641:
	mov	r3, #67108864
	ldr	r5, [r3, #304]
	ands	r5, r5, #1
	bne	.L642
	mov	r1, #4224
	mov	r2, #11008
	add	r1, r1, #6
	add	r2, r2, #17
	mov	r3, r5
	ldr	r0, .L649+20
	bl	playSoundB
	ldr	r3, .L649+24
	ldr	r2, [r3, #40]
	cmp	r2, #0
	subgt	r2, r2, #1
	movgt	r1, #1
	strgt	r1, [r3, #32]
	strgt	r2, [r3, #40]
	strle	r5, [r3, #32]
.L644:
	ldr	r3, [r4, #0]
	ldr	r2, .L649+28
	smull	r1, r2, r3, r2
	add	r1, r3, r3, lsr #31
	sub	r3, r2, r3, asr #31
	mov	r1, r1, asl #15
	mov	r3, r3, asl #16
	mov	r2, #67108864
	mov	r1, r1, lsr #16
	mov	r3, r3, lsr #16
	strh	r1, [r2, #16]	@ movhi
	strh	r3, [r2, #20]	@ movhi
	bl	updateOAM2
	mov	r0, #3
	ldr	r1, .L649+32
	mov	r2, #117440512
	mov	r3, #512
	ldr	ip, .L649+36
	mov	lr, pc
	bx	ip
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L642:
	ldr	r3, .L649+24
	ldr	r2, [r3, #40]
	cmp	r2, #99
	mov	r1, #0
	addle	r2, r2, #1
	str	r1, [r3, #32]
	strle	r2, [r3, #40]
	b	.L644
.L648:
	mov	r3, #67108864
	add	r3, r3, #256
	strh	r2, [r3, #2]	@ movhi
	strh	r2, [r3, #6]	@ movhi
	ldr	r3, .L649+40
	str	r2, [r3, #12]
	ldr	r3, .L649+44
	str	r2, [r3, #12]
	bl	goToPause2
	ldr	r3, [r5, #0]
	b	.L640
.L650:
	.align	2
.L649:
	.word	waitForVblank
	.word	hOff
	.word	oldButtons
	.word	buttons
	.word	playerHealth
	.word	punching
	.word	player
	.word	1431655766
	.word	shadowOAM
	.word	DMANow
	.word	soundA
	.word	soundB
	.size	updateLevel2, .-updateLevel2
	.align	2
	.global	init2
	.type	init2, %function
init2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 88
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, r8}
	ldr	r5, .L656
	ldr	r3, .L656+4
	mov	r2, #3
	sub	sp, sp, #92
	str	r2, [r5, #0]
	mov	r5, #123
	str	r5, [r3, #0]
	mov	r5, #120
	str	r5, [r3, #8]
	mov	r5, #15
	str	r5, [r3, #20]
	mov	r5, #31
	mov	r6, #0
	ldr	r4, .L656+8
	str	r5, [r3, #16]
	mov	r5, #100
	ldr	ip, .L656+12
	str	r6, [r3, #32]
	str	r6, [r3, #36]
	str	r5, [r3, #40]
	mov	r3, #160
	ldr	r0, .L656+16
	str	r3, [r4, #4]
	mov	r3, #200
	str	r3, [ip, #4]
	mov	r3, #40
	str	r3, [r0, #4]
	ldr	r3, .L656+20
	str	r6, [r3, #0]
	mov	r3, #147
	str	r3, [sp, #44]
	mov	r3, #1
	str	r3, [sp, #72]
	mvn	r3, #0
	str	r3, [sp, #80]
	ldr	r3, .L656+24
	mov	r1, #23
	str	r2, [r4, #0]
	str	r2, [ip, #0]
	str	r2, [r0, #0]
	mov	r2, #5
	str	r6, [sp, #52]
	str	r6, [sp, #48]
	str	r6, [sp, #56]
	str	r1, [sp, #64]
	str	r1, [sp, #60]
	str	r6, [sp, #84]
	str	r6, [sp, #76]
	str	r2, [r3, #0]
	ldr	r7, .L656+28
	add	r8, sp, #44
.L652:
	mov	r4, r8
	ldmia	r4!, {r0, r1, r2, r3}
	add	r5, r7, r6
	mov	ip, r5
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	add	r6, r6, #44
	ldmia	r4, {r0, r1, r2}
	cmp	r6, #220
	stmia	ip, {r0, r1, r2}
	bne	.L652
	mov	r3, #23
	ldr	r2, .L656+32
	mov	r6, #0
	str	r3, [sp, #20]
	str	r3, [sp, #16]
	mvn	r3, #0
	str	r6, [r2, #0]
	str	r3, [sp, #28]
	mov	r2, #150
	ldr	r3, .L656+36
	str	r2, [sp, #0]
	mov	r2, #5
	str	r6, [sp, #8]
	str	r6, [sp, #4]
	str	r6, [sp, #12]
	str	r6, [sp, #40]
	str	r6, [sp, #32]
	str	r2, [r3, #0]
	ldr	r7, .L656+40
	mov	r8, sp
.L653:
	mov	r4, r8
	ldmia	r4!, {r0, r1, r2, r3}
	add	r5, r7, r6
	mov	ip, r5
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	add	r6, r6, #44
	ldmia	r4, {r0, r1, r2}
	cmp	r6, #220
	stmia	ip, {r0, r1, r2}
	bne	.L653
	ldr	r3, .L656+44
	mov	r2, #0
	str	r2, [r3, #0]
	add	sp, sp, #92
	ldmfd	sp!, {r4, r5, r6, r7, r8}
	bx	lr
.L657:
	.align	2
.L656:
	.word	playerHealth
	.word	player
	.word	health
	.word	stamina
	.word	enemDead
	.word	enemiesDead
	.word	enemy1Count
	.word	enemies1
	.word	enemy1Timer
	.word	enemy1FlipCount
	.word	enemies1Flip
	.word	enemy1FlipTimer
	.size	init2, .-init2
	.align	2
	.global	updateLose2
	.type	updateLose2, %function
updateLose2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L665
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L659
	ldr	r2, .L665+4
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L663
.L659:
	tst	r3, #4
	beq	.L658
	ldr	r3, .L665+4
	ldr	r4, [r3, #0]
	ands	r4, r4, #4
	beq	.L664
.L658:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L664:
	bl	goToLevel2
	mov	r1, #331776
	add	r1, r1, #312
	mov	r2, #11008
	mov	r3, #1
	ldr	r0, .L665+8
	add	r1, r1, #2
	add	r2, r2, #17
	bl	playSoundA
	ldr	r3, .L665+12
.L661:
	mov	r2, #512	@ movhi
	strh	r2, [r3, r4]	@ movhi
	add	r4, r4, #8
	cmp	r4, #1024
	bne	.L661
	ldmfd	sp!, {r4, lr}
	b	init2
.L663:
	bl	goToSplash
	ldr	r3, [r4, #0]
	b	.L659
.L666:
	.align	2
.L665:
	.word	oldButtons
	.word	buttons
	.word	gameSound
	.word	shadowOAM
	.size	updateLose2, .-updateLose2
	.align	2
	.global	updatePause2
	.type	updatePause2, %function
updatePause2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L674
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L668
	ldr	r2, .L674+4
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L672
.L668:
	tst	r3, #4
	beq	.L667
	ldr	r3, .L674+4
	ldr	r4, [r3, #0]
	ands	r4, r4, #4
	beq	.L673
.L667:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L673:
	bl	goToLevel2
	mov	r1, #331776
	add	r1, r1, #312
	mov	r2, #11008
	mov	r3, #1
	ldr	r0, .L674+8
	add	r1, r1, #2
	add	r2, r2, #17
	bl	playSoundA
	ldr	r3, .L674+12
.L670:
	mov	r2, #512	@ movhi
	strh	r2, [r3, r4]	@ movhi
	add	r4, r4, #8
	cmp	r4, #1024
	bne	.L670
	ldmfd	sp!, {r4, lr}
	b	init2
.L672:
	mov	r3, #67108864
	add	r3, r3, #256
	mov	r1, #128	@ movhi
	strh	r1, [r3, #2]	@ movhi
	strh	r1, [r3, #6]	@ movhi
	ldr	r3, .L674+16
	mov	r2, #1
	str	r2, [r3, #12]
	ldr	r3, .L674+20
	str	r2, [r3, #12]
	bl	goToLevel2
	ldr	r3, [r4, #0]
	b	.L668
.L675:
	.align	2
.L674:
	.word	oldButtons
	.word	buttons
	.word	gameSound
	.word	shadowOAM
	.word	soundA
	.word	soundB
	.size	updatePause2, .-updatePause2
	.align	2
	.global	updateL2Instructs
	.type	updateL2Instructs, %function
updateL2Instructs:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L683
	ldr	r3, [r4, #0]
	tst	r3, #4
	beq	.L677
	ldr	r2, .L683+4
	ldr	r2, [r2, #0]
	tst	r2, #4
	beq	.L681
.L677:
	tst	r3, #8
	beq	.L676
	ldr	r3, .L683+4
	ldr	r4, [r3, #0]
	ands	r4, r4, #8
	beq	.L682
.L676:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L682:
	bl	goToLevel2
	mov	r1, #331776
	add	r1, r1, #312
	mov	r2, #11008
	mov	r3, #1
	ldr	r0, .L683+8
	add	r1, r1, #2
	add	r2, r2, #17
	bl	playSoundA
	ldr	r3, .L683+12
.L679:
	mov	r2, #512	@ movhi
	strh	r2, [r3, r4]	@ movhi
	add	r4, r4, #8
	cmp	r4, #1024
	bne	.L679
	ldmfd	sp!, {r4, lr}
	b	init2
.L681:
	bl	goToSplash
	ldr	r3, [r4, #0]
	b	.L677
.L684:
	.align	2
.L683:
	.word	oldButtons
	.word	buttons
	.word	gameSound
	.word	shadowOAM
	.size	updateL2Instructs, .-updateL2Instructs
	.align	2
	.global	goToL2Instructs
	.type	goToL2Instructs, %function
goToL2Instructs:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r7, .L686
	ldr	r6, .L686+4
	str	r7, [r6, #0]
	ldr	r6, .L686+8
	mov	lr, #0
	str	lr, [r6, #0]
	ldr	r6, .L686+12
	mov	ip, #67108864
	str	lr, [r6, #0]
	mov	r5, #256
	mov	lr, #7680	@ movhi
	mov	r3, #8512
	ldr	r4, .L686+16
	strh	r5, [ip, #0]	@ movhi
	strh	lr, [ip, #8]	@ movhi
	mov	r0, #3
	ldr	r1, .L686+20
	mov	r2, #100663296
	add	r3, r3, #16
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L686+24
	add	r2, r2, #61440
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L686+28
	mov	r2, #83886080
	mov	r3, r5
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	b	stopSound
.L687:
	.align	2
.L686:
	.word	updateL2Instructs
	.word	state
	.word	hOff
	.word	vOff
	.word	DMANow
	.word	level2_bgTiles
	.word	level2_bgMap
	.word	level2_bgPal
	.size	goToL2Instructs, .-goToL2Instructs
	.align	2
	.global	parachutePlayerCollisionCheck
	.type	parachutePlayerCollisionCheck, %function
parachutePlayerCollisionCheck:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	sub	sp, sp, #12
	ldr	r3, [r1, #36]
	cmp	r3, #0
	bne	.L689
	ldr	r2, [r0, #8]
	ldr	r3, [r0, #20]
	ldr	ip, [r1, #8]
	add	r3, r2, r3
	cmp	r3, ip
	beq	.L690
	ldr	r5, [r1, #0]
	ldr	r3, [r1, #16]
	ldr	r4, [r0, #0]
	add	r6, r5, r3
.L691:
	ldr	r7, [r1, #20]
	add	ip, ip, r7
	cmp	ip, r2
	beq	.L709
.L693:
	cmp	r4, r6
	beq	.L696
.L708:
	ldr	r3, [r1, #36]
.L689:
	cmp	r3, #1
	beq	.L710
.L688:
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	bx	lr
.L710:
	ldr	r2, [r0, #8]
	ldr	r3, [r0, #20]
	ldr	ip, [r1, #8]
	add	r3, r2, r3
	cmp	r3, ip
	beq	.L700
	ldr	r5, [r1, #0]
	ldr	r3, [r1, #16]
	ldr	r4, [r0, #0]
	add	r6, r5, r3
.L701:
	ldr	r7, [r1, #20]
	add	ip, ip, r7
	cmp	ip, r2
	beq	.L711
.L703:
	cmp	r4, r6
	bne	.L688
	ldr	r3, [r0, #8]
	ldr	r0, [r0, #20]
	ldr	r2, [r1, #8]
	add	r0, r3, r0
	cmp	r0, r2
	blt	.L688
	ldr	r1, [r1, #20]
	add	r2, r2, r1
	cmp	r3, r2
	bgt	.L688
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	b	goToL2Instructs
.L690:
	ldr	r4, [r0, #0]
	ldr	r3, [r0, #16]
	ldr	r5, [r1, #0]
	add	r3, r4, r3
	cmp	r3, r5
	bge	.L692
	ldr	r3, [r1, #16]
	add	r6, r5, r3
	b	.L691
.L696:
	ldr	r3, [r0, #8]
	ldr	ip, [r0, #20]
	ldr	r2, [r1, #8]
	add	ip, r3, ip
	cmp	ip, r2
	blt	.L708
	ldr	ip, [r1, #20]
	add	r2, r2, ip
	cmp	r3, r2
	bgt	.L708
	str	r0, [sp, #4]
	str	r1, [sp, #0]
	bl	goToL2Instructs
	ldr	r1, [sp, #0]
	ldr	r0, [sp, #4]
	ldr	r3, [r1, #36]
	b	.L689
.L709:
	ldr	r2, [r0, #16]
	add	r2, r4, r2
	cmp	r2, r5
	addlt	r6, r5, r3
	blt	.L693
	cmp	r4, r6
	bgt	.L708
	str	r0, [sp, #4]
	str	r1, [sp, #0]
	bl	goToL2Instructs
	ldr	r1, [sp, #0]
	ldr	r0, [sp, #4]
	ldr	r6, [r1, #16]
	ldr	r3, [r1, #0]
	ldr	r4, [r0, #0]
	add	r6, r6, r3
	b	.L693
.L711:
	ldr	r2, [r0, #16]
	add	r2, r4, r2
	cmp	r2, r5
	addlt	r6, r5, r3
	blt	.L703
	cmp	r4, r6
	bgt	.L688
	str	r0, [sp, #4]
	str	r1, [sp, #0]
	bl	goToL2Instructs
	ldr	r1, [sp, #0]
	ldr	r0, [sp, #4]
	ldr	r6, [r1, #16]
	ldr	r3, [r1, #0]
	ldr	r4, [r0, #0]
	add	r6, r6, r3
	b	.L703
.L700:
	ldr	r4, [r0, #0]
	ldr	r3, [r0, #16]
	ldr	r5, [r1, #0]
	add	r3, r4, r3
	cmp	r3, r5
	bge	.L702
	ldr	r3, [r1, #16]
	add	r6, r5, r3
	b	.L701
.L692:
	ldr	r3, [r1, #16]
	add	r6, r5, r3
	cmp	r4, r6
	bgt	.L691
	str	r0, [sp, #4]
	str	r1, [sp, #0]
	bl	goToL2Instructs
	ldr	r1, [sp, #0]
	ldr	r0, [sp, #4]
	ldr	r5, [r1, #0]
	ldr	r3, [r1, #16]
	ldr	r2, [r0, #8]
	ldr	ip, [r1, #8]
	ldr	r4, [r0, #0]
	add	r6, r5, r3
	b	.L691
.L702:
	ldr	r3, [r1, #16]
	add	r6, r5, r3
	cmp	r4, r6
	bgt	.L701
	str	r0, [sp, #4]
	str	r1, [sp, #0]
	bl	goToL2Instructs
	ldr	r1, [sp, #0]
	ldr	r0, [sp, #4]
	ldr	r5, [r1, #0]
	ldr	r3, [r1, #16]
	ldr	r2, [r0, #8]
	ldr	ip, [r1, #8]
	ldr	r4, [r0, #0]
	add	r6, r5, r3
	b	.L701
	.size	parachutePlayerCollisionCheck, .-parachutePlayerCollisionCheck
	.align	2
	.global	update1
	.type	update1, %function
update1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	ldr	r0, .L743
	ldr	r3, .L743+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L743+8
	ldr	r2, [r3, #0]
	ldr	r4, .L743+12
	add	r2, r2, #1
	ldr	r8, .L743+16
	mov	r0, r2
	ldr	r1, [r4, #0]
	str	r2, [r3, #0]
	mov	lr, pc
	bx	r8
	cmp	r1, #0
	ldrne	r6, .L743+20
	bne	.L713
	ldr	r6, .L743+20
	ldr	r0, [r6, #0]
	cmp	r0, #0
	ble	.L714
	ldr	r5, .L743+24
	ldr	r2, [r5, #32]
	cmp	r2, #0
	movne	r3, r5
	beq	.L715
.L717:
	add	r1, r1, #1
	cmp	r1, r0
	bge	.L718
	ldr	r2, [r3, #76]
	cmp	r2, #0
	add	r3, r3, #44
	mov	r2, r1
	bne	.L717
.L715:
	add	r3, r2, r2, asl #2
	add	r2, r2, r3, asl #1
	add	r7, r5, r2, asl #2
	mov	r3, #1
	str	r3, [r7, #32]
	mov	r3, #161
	str	r3, [r5, r2, asl #2]
	ldr	sl, .L743+28
	mov	lr, pc
	bx	sl
	ldr	r3, .L743+32
	smull	r2, r3, r0, r3
	mov	r2, r0, asr #31
	add	r3, r3, r0
	rsb	r3, r2, r3, asr #7
	rsb	r3, r3, r3, asl #4
	sub	r0, r0, r3, asl #4
	mvn	r3, #1
	str	r3, [r7, #24]
	str	r0, [r7, #8]
	mov	lr, pc
	bx	sl
	ldr	r2, .L743+36
	smull	r3, r2, r0, r2
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, asl #2
	add	r3, r3, r3, asl #2
	rsb	r0, r3, r0
	add	r0, r0, #100
	str	r0, [r4, #0]
.L713:
	ldr	r3, [r6, #0]
	cmp	r3, #0
	ldrgt	r5, .L743+24
	ble	.L714
.L718:
	ldr	r7, .L743+40
	mov	r4, #0
.L720:
	add	sl, r4, r4, asl #2
	add	sl, r4, sl, asl #1
	add	sl, r5, sl, asl #2
	mov	r0, sl
	mov	lr, pc
	bx	r7
	mov	r0, sl
	ldr	r1, .L743
	bl	enemy3PlayerCollisionCheck
	ldr	r3, [r6, #0]
	add	r4, r4, #1
	cmp	r3, r4
	bgt	.L720
.L714:
	ldr	r3, .L743+44
	ldr	r2, [r3, #0]
	ldr	r4, .L743+48
	add	r2, r2, #1
	mov	r0, r2
	ldr	r1, [r4, #0]
	str	r2, [r3, #0]
	mov	lr, pc
	bx	r8
	cmp	r1, #0
	ldrne	r6, .L743+52
	bne	.L721
	ldr	r6, .L743+52
	ldr	r3, [r6, #0]
	cmp	r3, #0
	ble	.L712
	ldr	r5, .L743+56
	ldr	r0, [r5, #32]
	cmp	r0, #0
	movne	r2, r5
	beq	.L723
.L725:
	add	r1, r1, #1
	cmp	r1, r3
	bge	.L726
	ldr	r0, [r2, #68]
	cmp	r0, #0
	add	r2, r2, #36
	mov	r0, r1
	bne	.L725
.L723:
	add	r0, r0, r0, asl #3
	add	r7, r5, r0, asl #2
	mov	r3, #1
	str	r3, [r7, #32]
	mov	r3, #161
	str	r3, [r5, r0, asl #2]
	ldr	r3, .L743+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L743+32
	smull	r2, r3, r0, r3
	mov	r2, r0, asr #31
	add	r3, r3, r0
	rsb	r3, r2, r3, asr #7
	rsb	r3, r3, r3, asl #4
	sub	r0, r0, r3, asl #4
	mvn	r3, #1
	str	r3, [r7, #24]
	mov	r3, #300
	str	r0, [r7, #8]
	str	r3, [r4, #0]
.L721:
	ldr	r3, [r6, #0]
	cmp	r3, #0
	ldrgt	r5, .L743+56
	ble	.L712
.L726:
	ldr	r7, .L743+60
	mov	r4, #0
.L728:
	add	r8, r4, r4, asl #3
	add	r8, r5, r8, asl #2
	mov	r0, r8
	mov	lr, pc
	bx	r7
	mov	r0, r8
	ldr	r1, .L743
	bl	parachutePlayerCollisionCheck
	ldr	r3, [r6, #0]
	add	r4, r4, #1
	cmp	r3, r4
	bgt	.L728
.L712:
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	bx	lr
.L744:
	.align	2
.L743:
	.word	player
	.word	updatePlayer
	.word	enemy3Timer
	.word	timeToNxtEnemy3
	.word	__aeabi_idivmod
	.word	enemy3Count
	.word	enemies3
	.word	rand
	.word	-2004318071
	.word	1374389535
	.word	updateEnemy3
	.word	parachuteTimer
	.word	timeToNxtChute
	.word	parachuteCount
	.word	parachute
	.word	updateParachute
	.size	update1, .-update1
	.align	2
	.global	updateLevel1
	.type	updateLevel1, %function
updateLevel1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L749
	ldr	r3, .L749+4
	mov	lr, pc
	bx	r3
	bl	update1
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L746
	ldr	r2, .L749+8
	ldr	r2, [r2, #0]
	ands	r2, r2, #8
	beq	.L748
.L746:
	tst	r3, #2
	beq	.L747
	ldr	r3, .L749+8
	ldr	r3, [r3, #0]
	tst	r3, #2
	moveq	r3, #999424
	ldreq	r2, .L749+12
	addeq	r3, r3, #576
	streq	r3, [r2, #0]
.L747:
	ldr	r3, .L749+16
	ldr	r2, [r3, #0]
	mov	r0, r2, asl #17
	mov	r0, r0, lsr #16
	add	r2, r2, #1
	mov	r1, #67108864
	strh	r0, [r1, #18]	@ movhi
	str	r2, [r3, #0]
	bl	updateOAM1
	mov	r0, #3
	ldr	r1, .L749+20
	mov	r2, #117440512
	mov	r3, #512
	ldr	ip, .L749+24
	mov	lr, pc
	bx	ip
	ldmfd	sp!, {r4, lr}
	bx	lr
.L748:
	mov	r3, #67108864
	add	r3, r3, #256
	strh	r2, [r3, #2]	@ movhi
	strh	r2, [r3, #6]	@ movhi
	ldr	r3, .L749+28
	str	r2, [r3, #12]
	ldr	r3, .L749+32
	str	r2, [r3, #12]
	bl	goToPause1
	ldr	r3, [r4, #0]
	b	.L746
.L750:
	.align	2
.L749:
	.word	oldButtons
	.word	waitForVblank
	.word	buttons
	.word	playerHealth
	.word	vOff
	.word	shadowOAM
	.word	DMANow
	.word	soundA
	.word	soundB
	.size	updateLevel1, .-updateLevel1
	.align	2
	.global	setupInterrupts
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
	add	r3, r2, #512
	str	r4, [sp, #-4]!
	ldrh	r0, [r2, #4]
	ldrh	ip, [r3, #0]
	mov	r1, #50331648
	ldr	r4, .L752
	add	r1, r1, #28672
	orr	ip, ip, #1
	orr	r0, r0, #8
	str	r4, [r1, #4092]
	strh	ip, [r3, #0]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	mov	r2, #1	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldmfd	sp!, {r4}
	bx	lr
.L753:
	.align	2
.L752:
	.word	interruptHandler
	.size	setupInterrupts, .-setupInterrupts
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.comm	scanLineCounter,2,2
	.comm	fpsbuffer,30,4
	.comm	hOff,4,4
	.comm	vOff,4,4
	.comm	shadowOAM,1024,4
	.comm	soundA,32,4
	.comm	soundB,32,4
	.comm	player,44,4
	.comm	health,8,4
	.comm	stamina,8,4
	.comm	enemDead,8,4
	.comm	enemies1,220,4
	.comm	enemy1Count,4,4
	.comm	timeToNxtEnemy1,4,4
	.comm	enemy1Timer,4,4
	.comm	enemies1Flip,220,4
	.comm	enemy1FlipCount,4,4
	.comm	timeToNxtEnemy1Flip,4,4
	.comm	enemy1FlipTimer,4,4
	.comm	enemies2,220,4
	.comm	enemy2Count,4,4
	.comm	timeToNxtEnemy2,4,4
	.comm	enemy2Timer,4,4
	.comm	enemies2Flip,220,4
	.comm	enemy2FlipCount,4,4
	.comm	timeToNxtEnemy2Flip,4,4
	.comm	enemy2FlipTimer,4,4
	.comm	enemies3,220,4
	.comm	enemy3Count,4,4
	.comm	timeToNxtEnemy3,4,4
	.comm	enemy3Timer,4,4
	.comm	enemies4,220,4
	.comm	enemy4Count,4,4
	.comm	timeToNxtEnemy4,4,4
	.comm	enemy4Timer,4,4
	.comm	parachute,108,4
	.comm	parachuteCount,4,4
	.comm	timeToNxtChute,4,4
	.comm	parachuteTimer,4,4
	.comm	state,4,4
	.comm	playerHealth,4,4
	.comm	enemiesDead,4,4
	.comm	deadPuff,4,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
