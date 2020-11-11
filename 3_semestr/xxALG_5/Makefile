# the compiler to use
CC = gcc
 
# compiler flags:
#  -g    adds debugging information to the executable file
#  -Wall turns on most, but not all, compiler warnings
CFLAGS  = --std=c99 -g -Wall -pipe -o3
 
#EXTRA_CFLAGS ?= -fsanitize=address -fno-omit-frame-pointer
   
#files to link:
#LFLAGS = -lcs50
   
# the name to use for both the target source file, and the output file:
TARGET = main
   
all: $(TARGET)
   
$(TARGET): $(TARGET).c
	$(CC) $(CFLAGS) -o $(TARGET) $(TARGET).c #$(LFLAGS)
 
clean:
	rm $(TARGET)