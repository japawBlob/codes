#include <stdio.h>
#include <stdlib.h>

#include <termios.h>
#include <fcntl.h>

#include <string.h>
#include <unistd.h>

#include <pthread.h>
#include <semaphore.h>

enum commandOptions{LED_ON, LED_OFF, BUTTON, HELP};

sem_t ledON;
sem_t ledOFF;
sem_t morseEnded;
sem_t inputFlag;
sem_t terminateMorse;

char message[255];
char g_input;

int morseActive;

typedef struct{
	char c_input;
	char message[255];
} t_input;

void call_termios(int reset);
void printMenu();
int sendMessage(int hSerial, char input[]);
char * recivieMessage(int hSerial);
void handleIncommingMessage(char* message);
void* loadMorse(void* path);
void* inputHandle(void* m_input);
int main(int argc, char const *argv[]);
void executeMorse(char* morseString, float sig_on, float sig_off);