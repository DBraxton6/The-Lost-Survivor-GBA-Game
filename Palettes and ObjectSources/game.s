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
	.file	"game.c"
	.text
	.align	2
	.global	updatePlayer
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #0]
	ldr	r3, [r0, #8]
	str	r2, [r0, #4]
	str	r3, [r0, #12]
	mov	r2, #67108864
	ldr	r2, [r2, #304]
	tst	r2, #32
	bne	.L2
	cmp	r3, #0
	subne	r3, r3, #1
	movne	r2, #1
	strne	r2, [r0, #36]
	strne	r3, [r0, #8]
.L2:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #16
	bxne	lr
	ldr	r2, [r0, #20]
	ldr	r3, [r0, #8]
	rsb	r2, r2, #240
	cmp	r3, r2
	addne	r3, r3, #1
	movne	r2, #0
	strne	r2, [r0, #36]
	strne	r3, [r0, #8]
	bx	lr
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateEnemy1
	.type	updateEnemy1, %function
updateEnemy1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, [r0, #32]
	ldr	r2, [r0, #0]
	ldr	r3, [r0, #8]
	cmp	r1, #0
	str	r2, [r0, #4]
	str	r3, [r0, #12]
	bxeq	lr
	ldr	r2, [r0, #28]
	add	r3, r3, r2
	cmp	r3, #240
	str	r3, [r0, #8]
	mvngt	r2, #23
	movgt	r3, #0
	strgt	r3, [r0, #32]
	strgt	r2, [r0, #8]
	strgt	r3, [r0, #36]
	bx	lr
	.size	updateEnemy1, .-updateEnemy1
	.align	2
	.global	updateEnemy1Flip
	.type	updateEnemy1Flip, %function
updateEnemy1Flip:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, [r0, #32]
	ldr	r2, [r0, #0]
	ldr	r3, [r0, #8]
	cmp	r1, #0
	str	r2, [r0, #4]
	str	r3, [r0, #12]
	bxeq	lr
	ldr	r1, [r0, #28]
	ldr	r2, [r0, #20]
	add	r3, r3, r1
	add	r2, r3, r2
	cmn	r2, #2
	str	r3, [r0, #8]
	movlt	r3, #0
	strlt	r3, [r0, #32]
	movlt	r3, #241
	strlt	r3, [r0, #8]
	bx	lr
	.size	updateEnemy1Flip, .-updateEnemy1Flip
	.align	2
	.global	updateEnemy2
	.type	updateEnemy2, %function
updateEnemy2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, [r0, #32]
	ldr	r2, [r0, #0]
	ldr	r3, [r0, #8]
	cmp	r1, #0
	str	r2, [r0, #4]
	str	r3, [r0, #12]
	bxeq	lr
	ldr	r2, [r0, #28]
	add	r3, r3, r2
	cmp	r3, #241
	str	r3, [r0, #8]
	movgt	r3, #0
	strgt	r3, [r0, #32]
	mvngt	r3, #23
	strgt	r3, [r0, #8]
	bx	lr
	.size	updateEnemy2, .-updateEnemy2
	.align	2
	.global	updateEnemy2Flip
	.type	updateEnemy2Flip, %function
updateEnemy2Flip:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, [r0, #32]
	ldr	r2, [r0, #0]
	ldr	r3, [r0, #8]
	cmp	r1, #0
	str	r2, [r0, #4]
	str	r3, [r0, #12]
	bxeq	lr
	ldr	r1, [r0, #28]
	ldr	r2, [r0, #20]
	add	r3, r3, r1
	add	r2, r3, r2
	cmn	r2, #1
	str	r3, [r0, #8]
	movlt	r3, #0
	strlt	r3, [r0, #32]
	movlt	r3, #241
	strlt	r3, [r0, #8]
	bx	lr
	.size	updateEnemy2Flip, .-updateEnemy2Flip
	.align	2
	.global	updateEnemy3
	.type	updateEnemy3, %function
updateEnemy3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, [r0, #32]
	ldr	r3, [r0, #0]
	ldr	r2, [r0, #8]
	cmp	r1, #0
	str	r3, [r0, #4]
	str	r2, [r0, #12]
	bxeq	lr
	ldr	r1, [r0, #24]
	ldr	r2, [r0, #16]
	add	r3, r3, r1
	cmn	r3, r2
	str	r3, [r0, #0]
	movmi	r3, #0
	strmi	r3, [r0, #32]
	movmi	r3, #161
	strmi	r3, [r0, #0]
	bx	lr
	.size	updateEnemy3, .-updateEnemy3
	.align	2
	.global	updateEnemy4
	.type	updateEnemy4, %function
updateEnemy4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, [r0, #32]
	ldr	r3, [r0, #0]
	ldr	r2, [r0, #8]
	cmp	r1, #0
	str	r3, [r0, #4]
	str	r2, [r0, #12]
	bxeq	lr
	ldr	r2, [r0, #24]
	add	r3, r3, r2
	cmp	r3, #161
	str	r3, [r0, #0]
	movgt	r3, #0
	strgt	r3, [r0, #32]
	mvngt	r3, #15
	strgt	r3, [r0, #0]
	bx	lr
	.size	updateEnemy4, .-updateEnemy4
	.align	2
	.global	updateParachute
	.type	updateParachute, %function
updateParachute:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, [r0, #32]
	ldr	r3, [r0, #0]
	ldr	r2, [r0, #8]
	cmp	r1, #0
	str	r3, [r0, #4]
	str	r2, [r0, #12]
	bxeq	lr
	ldr	r1, [r0, #24]
	ldr	r2, [r0, #16]
	add	r3, r3, r1
	add	r2, r3, r2
	cmn	r2, #1
	str	r3, [r0, #0]
	movlt	r3, #0
	strlt	r3, [r0, #32]
	mvnlt	r3, #15
	strlt	r3, [r0, #0]
	bx	lr
	.size	updateParachute, .-updateParachute
	.ident	"GCC: (devkitARM release 31) 4.5.0"
