/*
 *    This program uses Linux syscall
 *    in order to read/write a string to the console
 */

.global	_start

.text

.macro print buffer, length
    /* Use syscall in order to write to the console */
    movl    $4,         %eax    /* sys write        */
    movl    $1,         %ebx    /* fd               */
    movl    \buffer,    %ecx    /* buffer           */
    movl    \length,    %edx    /* count            */
    int     $0x80               /* syscall          */
.endm

.macro input buffer, length
    /* Use syscall in order to read from console    */
    movl    $3,         %eax    /* sys read         */
    movl    $1,         %ebx    /* fd               */
    movl    \buffer,    %ecx    /* buffer           */
    movl    \length,    %edx    /* count            */
    int     $0x80               /* syscall          */
.endm

_start:
    /* Write user prompt                            */
    print   $msg_get,   $len_get

    /* Read input and store                         */
    input   $num,       $5

    /* Write output message                         */
    print   $msg_put,   $len_put

    /* Write the stored number                      */
    print   $num,       $5

    /* Exit                                         */
    movl    $1,         %eax    /* sys_exit         */
    movl    $0,         %ebx    /* error_code       */
    int     $0x80               /* syscall          */

.data
msg_get:
    .ascii              "Please enter a number:"
    len_get =           . - msg_get /* Symbol "." refers to the current address
                                     * Therefore len = current address - start of msg */

msg_put:
    .ascii              "You have entered:"
    len_put =           . - msg_put

.bss
    .lcomm  num,        5           /* Reserve 5 byte buffer at local common section */
