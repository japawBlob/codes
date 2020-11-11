
CC:=ccache $(CC)
CFLAGS+=-O2

OS:=$(shell uname)

ifeq ($(OS),Linux)
   CFLAGS+=-std=gnu99
   LDFLAGS+=-lrt
endif

OBJS=$(patsubst %.c,%.o,$(wildcard *.c))

TARGET=demo-priority_queue-array

bin: $(TARGET)

$(OBJS): %.o: %.c
	$(CC) -c $< $(CFLAGS) $(CPPFLAGS) -o $@

$(TARGET): $(OBJS)
	$(CC) $(OBJS) $(LDFLAGS) -o $@

clean:
	$(RM) $(OBJS) $(TARGET)

