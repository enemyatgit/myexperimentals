/*
 *    The first assembly program
 *    This program returns with error code 13
 *    by using Linux syscall (int 80)
 */

.global	_start

.text
_start:
    movl  $1, %eax	/* sys_exit 	*/
    movl  $13, %ebx     /* error code 	*/
    int   $0x80		/* syscall 	*/


