
main:	
.text
	li $v0, 5 #Le do teclado e coloca em v0
	syscall #cham syscall para leitura do teclado
	move $t0, $v0 #colocar o que foi lido em t0
	
	
	li $v0, 5 #Le do teclado e coloca em v0
	syscall #cham syscall para leitura do teclado
	move $t1, $v0 #colocar o que foi lido em t1
	
	sub $t2, $t0, $t1 #t2 = t0 - t1
	
	li $v0, 1 #printa na tela um inteiro
	move $a0, $t2 #coloca o t2 no registrado que imprime na tela
	syscall
	
	la $a0, new_line
      	li $v0, 4
      	syscall
	
	li $v0, 10
	syscall	

.data
	new_line: .asciiz  "\n"
