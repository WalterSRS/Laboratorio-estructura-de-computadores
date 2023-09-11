.data
prompt1: .asciiz "Ingrese el primer n�mero: "
prompt2: .asciiz "Ingrese el segundo n�mero: "
prompt3: .asciiz "Ingrese el tercer n�mero: "
result: .asciiz "El n�mero menor es: "

.text
.globl main

main:
    # Solicitar el primer n�mero
    li $v0, 4
    la $a0, prompt1
    syscall
    li $v0, 5
    syscall
    move $t0, $v0

    # Solicitar el segundo n�mero
    li $v0, 4
    la $a0, prompt2
    syscall
    li $v0, 5
    syscall
    move $t1, $v0

    # Solicitar el tercer n�mero
    li $v0, 4
    la $a0, prompt3
    syscall
    li $v0, 5
    syscall
    move $t2, $v0

    # Comparar los n�meros para encontrar el menor
    move $t3, $t0      # $t3 = $t0 (primer n�mero)
    bgt $t1, $t3, check_second
    move $t3, $t1      # $t3 = $t1 (segundo n�mero)

check_second:
    bgt $t2, $t3, found_largest

    # Si ninguno de los dos primeros n�meros es menor, $t2 es el menor
    move $t3, $t2

found_largest:
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