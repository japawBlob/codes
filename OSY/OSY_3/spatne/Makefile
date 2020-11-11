CC=gcc
CFLAGS=-g -Wall

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

all: nsd forkpipe

forkpipe: forkpipe.o
	$(CC) -o forkpipe forkpipe.c $(CFLAGS)

nsd: nd.o nsd.o nsd_main.o nd.h nsd.h 
	$(CC) -o nsd nd.o nsd.o nsd_main.o $(CFLAGS)