.data
array: .word 10, 22, 45, 80, 60, 82, 77, 63, 25, 93
arraysort: .word
size: .word 10
unsort: .asciiz "Unsorted array: "
sort: .asciiz "\nSorted array: "
space: .asciiz " "
 .text
 
 #defining variables
move $t4, $0			#printing counter
la $t0, array			#Contains the array
lw $t1, 0($t0) 			#temp 1
lw $t2, 4($t0) 			#temp2 
li $t3, 0 			#inside counter
li $t5, 0			#outside counter

#printing the unsorted array
la $a0, unsort
li $v0, 4
syscall


fake_print:
 beq $t4, 10, start 		#check if all numbers in the array are printed

 lw $a0, ($t0)			 #pointer pointing to a specific index of an array
 li $v0, 1
 syscall

 la $a0, space
 li $v0, 4
 syscall

 addi $t4, $t4, 1
 addi $t0, $t0, 4 
j fake_print

start:
subi $t0, $t0, 40
move $t4, $0

loop:
beq $t3, 10, iterdone
	blt $t1, $t2, swap
	addi $t0 ,$t0, 4
	lw $t1,0($t0)
	lw $t2,4($t0)
	addi $t3, $t3, 1
	j loop

swap:
sw $t1, 4($t0)									#array[x+1] = $t1 
sw $t2, 0($t0)									#array[x] = $t2
addi $t0, $t0, 4								#increase index of array by 1
lw $t1, 0($t0)									#$t1= array[counter]
lw $t2, 4($t0)									#$t1=array[counternum+1]
addi $t3, $t3, 1								#add 1 to the counter.

j loop
 
 
#Excute after an entire 10 loops occur
iterdone:
subi $t0, $t0, 40								#Reset array to index 0
lw $t1, 0($t0)									#set $t1 back to array[1]
lw $t2, 4($t0)									#set $t2 back to array[2]
move $t3, $0									#set inner counter to 0
beq $t5, 10, printing_loop						#stops looping and prints array if it had looped 10 times
addi $t5, $t5 ,1								#add 1 to outer coutner
j loop


#print string
printing_loop:	
la $a0, sort
li $v0, 4
syscall


real_print:
 beq $t4, 10, exit 		#check if all numbers in the array are printed

 lw $a0, ($t0)			 #pointer pointing to a specific index of an array
 li $v0, 1
 syscall

 la $a0, space
 li $v0, 4
 syscall

 addi $t4, $t4, 1
 addi $t0, $t0, 4 
j real_print


exit:
li $v0, 10 #terminate program
syscall
