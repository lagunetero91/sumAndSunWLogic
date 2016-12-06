.include "./cs47_proj_macro.asm"
.text
.globl logical

#####################################################################
# Argument:
# 	$a0: First number
#	$a1: Second number
#	$a2: operation('+':add, '-':sub, '*':mul, '/':div)
# Return:
#	$v0: ($a0+$a1) | ($a0-$a1) | ($a0*$a1):LO | ($a0 / $a1)
# 	$v1: ($a0 * $a1):HI | ($a0 % $a1)
#####################################################################
logical:


	beq $a2, 43, logic_sum
	beq $a2, 45, logic_subs

	
#This is logic Sum	
logic_sum:	beq $a0, $zero, endSum
		and $t6, $a1, $a0
		xor $a1,$a1,$a0
		sll $t6,$t6,1
		add $a0,$t6,$zero	
		j logic_sum	
endSum:		add $v0,$zero,$a1
		j return
		
#This is logic substration. This is a normal sum withi second parameter negative.		
logic_subs:	neg $a1, $a1
		j logic_sum	
		

		

return:	jr	$ra