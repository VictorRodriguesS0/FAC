
.text
main:
	li $v0, 5			# le um inteiro e armazena em v0	
	syscall
	move $a0, $v0		# Move o valor de $v0 pro registrador a0
	li $v0, 5			# Le um inteiro e armazena em v0
	syscall
	move $a1, $v0		# Move o valor de $v0 pro registrador a1
	add	$t0, $a0, $a1	# $t0 = soma dos dois valores
	sub	$t1, $a0, $a1	# $t1 = diferença dos dois valores
	and	$t2, $a0, $a1	# $t2 = AND dos dois valores
	or	$t3, $a0, $a1	# $t3 = OR dos dois valores
	xor	$t4, $a0, $a1	# $t4 = XOR dos dois valores
    sll $t5, $a0, 3  	# $t5 = Shift do primeiro valor
    srl  $t6, $a1, 1	# t6 = Shift segundo valor
	jal  print          # chama a rotina de print
 	li   $v0, 10		# fim de execução
    syscall				
		
.data
	space:		.asciiz  " "
	new_line:	.asciiz  "\n"         
	string_ADD:	.asciiz  "ADD: "
	string_SUB:	.asciiz  "\nSUB: "
	string_AND:	.asciiz  "\nAND: "
	string_OR:	.asciiz  "\nOR: "
	string_XOR:	.asciiz  "\nXOR: "
	string_SLL: 	.asciiz  "\nSLL(3): "
	string_SRL: 	.asciiz  "\nSRL(1): "

.text
	print:	
		la   $a0, string_ADD
		li   $v0, 4
  		syscall
		move   $a0, $t0
		li   $v0, 1       	
      	syscall
		la   $a0, string_SUB
      	li   $v0, 4
      	syscall
      	move   $a0, $t1
      	li   $v0, 1
      	syscall
      	la   $a0, string_AND
      	li   $v0, 4
      	syscall
      	move   $a0, $t2
      	li   $v0, 1
      	syscall
      	la   $a0, string_OR
      	li   $v0, 4
      	syscall
      	move   $a0, $t3
      	li   $v0, 1
      	syscall
      	la   $a0, string_XOR   	
      	li   $v0, 4           	
      	syscall               	
       	move   $a0, $t4      	
		li   $v0, 1           	
      	syscall               	
      	la   $a0, string_SLL
      	li   $v0, 4
      	syscall
      	move $a0, $t5
      	li $v0, 1
      	syscall
      	la   $a0, string_SRL
      	li   $v0, 4
      	syscall
      	move $a0, $t6
      	li $v0, 1
      	syscall
      	la $a0, new_line
      	li $v0, 4
      	syscall
      	
		jr   $ra              	# return