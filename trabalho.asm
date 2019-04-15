	.data
	.align 0

str_menu1:	   .asciiz "Menu:\n 1 - Soma\n2 - Subtracao\n"
str_menu2:	   .asciiz "3 - Multiplicacao\n4 - Divisao\n5 - Potencia\n"
str_menu3:     .asciiz "6 - Raiz Quadrada\n7 - Tabuada\n8 - IMC\n"
str_menu4:	   .asciiz "9 - Fatorial\n10 - Fibonacci de um intervalo\n11 para sair do programa\nDigite uma opcao: \n"
str_entrada:   .asciiz "Digite um numero: "
str_peso:      .asciiz "Digite o peso: "
str_altura:    .asciiz "Digite a altura: "
str_resp:      .asciiz "A resposta eh: "
str_error:     .asciiz "Entrada invalida. =(\n"
str_theend:    .asciiz "Valeu, Bola o/\n"
str_space:	   .asciiz " "
newline:       .asciiz "\n"

	.text
	.globl main

main:
	li	    $v0, 4						# imprime primeira string do menu
	la      $a0, str_menu1
	syscall
	
	li	    $v0, 4						# imprime segunda string do menu
	la      $a0, str_menu2
	syscall
	
	li	    $v0, 4						# imprime terceira string do menu
	la      $a0, str_menu3
	syscall

	li	    $v0, 4						# imprime quarta string do menu
	la      $a0, str_menu4
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
	la      $a0, str_entrada
	syscall
	
	li      $v0, 5                      # le valor
	syscall

	move    $a1, $v0                    # copia o valor entrado no registrador a1

	li      $v0, 4                      # imprime mensagem para usuario entrar com valor
	la      $a0, str_entrada
	syscall
	
	li      $v0, 5                      # le valor
	syscall

	move    $a2, $v0                    # copia o valor entrado no registrador a2
	
	add     $v0, $a1, $a2               # soma valores
	j printAns


#---------------------------------------------------------------------------------------------#		
subtracao: #op_code: 2
	li      $v0, 4                      # imprime mensagem para usuario entrar com valor
	la      $a0, str_entrada
	syscall
	
	li      $v0, 5                      # le valor
	syscall

	move    $a1, $v0                    # copia o valor entrado no registrador a1

	li      $v0, 4                      # imprime mensagem para usuario entrar com valor
	la      $a0, str_entrada
	syscall
	
	li      $v0, 5                      # le valor
	syscall

	move    $a2, $v0                    # copia o valor entrado no registrador a2
	
	sub     $v0, $a1, $a2               # subtrai valores
	j printAns


#---------------------------------------------------------------------------------------------#		
multiplicacao: #op_code: 3
	li      $v0, 4                      # imprime mensagem para usuario entrar com valor
	la      $a0, str_entrada
	syscall
	
	li      $v0, 5                      # le valor
	syscall

	move    $a1, $v0                    # copia o valor entrado no registrador a1

	li      $v0, 4                      # imprime mensagem para usuario entrar com valor
	la      $a0, str_entrada
	syscall
	
	li      $v0, 5                      # le valor
	syscall

	move    $a2, $v0                    # copia o valor entrado no registrador a2
	
	addi	$a3, $zero, 32767			# copia o maior valor positivo de 16 bits para a3
	
	bgt		$a1, $a3, printErro			# verifica se a1 tem mais de 16 bits
	bgt		$a2, $a3, printErro			# verifica se a2 tem mais de 16 bits
	
	addi	$a3, $zero, -32768			# copia o maior valor negativo de 16 bits para a4
	
	blt		$a1, $a3, printErro			# verifica se a1 tem mais de 16 bits
	blt		$a2, $a3, printErro			# verifica se a2 tem mais de 16 bits
	
	mul     $v0, $a1, $a2               # multiplica valores
	j printAns


#---------------------------------------------------------------------------------------------#		
divisao: #op_code: 4
	li      $v0, 4                      # imprime mensagem para usuario entrar com valor
	la      $a0, str_entrada
	syscall
	
	li      $v0, 5                      # le valor do dividendo
	syscall

	move    $a1, $v0                    # copia o valor entrado no registrador a1

	li      $v0, 4                      # imprime mensagem para usuario entrar com valor
	la      $a0, str_entrada
	syscall
	
	li      $v0, 5                      # le valor do divisor
	syscall

	move    $a2, $v0                    # copia o valor entrado no registrador a2
	
	addi	$a3, $zero, 32767			# copia o maior valor positivo de 16 bits para a3
	
	beqz 	$a2, printErro 				# divisor igual a 0, erro
	bgt		$a1, $a3, printErro			# verifica se a1 tem mais de 16 bits
	bgt		$a2, $a3, printErro			# verifica se a2 tem mais de 16 bits

	addi	$a3, $zero, -32768			# copia o maior valor negativo de 16 bits para a3
	
	blt		$a1, $a3, printErro			# verifica se a1 tem mais de 16 bits
	blt		$a2, $a3, printErro			# verifica se a2 tem mais de 16 bits
	
	div     $v0, $a1, $a2               # divide valores
	j printAns


