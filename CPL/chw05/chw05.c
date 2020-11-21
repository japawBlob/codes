#include <stdio.h>
#include <stdlib.h>

#include <termios.h>
#include <fcntl.h>

#include <string.h>
#include <unistd.h>

enum commandOptions{LED_ON, LED_OFF, BUTTON, HELP};

char *command[] = {
	"LED ON",
	"LED OFF",
	"BUTT:STATUS?",
	"help",
};

void call_termios(int reset){
	static struct termios tio, tioOld;
	tcgetattr(STDIN_FILENO, &tio);
	if (reset) {
		tcsetattr(STDIN_FILENO, TCSANOW, &tioOld);
	} else {
		tioOld = tio; //backup
		cfmakeraw(&tio);
		tio.c_oflag |= OPOST; // enable output postprocessing
		tcsetattr(STDIN_FILENO, TCSANOW, &tio);
	}
}


void printMenu(){
	const char* menu[] = {"== program menu ==",
			"option 'o': Turn LED on",
			"option 'f': Turn LED off",
			"option 'b': Get button status",
			"option 'c': Enter a custom command",
			"option 'h': Show menu",
			"option 'e': Exit",
			"Selection:"};

	int size = (sizeof(menu)/sizeof(char*));

	for (int i = 0; i < size; ++i){
		printf("%s\n", menu[i]);
	}
}


int sendMessage(int hSerial, char input[]){
	char message[256];
	sprintf(message, "%s\r\n", input);
	int n_written = write( hSerial, message, strlen(message)); 
	return n_written;
}
char * recivieMessage(int hSerial){
	static char chArrBuf [256];
	memset (&chArrBuf , '\0', sizeof(chArrBuf) );
	int n = 0;
	while(strlen(chArrBuf) == 0){
	    usleep(1000*100);
	    n = read( hSerial, &chArrBuf , sizeof(chArrBuf));
	}
	chArrBuf[n-2] = '\0';
	return chArrBuf;
}
void handleIncommingMessage(char* message){;
	if (strcmp(message, "BUTTON:RELEASED") == 0){
		printf("Nucleo claims the button is up!\n");
	} else if (strcmp(message, "BUTTON:PRESSED") == 0){
		printf("Nucleo claims the button is down!\n");
	} else {
		printf("Nucleo claims it does not know the command.\n");
	}
}



int main(int argc, char const *argv[]){
	const char* serialPort;
	if(argc < 2){
		serialPort = "/dev/ttyS5";
	} else {
		serialPort = argv[1];
	}

	int hSerial = open( serialPort, O_RDWR| O_NONBLOCK | O_NDELAY );

    struct termios o_tty;
	memset (&o_tty, 0, sizeof o_tty);
	int iRetVal = tcgetattr (hSerial , &o_tty);

	cfsetispeed(&o_tty, B9600);
    cfsetospeed(&o_tty, B9600);


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

    char cInput;
    printMenu();

    call_termios(0);
	while(1){
	cInput = getchar();
	int n_written;
	switch(cInput){
		case 'h':
		{	
			printMenu();
			break; 

		}
		
		case 'o':
		{
			n_written = sendMessage( hSerial, command[LED_ON]); 
			break;
		}
			
		case 'f':
		{
			n_written = sendMessage( hSerial, command[LED_OFF]); 
			break;
		}
			
			case 'b':
		{
			n_written = sendMessage( hSerial, command[BUTTON]); 
			char *chArrBuf = "\0";
			chArrBuf = recivieMessage( hSerial);
			handleIncommingMessage(chArrBuf);
			break;
		}
			case 'c':
		{
			call_termios(1);
			printf("Please input custom command:\n");
			char message[255]; 
			scanf("%s", message);
			getchar(); // consume \n character at the end of the line
			n_written = sendMessage( hSerial, message); 
			char *chArrBuf = "\0";
			chArrBuf = recivieMessage( hSerial);
			handleIncommingMessage(chArrBuf);

			call_termios(0);
			break;
		}	
		/*case 'r':
		{
			static char chArrBuf [256];
			memset (&chArrBuf , '\0', sizeof(chArrBuf) );
			printf("Recv data:\n%s", chArrBuf);
			break;
		}*/
		case 'e':
		{
			goto exit;
		}
		default:
			printf("%c is wrong option\nyou can press 'h' in order to display menu\n", cInput);
		break;
		}
	}
exit:
	call_termios(1);
	close(hSerial);

	return 0;
}