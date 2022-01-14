##complete the program below to print the array of numbers on the screen
##complete the program in the places where "WRITE CODE" is mentioned
## 4 lines of code need to be written to complete the program
            .data
list1: .word 10, 22, 45, 80, 60 			  #list1 is the name of the array (.word is used to initialize it)
size:  .word 5						  #to define list1, 20 bytes in the memory are stored since each number is 4 bytes 
str:   .asciiz "Array in MIPS\n"
            .text
main:
	    la	    $a0, str
	    li      $v0, 4 #print string
	    syscall

	    
            la      $t1, list1
            lw      $t3, size 				#load word is used here to since it is stored in the data memory
 
##print numbers
print_list:
            .data
space:    .asciiz "\n" #new-line between numbers
            .text
                  
            li      $t2, 0  #loop counter      
                 
printing_loop:
            beq     $t2, $t3, exit   #check if all numbers in the array are printed  
            
            lw 	    $a0, ($t1)      #get index of array         
            li      $v0, 1
            syscall
           
           la $a0, space
           li $v0, 4
           syscall
            
            addi    $t2, $t2, 1                   
            addi    $t1, $t1, 4                   
            j printing_loop  
            
exit:
            li          $v0, 10
            syscall                               

# END OF PROGRAM