#---------------------------------------------------------------------------------------------#	
potencia: #op_code: 5

	li      $v0, 4                      # imprime mensagem para usuario entrar com valor
	la      $a0, str_entrada
	syscall
	
	li      $v0, 5                      # le valor da base
	syscall

	move    $a1, $v0                    # copia o valor entrado no registrador a1 (base)

	li      $v0, 4                      # imprime mensagem para usuario entrar com valor
	la      $a0, str_entrada
	syscall
	
	li      $v0, 5                      # le valor do expoente
	syscall

	move    $a2, $v0                    # copia o valor entrado no registrador a2 (expoente)
	
	addi    $t0, $zero, 1               # t0 sera utilizado para comparacoo do final do loop
	addi	$v0, $zero, 1				# v0 (resposta) comeca com 1

	blt		$a2, $zero, printErro		# se exponte for negativo, erro

potLoop:
	blt     $a2, $t0, printAns          # enquanto expoente > 1
	mul     $v0, $v0, $a1               # multiplica a base
	subi    $a2, $a2, 1                 # subtrai 1 do expoente
	j potLoop                           # volta para o loop


#---------------------------------------------------------------------------------------------#						
raiz: 		#op code 6
	li      $v0, 4                      # imprime mensagem para usuario entrar com valor
	la      $a0, str_entrada
	syscall
	
	li      $v0, 5                      # le valor da base
	syscall

	move    $a1, $v0                    # copia o valor entrado no registrador a1 (base) = n
	move	$a2, $a1					# copia o valor entrado no registrador a2 (auxiliar) = x
	
	blt		$a1, $zero, printErro		# tratamento de erro, numeros negativos
	
	srl		$t1, $a1, 1					# faz shift para a direita dos bits de $a1 e armazena em $t1 (divisao por 2)
										# $t1 sera variavel de comparacao para finalizar loop		
	addi	$t0, $zero, 0				# contador de interacoes inicializado com 0
	
loopRaiz:	
	beq		$t1, $t0, endLoopRaiz
	
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
	la      $a0, str_entrada
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
	li 		$v0, 4 						# pede para o usuário o peso
 	la 		$a0, str_peso
 	syscall
 
	li 		$v0, 6 						# recebe o peso
	syscall     						# e move para a1
	mov.s 	$f1, $f0   					# (f1 = peso)
	
	mtc1    $zero, $f4 
	c.lt.s 	$f1, $f4  
	bc1t	printErro		# peso <= zero, erro

	li 		$v0, 4 						# pede para o usuário a altura
	la 		$a0, str_altura
	syscall
	 
	li 		$v0, 6 						# recebe a altura
	syscall     						# e move para f2
	mov.s 	$f2, $f0    				# (f2 = altura)

	c.lt.s 	$f2, $f4
	bc1t	printErro		# altura <= zero, erro
	 
	mul.s 	$f3, $f2, $f2   			# calcula altura^2 e atribui a f3
	 
	div.s 	$f0, $f1, $f3  				# divide a altura (f3) pelo peso (f1) e atribui a f0
	 
	li      $v0, 4    	                # imprime mensagem da resposta
	la      $a0, str_resp
	syscall
	 
	mov.s 	$f12, $f0                   # salva valor a ser impresso em f12
	li  	$v0, 2                      # imprime resposta
	syscall
	 
	li 	     $v0, 4                     # imprime \n
	la  	 $a0, newline
	syscall
	 
	j main								# volta para a main

#---------------------------------------------------------------------------------------------#						
fatorial:
	li      $v0, 4                      # imprime mensagem para usuario entrar com valor
	la      $a0, str_entrada
	syscall
	
	li      $v0, 5                      # le valor (base)
	syscall

	move    $a0, $v0                    # copia o valor entrado no registrador a0
	jal funcFat                         # chama funcao do fatorial
	
	blt		$a0, $zero, printErro		# se base < 0, erro

	j printAns

