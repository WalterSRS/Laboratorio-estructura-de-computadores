.data
prompt1: .asciiz "Ingrese el primer número: "
prompt2: .asciiz "Ingrese el segundo número: "
prompt3: .asciiz "Ingrese el tercer número: "
result: .asciiz "El número mayor es: "

.text
.globl main

main:
    # Solicitar el primer número
    li $v0, 4
    la $a0, prompt1
    syscall
    li $v0, 5
    syscall
    move $t0, $v0

    # Solicitar el segundo número
    li $v0, 4
    la $a0, prompt2
    syscall
    li $v0, 5
    syscall
    move $t1, $v0

    # Solicitar el tercer número
    li $v0, 4
    la $a0, prompt3
    syscall
    li $v0, 5
    syscall
    move $t2, $v0

    # Comparar los números para encontrar el mayor
    move $t3, $t0      # $t3 = $t0 (primer número)
    blt $t1, $t3, check_second
    move $t3, $t1      # $t3 = $t1 (segundo número)

check_second:
    blt $t2, $t3, found_smallest

    # Si ninguno de los dos primeros números es mayor, $t2 es el mayor
    move $t3, $t2

found_smallest:
    # Mostrar el resultado
    li $v0, 4
    la $a0, result
    syscall

    li $v0, 1
    move $a0, $t3
    syscall

    # Terminar el programa
    li $v0, 10
    syscall
