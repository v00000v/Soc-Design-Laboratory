	.file	"kcounter_la_uart.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/ubuntu/Downloads/SoC/course-lab_6-2022.1/lab-wlos_baseline/testbench/Lab6-main" "kcounter_la_uart.c"
	.align	2
	.type	flush_cpu_icache, @function
flush_cpu_icache:
.LFB21:
	.file 1 "../../firmware/system.h"
	.loc 1 15 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,12(sp)
	.cfi_offset 8, -4
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 26 1
	nop
	lw	s0,12(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE21:
	.size	flush_cpu_icache, .-flush_cpu_icache
	.align	2
	.type	flush_cpu_dcache, @function
flush_cpu_dcache:
.LFB22:
	.loc 1 29 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,12(sp)
	.cfi_offset 8, -4
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 33 1
	nop
	lw	s0,12(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE22:
	.size	flush_cpu_dcache, .-flush_cpu_dcache
	.align	2
	.globl	putchar
	.type	putchar, @function
putchar:
.LFB316:
	.file 2 "../../firmware/stub.c"
	.loc 2 19 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	sw	s0,24(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	mv	a5,a0
	sb	a5,-17(s0)
	.loc 2 20 5
	lbu	a4,-17(s0)
	li	a5,10
	bne	a4,a5,.L6
	.loc 2 21 3
	li	a0,13
	call	putchar
.L6:
	.loc 2 22 11
	nop
.L5:
	.loc 2 22 13 discriminator 1
	li	a5,-268410880
	addi	a5,a5,-2044
	lw	a4,0(a5)
	.loc 2 22 60 discriminator 1
	li	a5,1
	beq	a4,a5,.L5
	.loc 2 23 3
	li	a5,-268410880
	addi	a5,a5,-2048
	.loc 2 23 50
	lbu	a4,-17(s0)
	sw	a4,0(a5)
	.loc 2 24 1
	nop
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE316:
	.size	putchar, .-putchar
	.align	2
	.globl	print
	.type	print, @function
print:
.LFB317:
	.loc 2 27 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	sw	s0,24(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sw	a0,-20(s0)
	.loc 2 28 8
	j	.L8
.L9:
	.loc 2 29 14
	lw	a5,-20(s0)
	addi	a4,a5,1
	sw	a4,-20(s0)
	.loc 2 29 3
	lbu	a5,0(a5)
	mv	a0,a5
	call	putchar
.L8:
	.loc 2 28 9
	lw	a5,-20(s0)
	lbu	a5,0(a5)
	bne	a5,zero,.L9
	.loc 2 30 1
	nop
	nop
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE317:
	.size	print, .-print
	.align	2
	.globl	main
	.type	main, @function
main:
.LFB318:
	.file 3 "kcounter_la_uart.c"
	.loc 3 47 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	sw	s0,24(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 3 102 3
	li	a5,637534208
	addi	a5,a5,160
	.loc 3 102 36
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 103 10
	li	a5,637534208
	addi	a5,a5,156
	.loc 3 103 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 104 10
	li	a5,637534208
	addi	a5,a5,152
	.loc 3 104 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 105 10
	li	a5,637534208
	addi	a5,a5,148
	.loc 3 105 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 106 10
	li	a5,637534208
	addi	a5,a5,144
	.loc 3 106 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 107 10
	li	a5,637534208
	addi	a5,a5,140
	.loc 3 107 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 108 10
	li	a5,637534208
	addi	a5,a5,136
	.loc 3 108 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 109 10
	li	a5,637534208
	addi	a5,a5,132
	.loc 3 109 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 110 10
	li	a5,637534208
	addi	a5,a5,128
	.loc 3 110 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 111 10
	li	a5,637534208
	addi	a5,a5,124
	.loc 3 111 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 112 10
	li	a5,637534208
	addi	a5,a5,120
	.loc 3 112 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 113 10
	li	a5,637534208
	addi	a5,a5,116
	.loc 3 113 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 114 10
	li	a5,637534208
	addi	a5,a5,112
	.loc 3 114 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 115 10
	li	a5,637534208
	addi	a5,a5,108
	.loc 3 115 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 116 10
	li	a5,637534208
	addi	a5,a5,104
	.loc 3 116 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 117 10
	li	a5,637534208
	addi	a5,a5,100
	.loc 3 117 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 119 10
	li	a5,637534208
	addi	a5,a5,96
	.loc 3 119 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 120 10
	li	a5,637534208
	addi	a5,a5,92
	.loc 3 120 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 121 10
	li	a5,637534208
	addi	a5,a5,88
	.loc 3 121 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 122 10
	li	a5,637534208
	addi	a5,a5,84
	.loc 3 122 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 123 10
	li	a5,637534208
	addi	a5,a5,80
	.loc 3 123 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 124 10
	li	a5,637534208
	addi	a5,a5,76
	.loc 3 124 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 125 10
	li	a5,637534208
	addi	a5,a5,72
	.loc 3 125 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 126 10
	li	a5,637534208
	addi	a5,a5,68
	.loc 3 126 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 127 10
	li	a5,637534208
	addi	a5,a5,64
	.loc 3 127 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 128 10
	li	a5,637534208
	addi	a5,a5,56
	.loc 3 128 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 129 10
	li	a5,637534208
	addi	a5,a5,52
	.loc 3 129 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 130 10
	li	a5,637534208
	addi	a5,a5,48
	.loc 3 130 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 131 10
	li	a5,637534208
	addi	a5,a5,44
	.loc 3 131 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 132 10
	li	a5,637534208
	addi	a5,a5,40
	.loc 3 132 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 133 10
	li	a5,637534208
	addi	a5,a5,36
	.loc 3 133 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 135 10
	li	a5,637534208
	addi	a5,a5,60
	.loc 3 135 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 137 3
	li	a5,-268410880
	.loc 3 137 50
	li	a4,1
	sw	a4,0(a5)
	.loc 3 138 3
	li	a5,637534208
	.loc 3 138 36
	li	a4,1
	sw	a4,0(a5)
	.loc 3 139 8
	nop
.L11:
	.loc 3 139 10 discriminator 1
	li	a5,637534208
	lw	a4,0(a5)
	.loc 3 139 43 discriminator 1
	li	a5,1
	beq	a4,a5,.L11
	.loc 3 140 60
	li	a5,-268423168
	addi	a4,a5,12
	.loc 3 140 114
	li	a5,0
	sw	a5,0(a4)
	.loc 3 140 3
	li	a4,-268423168
	addi	a4,a4,28
	.loc 3 140 57
	sw	a5,0(a4)
	.loc 3 141 59
	li	a5,-268423168
	addi	a4,a5,8
	.loc 3 141 112
	li	a5,-1
	sw	a5,0(a4)
	.loc 3 141 3
	li	a4,-268423168
	addi	a4,a4,24
	.loc 3 141 56
	sw	a5,0(a4)
	.loc 3 142 59
	li	a5,-268423168
	addi	a4,a5,4
	.loc 3 142 112
	li	a5,0
	sw	a5,0(a4)
	.loc 3 142 3
	li	a4,-268423168
	addi	a4,a4,20
	.loc 3 142 56
	sw	a5,0(a4)
	.loc 3 143 53
	li	a4,-268423168
	.loc 3 143 100
	li	a5,0
	sw	a5,0(a4)
	.loc 3 143 3
	li	a4,-268423168
	addi	a4,a4,16
	.loc 3 143 50
	sw	a5,0(a4)
	.loc 3 144 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 3 144 36
	li	a4,-1421869056
	sw	a4,0(a5)
	.loc 3 145 3
	li	a5,-268423168
	addi	a5,a5,56
	.loc 3 145 56
	sw	zero,0(a5)
	.loc 3 146 59
	li	a5,-268423168
	addi	a4,a5,8
	.loc 3 146 112
	li	a5,0
	sw	a5,0(a4)
	.loc 3 146 3
	li	a4,-268423168
	addi	a4,a4,24
	.loc 3 146 56
	sw	a5,0(a4)
	.loc 3 149 15
	call	fir
	sw	a0,-20(s0)
	.loc 3 150 38
	lw	a5,-20(s0)
	lw	a5,0(a5)
	.loc 3 150 45
	slli	a4,a5,16
	.loc 3 150 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 3 150 36
	sw	a4,0(a5)
	.loc 3 151 45
	lw	a5,-20(s0)
	addi	a5,a5,4
	.loc 3 151 38
	lw	a5,0(a5)
	.loc 3 151 49
	slli	a4,a5,16
	.loc 3 151 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 3 151 36
	sw	a4,0(a5)
	.loc 3 152 45
	lw	a5,-20(s0)
	addi	a5,a5,8
	.loc 3 152 38
	lw	a5,0(a5)
	.loc 3 152 49
	slli	a4,a5,16
	.loc 3 152 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 3 152 36
	sw	a4,0(a5)
	.loc 3 153 45
	lw	a5,-20(s0)
	addi	a5,a5,12
	.loc 3 153 38
	lw	a5,0(a5)
	.loc 3 153 49
	slli	a4,a5,16
	.loc 3 153 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 3 153 36
	sw	a4,0(a5)
	.loc 3 154 45
	lw	a5,-20(s0)
	addi	a5,a5,16
	.loc 3 154 38
	lw	a5,0(a5)
	.loc 3 154 49
	slli	a4,a5,16
	.loc 3 154 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 3 154 36
	sw	a4,0(a5)
	.loc 3 155 45
	lw	a5,-20(s0)
	addi	a5,a5,20
	.loc 3 155 38
	lw	a5,0(a5)
	.loc 3 155 49
	slli	a4,a5,16
	.loc 3 155 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 3 155 36
	sw	a4,0(a5)
	.loc 3 156 45
	lw	a5,-20(s0)
	addi	a5,a5,24
	.loc 3 156 38
	lw	a5,0(a5)
	.loc 3 156 49
	slli	a4,a5,16
	.loc 3 156 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 3 156 36
	sw	a4,0(a5)
	.loc 3 157 45
	lw	a5,-20(s0)
	addi	a5,a5,28
	.loc 3 157 38
	lw	a5,0(a5)
	.loc 3 157 49
	slli	a4,a5,16
	.loc 3 157 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 3 157 36
	sw	a4,0(a5)
	.loc 3 158 45
	lw	a5,-20(s0)
	addi	a5,a5,32
	.loc 3 158 38
	lw	a5,0(a5)
	.loc 3 158 49
	slli	a4,a5,16
	.loc 3 158 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 3 158 36
	sw	a4,0(a5)
	.loc 3 159 45
	lw	a5,-20(s0)
	addi	a5,a5,36
	.loc 3 159 38
	lw	a5,0(a5)
	.loc 3 159 49
	slli	a4,a5,16
	.loc 3 159 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 3 159 36
	sw	a4,0(a5)
	.loc 3 160 45
	lw	a5,-20(s0)
	addi	a5,a5,40
	.loc 3 160 38
	lw	a5,0(a5)
	.loc 3 160 50
	slli	a4,a5,16
	.loc 3 160 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 3 160 36
	sw	a4,0(a5)
	.loc 3 161 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 3 161 36
	li	a4,-1420754944
	sw	a4,0(a5)
	.loc 3 164 3
	li	a5,637534208
	addi	a5,a5,160
	.loc 3 164 36
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 165 10
	li	a5,637534208
	addi	a5,a5,156
	.loc 3 165 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 166 10
	li	a5,637534208
	addi	a5,a5,152
	.loc 3 166 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 167 10
	li	a5,637534208
	addi	a5,a5,148
	.loc 3 167 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 168 10
	li	a5,637534208
	addi	a5,a5,144
	.loc 3 168 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 169 10
	li	a5,637534208
	addi	a5,a5,140
	.loc 3 169 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 170 10
	li	a5,637534208
	addi	a5,a5,136
	.loc 3 170 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 171 10
	li	a5,637534208
	addi	a5,a5,132
	.loc 3 171 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 172 10
	li	a5,637534208
	addi	a5,a5,128
	.loc 3 172 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 173 10
	li	a5,637534208
	addi	a5,a5,124
	.loc 3 173 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 174 10
	li	a5,637534208
	addi	a5,a5,120
	.loc 3 174 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 175 10
	li	a5,637534208
	addi	a5,a5,116
	.loc 3 175 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 176 10
	li	a5,637534208
	addi	a5,a5,112
	.loc 3 176 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 177 10
	li	a5,637534208
	addi	a5,a5,108
	.loc 3 177 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 178 10
	li	a5,637534208
	addi	a5,a5,104
	.loc 3 178 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 179 10
	li	a5,637534208
	addi	a5,a5,100
	.loc 3 179 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 181 10
	li	a5,637534208
	addi	a5,a5,96
	.loc 3 181 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 182 10
	li	a5,637534208
	addi	a5,a5,92
	.loc 3 182 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 183 10
	li	a5,637534208
	addi	a5,a5,88
	.loc 3 183 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 184 10
	li	a5,637534208
	addi	a5,a5,84
	.loc 3 184 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 185 10
	li	a5,637534208
	addi	a5,a5,80
	.loc 3 185 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 186 10
	li	a5,637534208
	addi	a5,a5,76
	.loc 3 186 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 187 10
	li	a5,637534208
	addi	a5,a5,72
	.loc 3 187 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 188 10
	li	a5,637534208
	addi	a5,a5,68
	.loc 3 188 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 189 10
	li	a5,637534208
	addi	a5,a5,64
	.loc 3 189 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 190 10
	li	a5,637534208
	addi	a5,a5,56
	.loc 3 190 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 191 10
	li	a5,637534208
	addi	a5,a5,52
	.loc 3 191 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 192 10
	li	a5,637534208
	addi	a5,a5,48
	.loc 3 192 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 193 10
	li	a5,637534208
	addi	a5,a5,44
	.loc 3 193 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 194 10
	li	a5,637534208
	addi	a5,a5,40
	.loc 3 194 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 195 10
	li	a5,637534208
	addi	a5,a5,36
	.loc 3 195 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 197 10
	li	a5,637534208
	addi	a5,a5,60
	.loc 3 197 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 199 3
	li	a5,-268410880
	.loc 3 199 50
	li	a4,1
	sw	a4,0(a5)
	.loc 3 200 3
	li	a5,637534208
	.loc 3 200 36
	li	a4,1
	sw	a4,0(a5)
	.loc 3 201 8
	nop
.L12:
	.loc 3 201 10 discriminator 1
	li	a5,637534208
	lw	a4,0(a5)
	.loc 3 201 43 discriminator 1
	li	a5,1
	beq	a4,a5,.L12
	.loc 3 202 60
	li	a5,-268423168
	addi	a4,a5,12
	.loc 3 202 114
	li	a5,0
	sw	a5,0(a4)
	.loc 3 202 3
	li	a4,-268423168
	addi	a4,a4,28
	.loc 3 202 57
	sw	a5,0(a4)
	.loc 3 203 59
	li	a5,-268423168
	addi	a4,a5,8
	.loc 3 203 112
	li	a5,-1
	sw	a5,0(a4)
	.loc 3 203 3
	li	a4,-268423168
	addi	a4,a4,24
	.loc 3 203 56
	sw	a5,0(a4)
	.loc 3 204 59
	li	a5,-268423168
	addi	a4,a5,4
	.loc 3 204 112
	li	a5,0
	sw	a5,0(a4)
	.loc 3 204 3
	li	a4,-268423168
	addi	a4,a4,20
	.loc 3 204 56
	sw	a5,0(a4)
	.loc 3 205 53
	li	a4,-268423168
	.loc 3 205 100
	li	a5,0
	sw	a5,0(a4)
	.loc 3 205 3
	li	a4,-268423168
	addi	a4,a4,16
	.loc 3 205 50
	sw	a5,0(a4)
	.loc 3 207 3
	li	a5,-268423168
	addi	a5,a5,56
	.loc 3 207 56
	sw	zero,0(a5)
	.loc 3 208 59
	li	a5,-268423168
	addi	a4,a5,8
	.loc 3 208 112
	li	a5,0
	sw	a5,0(a4)
	.loc 3 208 3
	li	a4,-268423168
	addi	a4,a4,24
	.loc 3 208 56
	sw	a5,0(a4)
	.loc 3 210 15
	call	matmul
	sw	a0,-24(s0)
	.loc 3 211 38
	lw	a5,-24(s0)
	lw	a5,0(a5)
	.loc 3 211 45
	slli	a4,a5,16
	.loc 3 211 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 3 211 36
	sw	a4,0(a5)
	.loc 3 212 45
	lw	a5,-24(s0)
	addi	a5,a5,4
	.loc 3 212 38
	lw	a5,0(a5)
	.loc 3 212 49
	slli	a4,a5,16
	.loc 3 212 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 3 212 36
	sw	a4,0(a5)
	.loc 3 213 45
	lw	a5,-24(s0)
	addi	a5,a5,8
	.loc 3 213 38
	lw	a5,0(a5)
	.loc 3 213 49
	slli	a4,a5,16
	.loc 3 213 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 3 213 36
	sw	a4,0(a5)
	.loc 3 214 45
	lw	a5,-24(s0)
	addi	a5,a5,12
	.loc 3 214 38
	lw	a5,0(a5)
	.loc 3 214 49
	slli	a4,a5,16
	.loc 3 214 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 3 214 36
	sw	a4,0(a5)
	.loc 3 215 45
	lw	a5,-24(s0)
	addi	a5,a5,36
	.loc 3 215 38
	lw	a5,0(a5)
	.loc 3 215 49
	slli	a4,a5,16
	.loc 3 215 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 3 215 36
	sw	a4,0(a5)
	.loc 3 220 3
	li	a5,637534208
	addi	a5,a5,160
	.loc 3 220 36
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 221 10
	li	a5,637534208
	addi	a5,a5,156
	.loc 3 221 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 222 10
	li	a5,637534208
	addi	a5,a5,152
	.loc 3 222 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 223 10
	li	a5,637534208
	addi	a5,a5,148
	.loc 3 223 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 224 10
	li	a5,637534208
	addi	a5,a5,144
	.loc 3 224 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 225 10
	li	a5,637534208
	addi	a5,a5,140
	.loc 3 225 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 226 10
	li	a5,637534208
	addi	a5,a5,136
	.loc 3 226 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 227 10
	li	a5,637534208
	addi	a5,a5,132
	.loc 3 227 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 228 10
	li	a5,637534208
	addi	a5,a5,128
	.loc 3 228 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 229 10
	li	a5,637534208
	addi	a5,a5,124
	.loc 3 229 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 230 10
	li	a5,637534208
	addi	a5,a5,120
	.loc 3 230 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 231 10
	li	a5,637534208
	addi	a5,a5,116
	.loc 3 231 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 232 10
	li	a5,637534208
	addi	a5,a5,112
	.loc 3 232 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 233 10
	li	a5,637534208
	addi	a5,a5,108
	.loc 3 233 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 234 10
	li	a5,637534208
	addi	a5,a5,104
	.loc 3 234 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 235 10
	li	a5,637534208
	addi	a5,a5,100
	.loc 3 235 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 237 10
	li	a5,637534208
	addi	a5,a5,96
	.loc 3 237 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 238 10
	li	a5,637534208
	addi	a5,a5,92
	.loc 3 238 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 239 10
	li	a5,637534208
	addi	a5,a5,88
	.loc 3 239 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 240 10
	li	a5,637534208
	addi	a5,a5,84
	.loc 3 240 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 241 10
	li	a5,637534208
	addi	a5,a5,80
	.loc 3 241 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 242 10
	li	a5,637534208
	addi	a5,a5,76
	.loc 3 242 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 243 10
	li	a5,637534208
	addi	a5,a5,72
	.loc 3 243 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 244 10
	li	a5,637534208
	addi	a5,a5,68
	.loc 3 244 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 245 10
	li	a5,637534208
	addi	a5,a5,64
	.loc 3 245 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 246 10
	li	a5,637534208
	addi	a5,a5,56
	.loc 3 246 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 247 10
	li	a5,637534208
	addi	a5,a5,52
	.loc 3 247 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 248 10
	li	a5,637534208
	addi	a5,a5,48
	.loc 3 248 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 249 10
	li	a5,637534208
	addi	a5,a5,44
	.loc 3 249 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 250 10
	li	a5,637534208
	addi	a5,a5,40
	.loc 3 250 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 251 10
	li	a5,637534208
	addi	a5,a5,36
	.loc 3 251 43
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 253 10
	li	a5,637534208
	addi	a5,a5,60
	.loc 3 253 43
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 255 3
	li	a5,-268410880
	.loc 3 255 50
	li	a4,1
	sw	a4,0(a5)
	.loc 3 256 3
	li	a5,637534208
	.loc 3 256 36
	li	a4,1
	sw	a4,0(a5)
	.loc 3 257 8
	nop
.L13:
	.loc 3 257 10 discriminator 1
	li	a5,637534208
	lw	a4,0(a5)
	.loc 3 257 43 discriminator 1
	li	a5,1
	beq	a4,a5,.L13
	.loc 3 258 60
	li	a5,-268423168
	addi	a4,a5,12
	.loc 3 258 114
	li	a5,0
	sw	a5,0(a4)
	.loc 3 258 3
	li	a4,-268423168
	addi	a4,a4,28
	.loc 3 258 57
	sw	a5,0(a4)
	.loc 3 259 59
	li	a5,-268423168
	addi	a4,a5,8
	.loc 3 259 112
	li	a5,-1
	sw	a5,0(a4)
	.loc 3 259 3
	li	a4,-268423168
	addi	a4,a4,24
	.loc 3 259 56
	sw	a5,0(a4)
	.loc 3 260 59
	li	a5,-268423168
	addi	a4,a5,4
	.loc 3 260 112
	li	a5,0
	sw	a5,0(a4)
	.loc 3 260 3
	li	a4,-268423168
	addi	a4,a4,20
	.loc 3 260 56
	sw	a5,0(a4)
	.loc 3 261 53
	li	a4,-268423168
	.loc 3 261 100
	li	a5,0
	sw	a5,0(a4)
	.loc 3 261 3
	li	a4,-268423168
	addi	a4,a4,16
	.loc 3 261 50
	sw	a5,0(a4)
	.loc 3 263 3
	li	a5,-268423168
	addi	a5,a5,56
	.loc 3 263 56
	sw	zero,0(a5)
	.loc 3 264 59
	li	a5,-268423168
	addi	a4,a5,8
	.loc 3 264 112
	li	a5,0
	sw	a5,0(a4)
	.loc 3 264 3
	li	a4,-268423168
	addi	a4,a4,24
	.loc 3 264 56
	sw	a5,0(a4)
	.loc 3 266 15
	call	qsort
	sw	a0,-28(s0)
	.loc 3 267 38
	lw	a5,-28(s0)
	lw	a5,0(a5)
	.loc 3 267 45
	slli	a4,a5,16
	.loc 3 267 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 3 267 36
	sw	a4,0(a5)
	.loc 3 268 45
	lw	a5,-28(s0)
	addi	a5,a5,4
	.loc 3 268 38
	lw	a5,0(a5)
	.loc 3 268 49
	slli	a4,a5,16
	.loc 3 268 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 3 268 36
	sw	a4,0(a5)
	.loc 3 269 45
	lw	a5,-28(s0)
	addi	a5,a5,8
	.loc 3 269 38
	lw	a5,0(a5)
	.loc 3 269 49
	slli	a4,a5,16
	.loc 3 269 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 3 269 36
	sw	a4,0(a5)
	.loc 3 270 45
	lw	a5,-28(s0)
	addi	a5,a5,12
	.loc 3 270 38
	lw	a5,0(a5)
	.loc 3 270 49
	slli	a4,a5,16
	.loc 3 270 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 3 270 36
	sw	a4,0(a5)
	.loc 3 271 45
	lw	a5,-28(s0)
	addi	a5,a5,16
	.loc 3 271 38
	lw	a5,0(a5)
	.loc 3 271 49
	slli	a4,a5,16
	.loc 3 271 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 3 271 36
	sw	a4,0(a5)
	.loc 3 272 45
	lw	a5,-28(s0)
	addi	a5,a5,20
	.loc 3 272 38
	lw	a5,0(a5)
	.loc 3 272 49
	slli	a4,a5,16
	.loc 3 272 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 3 272 36
	sw	a4,0(a5)
	.loc 3 273 45
	lw	a5,-28(s0)
	addi	a5,a5,24
	.loc 3 273 38
	lw	a5,0(a5)
	.loc 3 273 49
	slli	a4,a5,16
	.loc 3 273 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 3 273 36
	sw	a4,0(a5)
	.loc 3 274 45
	lw	a5,-28(s0)
	addi	a5,a5,28
	.loc 3 274 38
	lw	a5,0(a5)
	.loc 3 274 49
	slli	a4,a5,16
	.loc 3 274 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 3 274 36
	sw	a4,0(a5)
	.loc 3 275 45
	lw	a5,-28(s0)
	addi	a5,a5,32
	.loc 3 275 38
	lw	a5,0(a5)
	.loc 3 275 49
	slli	a4,a5,16
	.loc 3 275 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 3 275 36
	sw	a4,0(a5)
	.loc 3 276 45
	lw	a5,-28(s0)
	addi	a5,a5,36
	.loc 3 276 38
	lw	a5,0(a5)
	.loc 3 276 49
	slli	a4,a5,16
	.loc 3 276 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 3 276 36
	sw	a4,0(a5)
	.loc 3 278 38
	lw	a5,-28(s0)
	lw	a5,0(a5)
	.loc 3 278 45
	slli	a4,a5,16
	.loc 3 278 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 3 278 36
	sw	a4,0(a5)
	.loc 3 281 3
	li	a5,-268419072
	addi	a5,a5,-2048
	.loc 3 281 50
	li	a4,1
	sw	a4,0(a5)
	.loc 3 283 7
	li	a5,637534208
	addi	a5,a5,160
	.loc 3 283 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 284 7
	li	a5,637534208
	addi	a5,a5,156
	.loc 3 284 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 285 7
	li	a5,637534208
	addi	a5,a5,152
	.loc 3 285 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 286 7
	li	a5,637534208
	addi	a5,a5,148
	.loc 3 286 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 287 7
	li	a5,637534208
	addi	a5,a5,144
	.loc 3 287 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 288 7
	li	a5,637534208
	addi	a5,a5,140
	.loc 3 288 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 289 7
	li	a5,637534208
	addi	a5,a5,136
	.loc 3 289 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 290 7
	li	a5,637534208
	addi	a5,a5,132
	.loc 3 290 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 291 7
	li	a5,637534208
	addi	a5,a5,128
	.loc 3 291 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 292 7
	li	a5,637534208
	addi	a5,a5,124
	.loc 3 292 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 293 7
	li	a5,637534208
	addi	a5,a5,120
	.loc 3 293 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 294 7
	li	a5,637534208
	addi	a5,a5,116
	.loc 3 294 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 295 7
	li	a5,637534208
	addi	a5,a5,112
	.loc 3 295 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 296 7
	li	a5,637534208
	addi	a5,a5,108
	.loc 3 296 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 297 7
	li	a5,637534208
	addi	a5,a5,104
	.loc 3 297 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 298 7
	li	a5,637534208
	addi	a5,a5,100
	.loc 3 298 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 300 7
	li	a5,637534208
	addi	a5,a5,96
	.loc 3 300 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 301 7
	li	a5,637534208
	addi	a5,a5,92
	.loc 3 301 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 302 7
	li	a5,637534208
	addi	a5,a5,88
	.loc 3 302 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 303 7
	li	a5,637534208
	addi	a5,a5,84
	.loc 3 303 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 304 7
	li	a5,637534208
	addi	a5,a5,80
	.loc 3 304 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 305 7
	li	a5,637534208
	addi	a5,a5,76
	.loc 3 305 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 306 7
	li	a5,637534208
	addi	a5,a5,72
	.loc 3 306 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 307 7
	li	a5,637534208
	addi	a5,a5,68
	.loc 3 307 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 308 7
	li	a5,637534208
	addi	a5,a5,64
	.loc 3 308 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 309 7
	li	a5,637534208
	addi	a5,a5,52
	.loc 3 309 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 310 7
	li	a5,637534208
	addi	a5,a5,48
	.loc 3 310 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 311 7
	li	a5,637534208
	addi	a5,a5,44
	.loc 3 311 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 312 7
	li	a5,637534208
	addi	a5,a5,40
	.loc 3 312 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 313 7
	li	a5,637534208
	addi	a5,a5,36
	.loc 3 313 40
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 315 7
	li	a5,637534208
	addi	a5,a5,60
	.loc 3 315 40
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 316 7
	li	a5,637534208
	addi	a5,a5,56
	.loc 3 316 40
	li	a4,1026
	sw	a4,0(a5)
	.loc 3 320 3
	li	a5,637534208
	.loc 3 320 36
	li	a4,1
	sw	a4,0(a5)
	.loc 3 321 8
	nop
.L14:
	.loc 3 321 10 discriminator 1
	li	a5,637534208
	lw	a4,0(a5)
	.loc 3 321 43 discriminator 1
	li	a5,1
	beq	a4,a5,.L14
	.loc 3 325 60
	li	a5,-268423168
	addi	a4,a5,12
	.loc 3 325 114
	li	a5,0
	sw	a5,0(a4)
	.loc 3 325 3
	li	a4,-268423168
	addi	a4,a4,28
	.loc 3 325 57
	sw	a5,0(a4)
	.loc 3 326 59
	li	a5,-268423168
	addi	a4,a5,8
	.loc 3 326 112
	li	a5,-1
	sw	a5,0(a4)
	.loc 3 326 3
	li	a4,-268423168
	addi	a4,a4,24
	.loc 3 326 56
	sw	a5,0(a4)
	.loc 3 327 59
	li	a5,-268423168
	addi	a4,a5,4
	.loc 3 327 112
	li	a5,0
	sw	a5,0(a4)
	.loc 3 327 3
	li	a4,-268423168
	addi	a4,a4,20
	.loc 3 327 56
	sw	a5,0(a4)
	.loc 3 328 53
	li	a4,-268423168
	.loc 3 328 100
	li	a5,0
	sw	a5,0(a4)
	.loc 3 328 3
	li	a4,-268423168
	addi	a4,a4,16
	.loc 3 328 50
	sw	a5,0(a4)
	.loc 3 334 3
	li	a5,-268423168
	addi	a5,a5,56
	.loc 3 334 56
	sw	zero,0(a5)
	.loc 3 337 59
	li	a5,-268423168
	addi	a4,a5,8
	.loc 3 337 112
	li	a5,0
	sw	a5,0(a4)
	.loc 3 337 3
	li	a4,-268423168
	addi	a4,a4,24
	.loc 3 337 56
	sw	a5,0(a4)
	.loc 3 339 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 3 339 36
	li	a4,-1420754944
	sw	a4,0(a5)
	.loc 3 348 1
	nop
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE318:
	.size	main, .-main
.Letext0:
	.file 4 "/opt/riscv/lib/gcc/riscv32-unknown-elf/12.1.0/include/stdint-gcc.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x16a
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x9
	.4byte	.LASF21
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x1
	.byte	0x1
	.byte	0x6
	.4byte	.LASF2
	.byte	0x1
	.byte	0x2
	.byte	0x5
	.4byte	.LASF3
	.byte	0x1
	.byte	0x4
	.byte	0x5
	.4byte	.LASF4
	.byte	0x1
	.byte	0x8
	.byte	0x5
	.4byte	.LASF5
	.byte	0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF6
	.byte	0x1
	.byte	0x2
	.byte	0x7
	.4byte	.LASF7
	.byte	0xa
	.4byte	.LASF22
	.byte	0x4
	.byte	0x34
	.byte	0x1b
	.4byte	0x5c
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.byte	0x1
	.byte	0x8
	.byte	0x7
	.4byte	.LASF9
	.byte	0xb
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF10
	.byte	0x3
	.4byte	.LASF11
	.byte	0x23
	.4byte	0x88
	.4byte	0x88
	.byte	0x2
	.byte	0
	.byte	0x4
	.4byte	0x6a
	.byte	0x3
	.4byte	.LASF12
	.byte	0x22
	.4byte	0x88
	.4byte	0x9d
	.byte	0x2
	.byte	0
	.byte	0xc
	.string	"fir"
	.byte	0x3
	.byte	0x21
	.byte	0xd
	.4byte	0x88
	.4byte	0xaf
	.byte	0x2
	.byte	0
	.byte	0xd
	.4byte	.LASF23
	.byte	0x3
	.byte	0x2e
	.byte	0x6
	.4byte	.LFB318
	.4byte	.LFE318-.LFB318
	.byte	0x1
	.byte	0x9c
	.4byte	0xfa
	.byte	0xe
	.string	"j"
	.byte	0x3
	.byte	0x63
	.byte	0x6
	.4byte	0x6a
	.byte	0x5
	.4byte	.LASF13
	.byte	0x95
	.4byte	0x88
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x5
	.4byte	.LASF14
	.byte	0xd2
	.4byte	0x88
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0xf
	.4byte	.LASF15
	.byte	0x3
	.2byte	0x10a
	.byte	0x7
	.4byte	0x88
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0
	.byte	0x6
	.4byte	.LASF17
	.byte	0x1a
	.4byte	.LFB317
	.4byte	.LFE317-.LFB317
	.byte	0x1
	.byte	0x9c
	.4byte	0x11b
	.byte	0x7
	.string	"p"
	.byte	0x1a
	.byte	0x18
	.4byte	0x11b
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0x4
	.4byte	0x127
	.byte	0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF16
	.byte	0x10
	.4byte	0x120
	.byte	0x6
	.4byte	.LASF18
	.byte	0x12
	.4byte	.LFB316
	.4byte	.LFE316-.LFB316
	.byte	0x1
	.byte	0x9c
	.4byte	0x14d
	.byte	0x7
	.string	"c"
	.byte	0x12
	.byte	0x13
	.4byte	0x120
	.byte	0x2
	.byte	0x91
	.byte	0x6f
	.byte	0
	.byte	0x8
	.4byte	.LASF19
	.byte	0x1c
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.byte	0x1
	.byte	0x9c
	.byte	0x8
	.4byte	.LASF20
	.byte	0xe
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.byte	0x1
	.byte	0x9c
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x3
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0xd
	.byte	0x49
	.byte	0x13
	.byte	0x3c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0x21
	.byte	0x4
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x3
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0x7
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x2
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0x6
	.byte	0x27
	.byte	0x19
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x7c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x2
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x2e
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0x25
	.byte	0x27
	.byte	0x19
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x7a
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x11
	.byte	0x1
	.byte	0x25
	.byte	0xe
	.byte	0x13
	.byte	0xb
	.byte	0x3
	.byte	0x1f
	.byte	0x1b
	.byte	0x1f
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x10
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x16
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x3c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x7c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x10
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF14:
	.string	"tmp_m"
.LASF15:
	.string	"tmp_q"
.LASF19:
	.string	"flush_cpu_dcache"
.LASF12:
	.string	"matmul"
.LASF11:
	.string	"qsort"
.LASF6:
	.string	"unsigned char"
.LASF8:
	.string	"long unsigned int"
.LASF7:
	.string	"short unsigned int"
.LASF18:
	.string	"putchar"
.LASF21:
	.string	"GNU C17 12.1.0 -mabi=ilp32 -mtune=rocket -misa-spec=2.2 -march=rv32i -g -ffreestanding"
.LASF23:
	.string	"main"
.LASF10:
	.string	"unsigned int"
.LASF9:
	.string	"long long unsigned int"
.LASF20:
	.string	"flush_cpu_icache"
.LASF5:
	.string	"long long int"
.LASF16:
	.string	"char"
.LASF17:
	.string	"print"
.LASF3:
	.string	"short int"
.LASF22:
	.string	"uint32_t"
.LASF4:
	.string	"long int"
.LASF2:
	.string	"signed char"
.LASF13:
	.string	"tmp_f"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"kcounter_la_uart.c"
.LASF1:
	.string	"/home/ubuntu/Downloads/SoC/course-lab_6-2022.1/lab-wlos_baseline/testbench/Lab6-main"
	.ident	"GCC: (g1ea978e3066) 12.1.0"
