.text

main:
	li $v0, 5	#Ler um inteiro
	syscall		#chamada do sistema
	move $t1, $v0	#armazenar o valor lido em t1
	
	bgtz $t1, qualimprimir #Se numero maior que 0, entra em qualImprimir

qualimprimir:
	bge $t1, 86, imprimeA 	#imprime A se t1 >= 86
	bge $t1, 61, imprimeB	#imprime B se t1 >= 61
	bge $t1, 36, imprimeC	#imprime C se t1 >= 36
	bge $t1, 1, imprimeD	#imprime D se t1 >= 1
	beqz $t1, imprimeE	#imprime E se t1 >= 0
	
imprimeA:
	la  $a0, A	#armazena string a em a0
	li $v0, 4	#imprime string na tela
	syscall		#Chama do sistema
	b fim		#finaliza o programa
imprimeB:
	la  $a0, B
	li $v0, 4
	syscall
	b fim
imprimeC:
	la  $a0, C
	li $v0, 4
	syscall
	b fim
imprimeD:
	la  $a0, D
	li $v0, 4
	syscall
	b fim

imprimeE:
	la  $a0, E
	li $v0, 4
	syscall
	b fim
fim: 
	li $v0, 10
	syscall

.data
	A: .asciiz "A\n"
	B: .asciiz "B\n"
	C: .asciiz "C\n"
	D: .asciiz "D\n"
	E: .asciiz "E\n"