/*
 *    Second assembly program
 *    This program uses Linux syscall
 *    in order to write a string to the console
 */

.global	_start

.text
_start:
    /* Write user prompt 				*/
    movl  	$4,		%eax	/* sys write 	*/
    movl  	$1, 		%ebx	/* fd		*/
    movl  	$msg_get, 	%ecx	/* buffer	*/
    movl  	$len_get, 	%edx	/* count	*/
    int   	$0x80			/* syscall	*/

    /* Read input and store 				*/
    movl	$3,		%eax
    movl	$1, 		%ebx
    movl	$num,		%ecx
    movl	$5,		%edx
    int		$0x80

    /* Write output message 				*/
    movl  	$4,		%eax	/* sys write 	*/
    movl  	$1,		%ebx	/* fd		*/
    movl  	$msg_put, 	%ecx	/* buffer	*/
    movl  	$len_put, 	%edx	/* count	*/
    int   	$0x80			/* syscall	*/

    /* Write the stored number 				*/
    movl  	$4, 		%eax	/* sys write 	*/
    movl  	$1, 		%ebx	/* fd		*/
    movl  	$num, 		%ecx	/* buffer	*/
    movl  	$5, 		%edx	/* count	*/
    int   	$0x80			/* syscall	*/

    /* Exit 						*/
    movl  	$1, 		%eax	/* sys_exit	*/
    movl  	$0, 		%ebx	/* error_code	*/
    int   	$0x80			/* syscall	*/

.data
msg_get:
    .ascii  			"Please enter a number:"
    len_get =  			. - msg_get		/* Symbol "." refers to the current address 
			         			 * Therefore len = current address - start of msg */

msg_put:
    .ascii 			"You have entered:"
    len_put =			. - msg_put

.bss
    .lcomm	num,		5			/* Reserve 5 byte buffer at local common section */
