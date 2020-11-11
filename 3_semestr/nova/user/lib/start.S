.text
.global _start
_start:
    mov $stack_top, %esp
    call __init
    call main
    ud2
