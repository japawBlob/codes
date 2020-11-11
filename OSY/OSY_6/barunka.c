//#include <unistd.h> /* TODO: write your own system call wrappers for read, write, exit(check) */
//#include <stdio.h>  /* TODO: sprintf -- convert number to hex string(check) */
//#include <string.h> /* TODO: strlen -- length of output for write (check)*/

void MY_exit(int num){
        asm("int $0x80":: "a"(1), "b"(num));
}

static inline long _read(int fd , char* buff){
        long ret;
        asm volatile("int $0x80": "=a"(ret) : "a"(3), "b"(fd), "c"(buff), "d"(sizeof(buff)) : "memory");
        return ret;
}

static inline long _write(int fd , int buff, long count){
        long ret;
        asm volatile("int $0x80": "=a"(ret) : "a"(4), "b"(fd), "c"(buff), "d"(count) : "memory");
        return ret;
}

int isnum(char ch)
{
        return ch >= '0' && ch <= '9';
}
 
int isspc(char ch)
{
        return ch == ' ' || ch == '\n';
}
 
static void print(unsigned num)
{
        int ret = 0;
        char new_buff [23];
        unsigned int result = num;
        int remainder;
        int count = 0;
        int strlen;
        char temp_buff [23];
        temp_buff[count] = '\n';
        count++;
        if(num == 0){
                temp_buff[count] = '0';
                count++;
        }
        while(result > 0){
                result = num / 16;
                remainder = num - result * 16;
                num = result;
                switch(remainder){
                        case 0:
                                temp_buff[count] = '0';
                        break;
                        case 1:
                                temp_buff[count] = '1';
                        break;
                        case 2:
                                temp_buff[count] = '2';
                        break;
                        case 3:
                                temp_buff[count] = '3';
                        break;
                        case 4:
                                temp_buff[count] = '4';
                        break;
                        case 5:
                                temp_buff[count] = '5';
                        break;
                        case 6:
                                temp_buff[count] = '6';
                        break;
                        case 7:
                                temp_buff[count] = '7';
                        break;
                        case 8:
                                temp_buff[count] = '8';
                        break;
                        case 9:
                                temp_buff[count] = '9';
                        break;
                        case 10:
                                temp_buff[count] = 'a';
                        break;
                        case 11:
                                temp_buff[count] = 'b';
                        break;
                        case 12:
                                temp_buff[count] = 'c';
                        break;
                        case 13:
                                temp_buff[count] = 'd';
                        break;
                        case 14:
                                temp_buff[count] = 'e';
                        break;
                        case 15:
                                temp_buff[count] = 'f';
                        break;
                }
                count++;
        }
        if(result == 0){
        temp_buff[count] = 'x';
        count++;
        temp_buff[count] = '0';
        count++;

        for (strlen = 0; strlen < count; ++strlen)
        {
                new_buff[strlen] = temp_buff[count -1 - strlen];
        }
        ret = _write(1, (int)new_buff, strlen);
        }
        if (ret == -1)
                MY_exit(0); // TODO your new exit
}
 
 
/* TODO: main() is called by libc. Real entry point is _start(). */
void _start()
{
        char buf[20];
        unsigned num = 0;
        int i;
        int num_digits = 0;
        unsigned chars_in_buffer = 0;
 
        for (/* no init */; /* no end condition */; i++, chars_in_buffer--) {
                if (chars_in_buffer == 0) {
                        int ret = _read(0, buf);
                        if (ret < 0){
                                MY_exit(0); // TODO replace by exit
                        }
                        i = 0;
                        chars_in_buffer = ret;
                }
                if (num_digits > 0 && (chars_in_buffer == 0 /* EOF */ || !isnum(buf[i]))) {
                        print(num);
                        num_digits = 0;
                        num = 0;
                }
                if (chars_in_buffer == 0 /* EOF */ || (!isspc(buf[i]) && !isnum(buf[i]))){
                        MY_exit(0); // TODO: replace by exit
                }
                if (isnum(buf[i])) {
                        num = num * 10 + buf[i] - '0';
                        num_digits++;
                }
        }
}