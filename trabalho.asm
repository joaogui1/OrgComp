	.data
	.align 0

str_op:        .asciiz "\nDigite uma opção: "
str_valores:   .asciiz "Digite um numero: "
str_peso:      .asciiz "Digite o peso: "
str_altura:    .asciiz "Digite a altura: "
str_resp:      .asciiz "A resposta eh: "
str_error:     .asciiz "Entrada inválida. =(\n"
str_theend:    .asciiz "The end o/\n"
newline:       .asciiz "\n"

	.text
	.globl main

main:
	li	    $v0, 4						# imprime string da opção
	la      $a0, str_op
	syscall
	
	li      $v0, 5                      # le opção
	syscall
	
	addi    $t0, $zero, 0               # atribui 0 para registrador t0, que será utilizado para a comparação da opção
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
	beq     $v0, $t0, raiz              # op = 6 -> raiz quadrada de um número
	
	addi    $t0, $t0, 1                 # t0 = 7
	beq     $v0, $t0, tabuada           # op = 7 -> tabuada de um numero
	
	addi    $t0, $t0, 1                 # t0 = 8
	beq     $v0, $t0, imc               # op = 0 -> calcula imc
	
	addi    $t0, $t0, 1                 # t0 = 9
	beq     $v0, $t0, fatorial          # op = 9 -> calcula fatorial de um número
	
	addi    $t0, $t0, 1                 # t0 = 10
	beq     $v0, $t0, fibonacci         # op = 10 -> fibonacci de um intervalo

	addi    $t0, $t0, 1                 # t0 = 11
	beq     $v0, $t0, end               # op = 11 -> encerra programa
			
	j printErro                         # se valor for maior que 11, é impressa uma mensagem de erro

#---------------------------------------------------------------------------------------------#	
soma:	#op_code: 1
	li      $v0, 4                      # imprime mensagem para usuário entrar com valor
	la      $a0, str_valores
	syscall
	
	li      $v0, 5                      # lê valor
	syscall

	move    $a1, $v0                    # copia o valor entrado no registrador a1

	li      $v0, 4                      # imprime mensagem para usuário entrar com valor
	la      $a0, str_valores
	syscall
	
	li      $v0, 5                      # lê valor
	syscall

	move    $a2, $v0                    # copia o valor entrado no registrador a2
	
	add     $v0, $a1, $a2               # soma valores
	j printAns

#---------------------------------------------------------------------------------------------#		
subtracao: #op_code: 2
	li      $v0, 4                      # imprime mensagem para usuário entrar com valor
	la      $a0, str_valores
	syscall
	
	li      $v0, 5                      # lê valor
	syscall

	move    $a1, $v0                    # copia o valor entrado no registrador a1

	li      $v0, 4                      # imprime mensagem para usuário entrar com valor
	la      $a0, str_valores
	syscall
	
	li      $v0, 5                      # lê valor
	syscall

	move    $a2, $v0                    # copia o valor entrado no registrador a2
	
	sub     $v0, $a1, $a2               # subtrai valores
	j printAns

#---------------------------------------------------------------------------------------------#		
multiplicacao: #op_code: 3
	li      $v0, 4                      # imprime mensagem para usuário entrar com valor
	la      $a0, str_valores
	syscall
	
	li      $v0, 5                      # lê valor
	syscall

	move    $a1, $v0                    # copia o valor entrado no registrador a1

	li      $v0, 4                      # imprime mensagem para usuário entrar com valor
	la      $a0, str_valores
	syscall
	
	li      $v0, 5                      # lê valor
	syscall

	move    $a2, $v0                    # copia o valor entrado no registrador a2
	
	mul     $v0, $a1, $a2               # multiplica valores
	j printAns

#---------------------------------------------------------------------------------------------#		
divisao: #op_code: 4
	li      $v0, 4                      # imprime mensagem para usuário entrar com valor
	la      $a0, str_valores
	syscall
	
	li      $v0, 5                      # lê valor
	syscall

	move    $a1, $v0                    # copia o valor entrado no registrador a1

	li      $v0, 4                      # imprime mensagem para usuário entrar com valor
	la      $a0, str_valores
	syscall
	
	li      $v0, 5                      # lê valor
	syscall

	move    $a2, $v0                    # copia o valor entrado no registrador a2
	
	div     $v0, $a1, $a2               # divide valores
	j printAns

#---------------------------------------------------------------------------------------------#	
potencia: #op_code: 5

	li      $v0, 4                      # imprime mensagem para usuário entrar com valor
	la      $a0, str_valores
	syscall
	
	li      $v0, 5                      # lê valor
	syscall

	move    $a1, $v0                    # copia o valor entrado no registrador a1 (base)

	li      $v0, 4                      # imprime mensagem para usuário entrar com valor
	la      $a0, str_valores
	syscall
	
	li      $v0, 5                      # 2ê valor
	syscall

	move    $a2, $v0                    # copia o valor entrado no registrador a2 (expoente)
	
	addi $t0, $zero, 1		#t0 contem o resultado (inicializado como 0)
	add $t1, $zero, $a1		# salva uma c�pia da base em (t1)
	add $t2, $zero, $a2		#salva uma c�pia do expoente em (t2)
	
	Pot_loop:
	
		beq $t2, 0, End_Pot_Loop
		
			mul $t0, $t0, $t1		#multiplica t0 pela base
			addi $t2, $t2, -1		#decrementa quantas vezes o unmero ja foi multiplicado
		
		j Pot_loop
	
	End_Pot_Loop:
	
		move $v0, $t0
	
	j printAns

#---------------------------------------------------------------------------------------------#						
raiz: 		#op code 6
	li      $v0, 4                      # imprime mensagem para usuário entrar com valor
	la      $a0, str_valores
	syscall
	
	li      $v0, 5                      # lê valor
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

	li      $v0, 4                      # imprime mensagem para usuário entrar com valor
	la      $a0, str_valores
	syscall
	
	li      $v0, 5                      # lê valor
	syscall

	move    $a1, $v0                    # copia o valor entrado no registrador a1 (base)
	
	ble		$a1, $zero, printErro		# tratamento de erro, numeros negativos ou zero
	
	li		$v0, 4						# imprime mensagem de resposta
	la		$a0, str_resp
	syscall						
	
	li      $v0, 4                      #imprime \n
	la      $a0, newline
	syscall
	
	addi	$t0, $zero, 10				# contador da tabuada que vai decrementando
	addi	$t1, $zero, 0				# inicializa $t1 com 0
	
loopTabuada:	beqz $t0, main
	
	add		$t1, $t1, $a1				# carrega valor da tabuada em $t1
	
	li		$v0, 1						# imprime ($a1 * intera��o)
	add		$a0, $zero, $t1
	syscall
	
	li      $v0, 4                      #imprime \n
	la      $a0, newline
	syscall
	
	subi	$t0, $t0, 1					# decrementa contador
	j loopTabuada
#---------------------------------------------------------------------------------------------#						
imc:
	j printAns

#---------------------------------------------------------------------------------------------#						
fatorial:
	j printAns

#---------------------------------------------------------------------------------------------#						
fibonacci:
	j printAns
	
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