funcFat:
	addi     $sp, $sp, -8               # reserva espaco na pilha
	sw       $a0, 0($sp)                # salva a0 (n) na pilha
	sw       $ra, 4($sp)                # salva o endereco de retorno na pilha
	
	beq      $a0, $zero, return1        # if (n == 0) return 1
	subi     $a0, $a0, 1                # n = n-1
	jal funcFat                         # chamada recursiva
	
	addi      $a0, $a0, 1               # soma 1 no valor que foi recuperado da pilha
	mul       $v0, $v0, $a0             # n * fat(n-1)
	j return                            # volta na recursao

return1:
    addi     $v0, $zero, 1

return: 
	lw       $a0, 0($sp)                # recupera a0 (n)
	lw       $ra, 4($sp)                # recupera ra
	addi     $sp, $sp, 8                # desempilha
	jr       $ra                        # volta para funcao que chamou essa


#---------------------------------------------------------------------------------------------#						
fibonacci:
	li      $v0, 4                      # imprime mensagem para usuario entrar com valor (primeiro do range)
	la      $a0, str_entrada
	syscall

	li		$v0, 5
	syscall 							# le o menor numero
	move 	$a1, $v0 					# guarda o primeiro numero em a0
	
	blt		$a1, $zero, printErro		# se o range tiver numeros negativos, erro

	li      $v0, 4                      # imprime mensagem para usuario entrar com valor (segundo do range)
	la      $a0, str_entrada
	syscall

	li		$v0, 5
	syscall 							# le o maior numero
	move 	$a2, $v0					# guarda o maior numero em a1
	
	blt		$a2, $a1, printErro			# se o range tiver o segundo extremo menor que o primeiro, erro

	jal fib 							# chama o procedimento fibonacci
	
	j main								# após a funcao, retorna para a main
	
fib:
	addi	$sp, $sp, -12				# move ponteiro da pilha
	sw		$ra, 8($sp)					# salva endereco de retorno
	sw		$a2, 4($sp)					# salva
	sw		$a1, 0($sp)
	
	addi	$t0, $zero, 0 				# t0 guarda o fib a ser impresso
	addi	$t1, $zero, 1 				# t1 guarda o numero de fibonacci anterior ao t0
	addi	$t2, $zero, 0					# t2 guarda o índice do fibonacci atual
	
loopfib:	
	bge  	$t2, $a2, endFib 		    # se o t2 alcancou o valor maximo, vai para o fim da funcao
	add		$t0, $t0, $t1				# calcula o proximo fib
	sub 	$t1, $t0, $t1				# t1 fica com o valor do fib anterior
	addi	$t2, $t2, 1
		
	bge		$t2, $a1, printFib 			# se o t0 é maior que o minimo valor a ser impresso, imprime ele
	j loopfib

printFib:
	li 		$v0, 1						# imprime o valor guardado em t0, que eh o fib atual
	move	$a0, $t0
	syscall 							
	
	la	$a0	str_space					# imprime um espaco
	li	$v0	4
	syscall 							
	
	j	loopfib							# volta para o loop

endFib:
	la	$a0, newline					# imprime um '\n'
	li	$v0, 4
	syscall 	

	lw	$a1	0($sp)						# desempilha os valores
	lw	$a2	4($sp)
	lw	$ra	8($sp) 						
	addi	$sp	$sp	12 					# retorna o stack pointer para a posicao original
	jr	$ra 							# returna para o endereco especificado (nesse caso, a main)

	
#---------------------------------------------------------------------------------------------#						
printAns:
	move    $a1, $v0                    # salva no a1 o valor a ser impresso
	
	li      $v0, 4                      # imprime mensagem da resposta
	la      $a0, str_resp
	syscall
	
	move    $a0, $a1                    # salva valor a ser impresso em a0
	li      $v0, 1                      # imprime resposta
	syscall
	
	li      $v0, 4                      # imprime \n
	la      $a0, newline
	syscall
	
	j main                              # volta para a main


#---------------------------------------------------------------------------------------------#
printErro:
	li      $v0, 4                      # imprime mensagem de erro
	la      $a0, str_error
	syscall

	li      $v0, 4                      # imprime \n
	la      $a0, newline
	syscall

	j main								# retorna para a main

	
#---------------------------------------------------------------------------------------------#						
end:
	li      $v0, 4						# imprime mensagem do fim
	la      $a0, str_theend
	syscall
	
	li      $v0, 10						# encerra execucao
	syscall
