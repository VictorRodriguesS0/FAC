.text
main:
	li $v0, 5		#Ler inteiro
	syscall			#Chamada de sistema
	move $t0, $v0		#armazena o valor lido em t1
	
	
	b carregaValores
	
faixa:
	bge $t0, 101, faixa4	#Se t1 >= 101 entra na faixa 4
	#bge $t0, 31, faixa3	#Se t1 >= 31 entra na faixa 3
	#bge $t0, 11, faixa2	#Se t1 >= 11 entra na faixa 2
	#bge $t0, 0, faixa1	#Se t1 >= 0 entra na faixa 1

faixa4:	
	bgt $t0, 101, incrementa5	#Se t0 > 101, incrementa 5 reais no valor da conta
	
	move $a0, $t4	#
	li $v0, 1	# Imprime o valor total
	syscall		#
	
	
incrementa5:
	add $t4, $t4, 5		#incrementa 5 e decrementa 1
	sub $t0, $t0, 1
	b faixa4

carregaValores:
	li $t4, 167		#coloca o valor das faixas anteriores
	li $t3, 27
	li $t2, 7
	li $t1, 7
	b faixa