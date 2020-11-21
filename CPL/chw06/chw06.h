#include <stdio.h>
#include <stdlib.h>

#include <termios.h>
#include <fcntl.h>

#include <string.h>
#include <unistd.h>

#include <pthread.h>
#include <semaphore.h>

enum commandOptions{LED_ON, LED_OFF, BUTTON, HELP};

// FILE* morseSource;

int morseActive;

void call_termios(int reset);
void printMenu();
int sendMessage(int hSerial, char input[]);
char * recivieMessage(int hSerial);
void handleIncommingMessage(char* message);
void* loadMorse(void* path);
int main(int argc, char const *argv[]);