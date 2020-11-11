CC = gcc -pthread
CFLAGS = -Wall -g -O2 
TARGETS = prod-cons
EXTRA_CFLAGS?=-fsanitize=address -fno-omit-frame-pointer
all: $(TARGETS)

%.o: %.c
	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) -c -o $@ $<

prod-cons: prod-cons.o 
	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) prod-cons.o -o prod-cons
 
clean:
	$(RM) *.o $(TARGETS)

run: 
	make
	./prod-cons
	make clean

pack:
	tar czf osy05.tgz Makefile *.[ch]
	



