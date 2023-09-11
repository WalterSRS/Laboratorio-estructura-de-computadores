.data
prompt: .asciiz "Ingrese el l�mite de la Serie Fibonacci: "
newline: .asciiz "\n"
result: .asciiz "Serie Fibonacci: "

.text
.globl main

main:
    # Solicitar al usuario el l�mite de la serie
    li $v0, 4
    la $a0, prompt
    syscall

    # Leer el l�mite ingresado por el usuario
    li $v0, 5
    syscall
    move $t2, $v0  # Almacenar el l�mite en $t2

    # Inicializar variables
    li $t0, 0         # N�mero actual
    li $t1, 1         # Siguiente n�mero

    # Imprimir mensaje inicial
    li $v0, 4
    la $a0, result
    syscall

loop:
    # Imprimir el n�mero actual
    li $v0, 1
    move $a0, $t0
    syscall

    # Imprimir un salto de l�nea
    li $v0, 4
    la $a0, newline
    syscall

    # Calcular el siguiente n�mero de Fibonacci
    add $t3, $t0, $t1   # $t3 = $t0 + $t1
    move $t0, $t1       # $t0 = $t1
    move $t1, $t3       # $t1 = $t3

    # Decrementar el contador y verificar si alcanzamos el l�mite
    subi $t2, $t2, 1
    bnez $t2, loop

    # Terminar el programa
    li $v0, 10
    syscall
