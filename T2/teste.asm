
.text

main:
	li $v0, 5	# Numero lido em v0
	syscall
	
	bgt $v0, 127, invalido	# Se v0 > 127 o numero é inválido
	
	move $s0, $v0	# coloca o valor lido em s0
	move $t0, $v0	# coloca o valor lido em t0 (sera usado nos shifts)
	
	li $t1, 7	# t1 será quantas vezes entrará no "for"
	li $t2, 0	# t2 será o contador de bits "1"
			# t3 guardará o resto de t0 dividido por 2
	
loop:
	beq $t1, 0, calcula_paridade	# Se t1 = 0, termina o loop
	rem $t3, $t0 2	# t3 = t0 % 2
	beq $t3, 0, bit0	# Se t3 = 0, entao só dar shift e decrementar contador do loop
	add $t2, $t2, 1		# Se t3 = 1, entao incrementar contador de 1s
bit0:
	srl $t0, $t0, 1		# Shift Right no numero lido
	sub $t1, $t1, 1		# Decrementa contador do loop
	b loop

calcula_paridade:
	la $a0, bit_paridade	#
	li $v0, 4		# Imprime string
	syscall			#
	
	rem $t2, $t2, 2		# t2 diz se é impar ou par a quantidad de 1s
	beq $t2, 0, bit_par	# Se for par
	
	# Se for impar
	li $a0, 1		#
	li $v0, 1		# Imprime bit paridade
	syscall			#
	add $s0, $s0, 128	# Coloca um bit "1"
	b imprime_numero	# Imprime o numero

bit_par:
	li $a0, 0	#
	li $v0, 1	# Imprime bit paridade
	syscall		#
	b imprime_numero

imprime_numero:
	la $a0, new_line	#
	li $v0, 4		# Imprime "\n"
	syscall			#
	
	move $a0, $s0	#
	li $v0, 1	# Imprime inteiro
	syscall		#
	b fim

invalido:
	la $a0, invalidoString	#
	li $v0, 4		# Imprime string de numero invalido
	syscall			#
	
fim:
	la $a0, new_line
	li $v0, 4
	syscall
	li $v0, 10	# FIM
	syscall

.data

new_line:	.asciiz "\n"
bit_paridade:	.asciiz "bit-paridade: "
invalidoString:	.asciiz "numero invalido"
