# outputs squre root in base 10, algorithim and magic numbers stolen from slides.
# modified lab4 code given
	.text
	addi $1, $0, 0		
	addi $3, $0, 512	
	jal loop		
loop:	add $2, $1, $3		
	srl $2, $2, 1	
	beq $2, $1, exit	
	multu $2, $2		
	mflo $4			
	sub $4, $30, $4		
	bgez $4, next		
	add $3, $0, $2		
	j loop			
next:	beq $4, $0, exit	
	add $1, $0, $2		
	jr $31			
exit:	sll $7, $2, 23		
	lui $1, 0		
	lui $3, 127		
	ori $3, $3, 65535	
loop1:	addu $2, $1, $3		
	srl $2, $2, 1		
	beq $2, $1, exit1	
	or $4, $2, $7		
	multu $4, $4		
	mfhi $4			
	sll $5, $4, 18		
	srl $4, $4, 14		
	sltu $6, $4, $30	
	bne $6, $0, min	
	bne $4, $30, max	
	mflo $6			
	srl $6, $6, 14		
	or $5, $5, $6		
	beq $5, $0, exit1	
max:	ori $3, $2, 0		
	j loop1			
min:	ori $1, $2, 0		
	j loop1			
exit1: or $7, $2, $7		
	bne $0, $30, loop2	
	andi $7, $7, 0	
loop2:  lui $1, 1		
	ori $1, $1, 34464	
	multu $7, $1		
	mfhi $1			
	mflo $2			
	srl $2, $2, 22		
	andi $3, $2, 1	
	beq $3, $0, loop3	
	addi $2, $2, 2		
loop3:	srl $2, $2, 1		
	sll $1, $1, 9		
	or $1, $1, $2		
	addi $15, $0, 0		
	lui $11, 6553		
	ori $11, $11, 39322	
	ori $7, $0, 10		
	ori $12, $0, 1		
	ori $13, $0, 9		
loop4:	multu $1, $11		
	mflo $3			
	mfhi $1			
	multu $3, $7		
	mfhi $3			
	ori $14, $0, 1		
inner:	beq $14, $12, outer	
	sll $3, $3, 4		
	addi $14, $14, 1	
	j inner			
outer: or $15, $15, $3		
	addi $12, $12, 1	
	bne $12, $13, loop4	
	or $30, $15, $0		

