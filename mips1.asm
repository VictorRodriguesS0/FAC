.data
	inputText: .asciiz "Digite um numero: "

.text
	# Printar na tela
	li $v0, 4 # 4 é pra printar na tela
	la $a0, inputText #Carrega valores para o a0
	syscall
	
	
	# Ler um inteiro
	li $v0, 5 # 5 é pra ler um inteiro
	syscall
	move $a0, $v0 # Passa o valor inteiro lido acima, pra dentro de a0
	
	rem $t1, $a0, 2 # divide o numero por 2 e coloca o resto em t1
	
	
	beq $t1,$zero, paridade  # se o numero for par, vai para label paridade
	
	srl $t1, $a0, 1
	
	li $v0, 1 #imprime na tela o valor armzenado em a0
	syscall
	
paridade:
	