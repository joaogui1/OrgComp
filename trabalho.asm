	.data
	.align 0

str_op:        .asciiz "\nDigite uma opcao: "
str_valores:   .asciiz "Digite um numero: "
str_peso:      .asciiz "Digite o peso: "
str_altura:    .asciiz "Digite a altura: "
str_resp:      .asciiz "A resposta eh: "
str_error:     .asciiz "Entrada invalida. =(\n"
str_theend:    .asciiz "The end o/\n"
str_space:	   .asciiz " "
newline:       .asciiz "\n"

	.text
	.globl main

main:
	li	    $v0, 4						# imprime string da opcao
	la      $a0, str_op
	syscall
	
	li      $v0, 5                      # le opcao
	syscall
	
	addi    $t0, $zero, 0               # atribui 0 para registrador t0, que sera utilizado para a camparacao da opcao
	beq     $v0, $t0, end               # op = 0 -> encerra programa
	
	addi    $t0, $t0, 1                 # t0 = 1
	beq     $v0, $t0, soma			    # op = 1 -> soma de dois numeros
	
	addi    $t0, $t0, 1                 # t0 = 2
	beq     $v0, $t0, subtracao         # op = 2 -> subtrai dois numeros
	
	addi    $t0, $t0, 1                 # t0 = 3
	beq     $v0, $t0, multiplicacao     # op = 3 -> multiplica dois numeros
	
	addi    $t0, $t0, 1                 # t0 = 4
	beq     $v0, $t0, divisao           # op = 4 -> divide dois numeros
	
	addi    $t0, $t0, 1                 # t0 = 5
	beq     $v0, $t0, potencia          # op = 5 -> potencia 
	
	addi    $t0, $t0, 1                 # t0 = 6
	beq     $v0, $t0, raiz              # op = 6 -> raiz quadrada de um numero
	
	addi    $t0, $t0, 1                 # t0 = 7
	beq     $v0, $t0, tabuada           # op = 7 -> tabuada de um numero
	
	addi    $t0, $t0, 1                 # t0 = 8
	beq     $v0, $t0, imc               # op = 0 -> calcula imc
	
	addi    $t0, $t0, 1                 # t0 = 9
	beq     $v0, $t0, fatorial          # op = 9 -> calcula fatorial de um numero
	
	addi    $t0, $t0, 1                 # t0 = 10
	beq     $v0, $t0, fibonacci         # op = 10 -> fibonacci de um intervalo

	addi    $t0, $t0, 1                 # t0 = 11
	beq     $v0, $t0, end               # op = 11 -> encerra programa
			
	j printErro                         # se valor for maior que 11, sera impressa uma mensagem de erro

#---------------------------------------------------------------------------------------------#	
soma:	#op_code: 1
	li      $v0, 4                      # imprime mensagem para usuario entrar com valor
	la      $a0, str_valores
	syscall
	
	li      $v0, 5                      # le valor
	syscall

	move    $a1, $v0                    # copia o valor entrado no registrador a1

	li      $v0, 4                      # imprime mensagem para usuario entrar com valor
	la      $a0, str_valores
	syscall
	
	li      $v0, 5                      # le valor
	syscall

	move    $a2, $v0                    # copia o valor entrado no registrador a2
	
	add     $v0, $a1, $a2               # soma valores
	j printAns

#---------------------------------------------------------------------------------------------#		
subtracao: #op_code: 2
	li      $v0, 4                      # imprime mensagem para usuario entrar com valor
	la      $a0, str_valores
	syscall
	
	li      $v0, 5                      # le valor
	syscall

	move    $a1, $v0                    # copia o valor entrado no registrador a1

	li      $v0, 4                      # imprime mensagem para usuario entrar com valor
	la      $a0, str_valores
	syscall
	
	li      $v0, 5                      # le valor
	syscall

	move    $a2, $v0                    # copia o valor entrado no registrador a2
	
	sub     $v0, $a1, $a2               # subtrai valores
	j printAns

