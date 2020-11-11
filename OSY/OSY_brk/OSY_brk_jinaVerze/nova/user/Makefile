ALL = hello

CC = gcc
CFLAGS = -m32 -g -nostdlib -fomit-frame-pointer -fno-stack-protector -O2 -Wall -Ilib
CXXFLAGS = $(CFLAGS) -fno-rtti -fno-exceptions
ASFLAGS = -m32 -g
LDFLAGS = -Wl,--build-id=none -Wl,--gc-sections -Wl,-Map=$@.map

all: $(ALL)

clean:
	rm -f $(ALL) libc.a $(wildcard *.o) $(wildcard lib/*.o)

# Userspace

LIB_OBJ = console.o console_kernel.o stdio.o start.o init.o
libc.a: $(LIB_OBJ:%=lib/%)
	ar rcs $@ $^

# Add mem_alloc to libc, if it exists
ifneq ($(wildcard mem_alloc.cc),)
libc.a: mem_alloc.o
endif

%: %.o libc.a
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -Wl,-Tlinker.ld $^ -o $@

# Disable built-in rules

%: %.c
%: %.cc
%: %.o
