# the compiler to use
CC = clang
 
# compiler flags:
#  -g    adds debugging information to the executable file
#  -Wall turns on most, but not all, compiler warnings
CFLAGS  += -g -Wall -pipe -o3 -pthread
LDFLAGS += -lpthread
#EXTRA_CFLAGS ?= -fsanitize=address -fno-omit-frame-pointer

OBJS=$(patsubst %.c,%.o,$(wildcard *.c))

TARGET=chw06

bin: $(TARGET)

$(OBJS): %.o: %.c
	$(CC) -c $< $(CFLAGS) $(CPPFLAGS) -o $@
$(TARGET): $(OBJS)
	$(CC) $(OBJS) $(LDFLAGS) -o $@
clean:
	$(RM) $(OBJS) $(TARGET)


unzip:
	tar -xvzf /path/to/yourfile.tgz