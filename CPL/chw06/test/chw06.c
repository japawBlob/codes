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
	tcgetattr (hSerial , &o_tty);

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

    // INIT SEMAPHORES
    sem_init(&ledON, 0, 0);
    sem_init(&ledOFF, 0, 0);
    sem_init(&morseEnded, 0, 0);
    sem_init(&inputFlag, 0, 0);
    sem_init(&terminateMorse, 0, 0);

    printMenu();
    morseActive = 0;
    pthread_t morse;
	pthread_t inputThread;
    
	char* m_input = (char*)malloc(sizeof(char));
    
    pthread_create(&inputThread, NULL, inputHandle, (void*)m_input);

    
	while(1){
		if(sem_trywait(&inputFlag) != -1){
			int n_written;
			switch(g_input){
				case 'h':
				{	
					printMenu();
					break; 

				}
				case 'm':
				{	
					if(morseActive == 0){
						printf("Please enter the name of the source file for morse:\n");
						sem_wait(&inputFlag);
						pthread_create(&morse, NULL, loadMorse, (void*)message);
						morseActive = 1;
					} else {
						printf("I am sorry the execution of morse is now in progress.\nIf you\'d like to terminate it, please press \'x\'\n");
					}
					
					break; 

				}
				case 'x':
				{
					if(morseActive == 1){
						sem_post(&terminateMorse);
					}
					morseActive = 0;
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
					
					printf("Please input custom command:\n");
					sem_wait(&inputFlag);
					n_written = sendMessage( hSerial, message); 
					char *chArrBuf = "\0";
					chArrBuf = recivieMessage( hSerial);
					handleIncommingMessage(chArrBuf);
					
					break;
				}
				case 'e':
				{
					if(morseActive == 1){
						sem_post(&terminateMorse);
					}
					morseActive = 0;
					goto exit;
				}
				default:
				{
					printf("%c is wrong option\nyou can press 'h' in order to display menu\n", g_input);
					break;
				}
			}
		}
		if(sem_trywait(&morseEnded) != -1){
			//printf("morseThreadEnded\n");
			pthread_join(morse, NULL);
			morseActive = 0;
		}
		if(sem_trywait(&ledON) != -1){
			sendMessage( hSerial, command[LED_ON]);
		}
		if(sem_trywait(&ledOFF) != -1){
			sendMessage( hSerial, command[LED_OFF]);
		}

	}
exit:
	free(m_input);
	pthread_join(inputThread, NULL);
	pthread_join(morse, NULL);
	sem_destroy(&ledOFF);
	sem_destroy(&ledON);
	sem_destroy(&morseEnded);
	sem_destroy(&inputFlag);
	sem_destroy(&terminateMorse);
	
	close(hSerial);

	return 0;
}