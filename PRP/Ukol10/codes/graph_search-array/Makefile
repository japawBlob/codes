
CC:=ccache $(CC)
CFLAGS+=-O2 -g
LDFLAGS+=-lm

OS:=$(shell uname)

ifeq ($(OS),Linux)
   CFLAGS+=-std=gnu99
   LDFLAGS+=-lrt
endif

#OBJS=$(patsubst %.c,%.o,$(wildcard *.c))
OBJS=\
     dijkstra.o\
     graph_utils.o\
     pq_array-linear.o\
     load_simple.o\


TARGET=tgraph_search

TARGET_TIME=tgraph_search-time

OBJS_ALL=$(OBJS)
OBJS_ALL+=$(TARGET).o 
OBJS_ALL+=$(TARGET_TIME).o


bin: $(TARGET)

time: $(TARGET_TIME)

$(OBJS_ALL): %.o: %.c
	$(CC) -c $< $(CFLAGS) $(CPPFLAGS) -o $@

$(TARGET): $(OBJS_ALL)
	$(CC) $(OBJS) $@.o $(LDFLAGS) -o $@ 

$(TARGET_TIME): $(OBJS_ALL)
	$(CC) $(OBJS) $@.o $(LDFLAGS) -o $@ 

clean:
	$(RM) $(OBJS_ALL) $(TARGET) $(TARGET_TIME)