#---------------------------------------------------------------------------------------------#		
multiplicacao: #op_code: 3
	li      $v0, 4                      # imprime mensagem para usuario entrar com valor
	la      $a0, str_valores
	syscall
	
	li      $v0, 5                      # le valor
	syscall

	move    $a1, $v0                    # copia o valor entrado no registrador a1

	li      $v0, 4                      # imprime mensagem para usuario entrar com valor
	la      $a0, str_valores
	syscall
	
	li      $v0, 5                      # le valor
	syscall

	move    $a2, $v0                    # copia o valor entrado no registrador a2
	
	mul     $v0, $a1, $a2               # multiplica valores
	j printAns

#---------------------------------------------------------------------------------------------#		
divisao: #op_code: 4
	li      $v0, 4                      # imprime mensagem para usuario entrar com valor
	la      $a0, str_valores
	syscall
	
	li      $v0, 5                      # le valor
	syscall

	move    $a1, $v0                    # copia o valor entrado no registrador a1

	li      $v0, 4                      # imprime mensagem para usuario entrar com valor
	la      $a0, str_valores
	syscall
	
	li      $v0, 5                      # le valor
	syscall

	move    $a2, $v0                    # copia o valor entrado no registrador a2
	
	div     $v0, $a1, $a2               # divide valores
	j printAns

#---------------------------------------------------------------------------------------------#	
potencia: #op_code: 5

	li      $v0, 4                      # imprime mensagem para usuario entrar com valor
	la      $a0, str_valores
	syscall
	
	li      $v0, 5                      # le valor
	syscall

	move    $a1, $v0                    # copia o valor entrado no registrador a1 (base)

	li      $v0, 4                      # imprime mensagem para usuario entrar com valor
	la      $a0, str_valores
	syscall
	
	li      $v0, 5                      # le valor
	syscall

	move    $a2, $v0                    # copia o valor entrado no registrador a2 (expoente)
	
	addi    $t0, $zero, 1               # t0 ser� utilizado para compara��o do final do loop

potLoop:
	beq     $a2, $t0, printAns          # enquanto expoente != 1
	mul     $v0, $v0, $a1               # multiplica a base
	subi    $a2, $a2, 1                 # subtrai 1 do expoente
	j potLoop                           # volta para o loop

#---------------------------------------------------------------------------------------------#						
raiz: 		#op code 6
	li      $v0, 4                      # imprime mensagem para usuario entrar com valor
	la      $a0, str_valores
	syscall
	
	li      $v0, 5                      # le valor
	syscall

	move    $a1, $v0                    # copia o valor entrado no registrador a1 (base) = n
	move	$a2, $a1					# copia o valor entrado no registrador a2 (auxiliar) = x
	
	blt		$a1, $zero, printErro		# tratamento de erro, numeros negativos
	
	srl		$t1, $a1, 1					# faz shift para a direita dos bits de $a1 e armazena em $t1 (divisao por 2)
										# $t1 sera variavel de comparacao para finalizar loop		
	addi	$t0, $zero, 0				# contador de interacoes inicializado com 0
	
loopRaiz:	beq	$t1, $t0, endLoopRaiz
	
	div		$t3, $a1, $a2				# t3 = n / x
	add 	$a2, $a2, $t3				# x = x + $t3
	srl		$a2, $a2, 1					# x = x / 2
	
    addi	$t0, $t0, 1					# incrementa contador
	j loopRaiz
	
endLoopRaiz:	

	add		$v0, $zero, $a2
	j printAns

#---------------------------------------------------------------------------------------------#						
tabuada:	#op code 7

	li      $v0, 4                      # imprime mensagem para usuario entrar com valor
	la      $a0, str_valores
	syscall
	
	li      $v0, 5                      # le valor
	syscall

	move    $a1, $v0                    # copia o valor entrado no registrador a1 (base)
	
	ble		$a1, $zero, printErro		# tratamento de erro, numeros negativos ou zero
	
	li		$v0, 4						# imprime mensagem de resposta
	la		$a0, str_resp
	syscall						
	
	li      $v0, 4                      # imprime \n
	la      $a0, newline
	syscall
	
	addi	$t0, $zero, 10				# contador da tabuada que vai decrementando
	addi	$t1, $zero, 0				# inicializa $t1 com 0
	
