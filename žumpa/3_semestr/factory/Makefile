# the compiler to use
CC = clang

# compiler flags:
#  -g    adds debugging information to the executable file
#  -Wall turns on most, but not all, compiler warnings
CFLAGS  = -g -Wall -o2 -pthread

EXTRA_CFLAGS ?= -fsanitize=address -fno-omit-frame-pointer
  
#files to link:
#LFLAGS = -lcs50
  
# the name to use for both the target source file, and the output file:
TARGET = factory

  
all: $(TARGET)
  
$(TARGET): $(TARGET).c
	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) -o $(TARGET) $(TARGET).c #$(LFLAGS)

clean:
	rm $(TARGET)