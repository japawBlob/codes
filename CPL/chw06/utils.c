#include "chw06.h"



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
			"option 'm': Load and execute morse code from file",
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