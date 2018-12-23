/*
 *    Second assembly program
 *    This program uses Linux syscall
 *    in order to write a string to the console
 */

.global	_start

.text
_start:
    movl  	$4, %eax	/* sys write 	*/
    movl  	$1, %ebx	/* fd		*/
    movl  	$msg, %ecx	/* buffer	*/
    movl  	$len, %edx	/* count	*/
    int   	$0x80		/* syscall	*/

    movl  	$1, %eax	/* sys_exit	*/
    movl  	$0, %ebx	/* error_code	*/
    int   	$0x80		/* syscall	*/

.data
msg:
    .ascii  	"Hello, world!\n"
    len =   	. - msg		/* Symbol "." refers to the current address 
			         * Therefore len = current address - start of msg */
