c compile :
	make -C user
	make -C kern/build

r run :
	qemu-system-i386 -serial stdio -kernel kern/build/hypervisor -initrd user/hello

rd run-debug  :
	qemu-system-i386 -serial stdio -kernel kern/build/hypervisor -initrd user/hello -s -S

rd2 run-debug2  :
	qemu-system-i386 -nographic    -kernel kern/build/hypervisor -initrd user/hello -s -S

du debug-user :
	gdb -ex 'target remote :1234' -ex 'break main' -ex 'continue' user/hello

dk debug-kernel :
	gdb -ex 'target remote :1234' -ex 'break bootstrap' -ex 'continue' kern/build/hypervisor

cl clean :
	make -C kern/build clean
	make -C user clean

cla cleanall : clean
	make -C kern/build cleanall

hw10 :
	zip hw10.zip kern/src/ec_syscall.cc

hw11 :
	zip hw11.zip kern/src/ec_syscall.cc user/mem_alloc.cc

hw12 :
	zip hw12.zip kern/scr/ec_syscall.cc kern/scr/context_construct.cc kern/include/ec.h
