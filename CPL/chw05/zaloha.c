#include <stdio.h>
#include <stdlib.h>

#include <termios.h>
#include <fcntl.h>

#include <string.h>
#include <unistd.h>

int main(int argc, char const *argv[]){
	int hSerial = open( "/dev/ttyS5", O_RDWR| O_NONBLOCK | O_NDELAY );

    struct termios o_tty;
	memset (&o_tty, 0, sizeof o_tty);
	int iRetVal = tcgetattr (hSerial , &o_tty);


    /* set raw input, 1 second timeout */
    o_tty.c_cflag     |= (CLOCAL | CREAD);
    o_tty.c_lflag     &= ~(ICANON | ECHO | ECHOE | ISIG);
    o_tty.c_oflag     &= ~OPOST;
    o_tty.c_cc[VMIN]  = 0;
    o_tty.c_cc[VTIME] = 10;

    o_tty.c_cflag &= ~PARENB;
	o_tty.c_cflag &= ~CSTOPB;
	o_tty.c_cflag &= ~CSIZE;
	o_tty.c_cflag |= CS8;

    /* set the options */
    tcsetattr(hSerial, TCSANOW, &o_tty);

	//unsigned char chArrCmd[] = {'*', 'I', 'D', 'N', '?', '\r', '\n', '\0'};
	//int n_written = write( hSerial, chArrCmd, sizeof(chArrCmd)-1 ); // why -1?
    char strInput[255];

	while(1){

	printf("Selection\n");
	scanf("%s", strInput);
	int n_written;
	switch(strInput[0]){
		case 's':
		{	
			//unsigned char chArrCmd[] = {'*', 'I', 'D', 'N', '?', '\r', '\n', '\0'};
			//char chSendChar = 'h';
			char message[] = "LED ON\r\n";
			n_written = write( hSerial, message, sizeof(message)-1);
			break; 
		}
		case 'h':
		{	//unsigned char chArrCmd[] = {'*', 'I', 'D', 'N', '?', '\r', '\n', '\0'};
			char chSendChar = 'h';
			n_written = write( hSerial, &chSendChar, 1);
			break; 

		}
		
		case 'o':
		{
			char message[] = "LED ON\r\n";
			n_written = write( hSerial, message, sizeof(message)-1); 
			break;
		}
			
		case 'f':
		{
			char message[] = "LED OFF\r\n";
			n_written = write( hSerial, message, sizeof(message)-1); 
			break;
		}
			
			case 'b':
		{
			char chSendChar = 'r';
			n_written = write( hSerial, &chSendChar, 1); 
			break;
		}
			
		case 'r':
		{
			char chArrBuf [256];
			memset (&chArrBuf , '\0', sizeof(chArrBuf) );

			int n = read( hSerial, &chArrBuf , sizeof(chArrBuf) );
			printf("Recv data:\n%s", chArrBuf);
			break;
		}
		default:
			printf("wrong option\n");
		break;
	}
	char chArrBuf [256];
	memset (&chArrBuf , '\0', sizeof(chArrBuf) );

	int n = read( hSerial, &chArrBuf , sizeof(chArrBuf) );

}

	close(hSerial);

	return 0;
}