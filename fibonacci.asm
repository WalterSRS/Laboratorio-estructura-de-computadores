.data
prompt: .asciiz "Ingrese el límite de la Serie Fibonacci: "
newline: .asciiz "\n"
result: .asciiz "Serie Fibonacci: "

.text
.globl main

main:
    # Solicitar al usuario el límite de la serie
    li $v0, 4
    la $a0, prompt
    syscall

    # Leer el límite ingresado por el usuario
    li $v0, 5
    syscall
    move $t2, $v0  # Almacenar el límite en $t2

    # Inicializar variables
    li $t0, 0         # Número actual
    li $t1, 1         # Siguiente número

    # Imprimir mensaje inicial
    li $v0, 4
    la $a0, result
    syscall

loop:
    # Imprimir el número actual
    li $v0, 1
    move $a0, $t0
    syscall

    # Imprimir un salto de línea
    li $v0, 4
    la $a0, newline
    syscall

    # Calcular el siguiente número de Fibonacci
    add $t3, $t0, $t1   # $t3 = $t0 + $t1
    move $t0, $t1       # $t0 = $t1
    move $t1, $t3       # $t1 = $t3

    # Decrementar el contador y verificar si alcanzamos el límite
    subi $t2, $t2, 1
    bnez $t2, loop

    # Terminar el programa
    li $v0, 10
    syscall
