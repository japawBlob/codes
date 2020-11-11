//#include <unistd.h> /* TODO: write your own system call wrappers for read, write, exit */
//#include <stdio.h>  /* TODO: sprintf -- convert number to hex string */
//#include <string.h> /* TODO: strlen -- length of output for write */

//syscall got from https://syscalls.kernelgrok.com/?fbclid=IwAR3YUYDndYq00UztPup8xOFrMDpqDMXkAlk0dqsY5EgX87KqGH81igINI6w

void sys_exit(int ret){
    asm("int $0x80":: "a"(1), "b"(ret));
}

int sys_read(int fd, char* buf, int count){
    int ret;
    asm volatile("int $0x80": "=a"(ret) : "a"(3), "b"(fd), "c"(buf), "d"(count) : "memory");
    return ret;
}

int sys_write(int fd , char* buf, int count){
        int ret;
        asm volatile("int $0x80": "=a"(ret) : "a"(4), "b"(fd), "c"(buf), "d"(count) : "memory");
        return ret;
}

int isnum(char ch){
    return ch >= '0' && ch <= '9';
}
 
int isspc(char ch){
    return ch == ' ' || ch == '\n';
}
 
static void print(unsigned num)
{
    char buf[20];
    /* TODO: Get rid of sprintf() and strlen() */
    //sprintf(buf, "0x%x\n", num);
    int remainder;
    int i = 1;
    while(num > 0){
        remainder = num%16;

        if(remainder < 10){
            buf[i] = remainder + 48;
        } else {
            buf[i] = remainder + 55;
        }
        i++;
        num = num/16;
    }
    int j = 0;
    i--;
    char tempBuf[22];
    tempBuf[j++] = '0';
    tempBuf[j++] = 'x';
    int length = 1;
    for (; i >= 0; j++, i--){
        //if(buf[i]==' ') continue;
        tempBuf[j] = buf[i];
        length++;
    }

    int ret = sys_write(1, tempBuf, length);

    if (ret == -1){
        sys_exit(1);
    }

    /*
    for (i = 0; i < length; ++i)
    {
        printf("%c",tempBuf[i]);
    }
    printf("\n");
*/
/*
    int ret = write(STDOUT_FILENO, buf, strlen(buf));
    if (ret == -1)
        _exit(1); // TODO your new exit
*/
}
 
 
/* TODO: main() is called by libc. Real entry point is _start(). */
void _start()
{
    char buf[20];
    unsigned num = 0;
    int i;
    int numDigits = 0;
    unsigned charsInBuffer = 0;

    for (/* no init */; /* no end condition */; i++, charsInBuffer--) {
        if (charsInBuffer == 0) {
            int ret = sys_read(0, buf, sizeof(buf));
            if (ret < 0)
                sys_exit(1); // TODO replace by exit
            i = 0;
            charsInBuffer = ret;
            }
        if (numDigits > 0 && (charsInBuffer == 0 /* EOF */ || !isnum(buf[i]))) {
            print(num);
            numDigits = 0;
            num = 0;
        }
        if (charsInBuffer == 0 /* EOF */ || (!isspc(buf[i]) && !isnum(buf[i])))
            sys_exit(0); // TODO: replace by exit

        if (isnum(buf[i])) {
            num = num * 10 + buf[i] - '0';
            numDigits++;
        }
    }
}