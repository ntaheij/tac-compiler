.section .text
.globl _start
_start:
movl %esp, %ebp
call main
movl %eax, %ebx
movl $1, %eax
int $0x80
# compound (0x559d12ff32b0)
# variable (use)
pushl -4(%ebp)
# variable (libc)
pushl -4(%ebp)
# start of "main"
.globl main
main:
pushl %ebp
movl %esp, %ebp
subl $20, %esp

subl $24, %esp
# compound (0x559d12ff3690)
# integer
pushl $0
movb (%esp), %cl
movl $0, -16(%ebp)

jmp return_statement
# assign default
movl %esp, -8(%ebp)

print:
 pushl %ebp
 movl %esp, %ebp
 pushl 8(%esp)
 call strlen
 addl $4, %esp
 movl 8(%esp), %ecx
 movl %eax, %edx
 movl $4, %eax
 movl $1, %ebx
 movl %ebp, %esp
 popl %ebp
 int $0x80
 ret

.type itos, @function
itos:
 pushl %ebp
 movl %esp, %ebp
  
 movl 12(%esp), %eax           # number
 movl $8, %edi
 leal (%esp, %edi, 1), %ebx   # buffer
 movl $0, %edi                # counter
 movl $0, %esi

 pushl $0x0
 jmp itos_loop 


itos_loop:
  movl $0, %edx

  movl $10, %ecx
  div %ecx
  
  addl $48, %edx
  pushl %edx
  
  inc %edi

  test %eax, %eax
  je itos_buffer_loop

  jmp itos_loop

itos_buffer_loop: 
  popl %ecx
  movb %cl, (%ebx, %esi, 1)

  test %edi, %edi
  je itos_end

  inc %esi
  dec %edi

  jmp itos_buffer_loop

itos_end:
  movl %ebx, %eax
  movl %ebp, %esp
  popl %ebp
  ret

return_statement:
 popl %eax
 movl %ebp, %esp
 popl %ebp
 ret

.type strlen, @function
strlen:
  pushl %ebp
  movl %esp, %ebp
  movl $0, %edi
  movl 8(%esp), %eax
  jmp strlenloop

strlenloop:
  movb (%eax, %edi, 1), %cl
  cmpb $0, %cl
  je strlenend
  addl $1, %edi
  jmp strlenloop

strlenend:
  movl %edi, %eax
  movl %ebp, %esp
  popl %ebp
  ret