loopTabuada:	
	beqz    $t0, main                   # ao encerrar a tabuada, volta para loop   

	add		$t1, $t1, $a1				# carrega valor da tabuada em $t1
	
	li		$v0, 1						# imprime ($a1 * intera��o)
	add		$a0, $zero, $t1
	syscall
	
	li      $v0, 4                      # imprime \n
	la      $a0, newline
	syscall
	
	subi	$t0, $t0, 1					# decrementa contador
	j loopTabuada

#---------------------------------------------------------------------------------------------#						
imc:
	j printAns

#---------------------------------------------------------------------------------------------#						
fatorial:
	li      $v0, 4                      # imprime mensagem para usu�rio entrar com valor
	la      $a0, str_valores
	syscall
	
	li      $v0, 5                      # l� valor
	syscall

	move    $a0, $v0                    # copia o valor entrado no registrador a0
	jal funcFat                         # chama fun��o do fatorial
	
	j printAns

funcFat:
	addi     $sp, $sp, -8               # reserva espa�o na pilha
	sw       $a0, 0($sp)                # salva a0 (n) na pilha
	sw       $ra, 4($sp)                # salva o endere�o de retorno na pilha
	
	beq      $a0, $zero, return1        # if (n == 0) return 1
	subi     $a0, $a0, 1                # n = n-1
	jal funcFat                         # chamada recursiva
	
	addi      $a0, $a0, 1               # soma 1 no valor que foi recuperado da pilha
	mul       $v0, $v0, $a0             # n * fat(n-1)
	j return                            # volta na recurs�o

return1:
    addi     $v0, $zero, 1

return: 
	lw       $a0, 0($sp)                # recupera a0 (n)
	lw       $ra, 4($sp)                # recupera ra
	addi     $sp, $sp, 8                # desempilha
	jr       $ra                        # volta para fun��o que chamou essa

#---------------------------------------------------------------------------------------------#						
fibonacci:
	li	$v0	5
	syscall 							#le o menor numero
	move $s0	$v0 					#guarda o primeiro numero em s0
	
	li	$v0	5
	syscall 							#le o maior numero
	move $s1	$v0						#guarda o maior numero em s1
		
	jal fib 							#chama o procedimento fibonacci
	
	j main
	
fib:
	addi	$sp	$sp	-12
	sw	$ra	8($sp)
	sw	$s1	4($sp)
	sw	$s0	0($sp)
	
	addi	$a2	$a2	0 					#a2 guarda o fib a ser impresso
	addi	$a1	$a1	1 					#a1 guarda o numero de fibonacci anterior ao a2
	
loopfib:	beq  $a2	$s1	endfib 		#se o a2 alcancou o valor maximo vai para o fim da funcao
	add	$a2	$a2	$a1						#calcula o proximo fib
	sub $a1	$a2	$a1 					#a1 fica com o valor do fib anterior
	
	bge	$a2	$s0	print 					#se o a2 é maior que o minimo valor a ser impresso, imprime ele
	j loopfib

print:
	li $v0	1
	move	$a0	$a2
	syscall 							#imprime o valor guardado em a2
	
	la	$a0	str_space
	li	$v0	4
	syscall 							#imprime um espaco
	
	j	loopfib

endfib:
	lw	$s0	0($sp)
	lw	$s1	4($sp)
	lw	$ra	8($sp) 						#desempilha os valores
	addi	$sp	$sp	12 					#retorna o stack poonter para a posicao original
	jr	$ra 							#return

	
#---------------------------------------------------------------------------------------------#						
printAns:
	move    $a1, $v0                    # salva no a1 o valor a ser impresso
	
	li      $v0, 4                      # imprime mensagem da resposta
	la      $a0, str_resp
	syscall
	
	move    $a0, $a1                    # salva valor a ser impresso em a0
	li      $v0, 1                      # imprime resposta
	syscall
	
	li      $v0, 4                      #imprime \n
	la      $a0, newline
	syscall
	
	j main                              # volta para a main

#---------------------------------------------------------------------------------------------#
printErro:
	li      $v0, 4                      # imprime mensagem de erro
	la      $a0, str_error
	syscall

	li      $v0, 4                      #imprime \n
	la      $a0, newline
	syscall

	j main
	
#---------------------------------------------------------------------------------------------#						
end:
	li      $v0, 4
	la      $a0, str_theend
	syscall
	
	li      $v0, 10
	syscall
