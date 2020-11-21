#include "chw06.h"

char *command[] = {
	"LED ON",
	"LED OFF",
	"BUTT:STATUS?",
	"help",
};

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
    morseActive = 0;
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
			case 'm':
			{	
				call_termios(1);
				printf("Please enter the name of the source file for morse:\n");
				char* fileName = (char*)malloc(sizeof(char)*255); 
				scanf("%s", fileName);
				getchar(); // consume \n character at the end of the line
				

				pthread_t morse;
				morseActive = 1;
				pthread_create(&morse, NULL, loadMorse, (void*)fileName);

				call_termios(0);
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
			{
				printf("%c is wrong option\nyou can press 'h' in order to display menu\n", cInput);
				break;
			}
		}
	}
exit:
	call_termios(1);
	close(hSerial);

	return 0;
}