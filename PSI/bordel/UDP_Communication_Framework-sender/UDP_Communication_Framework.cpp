// UDP_Communication_Framework.cpp : Defines the entry point for the console application.
//

#pragma comment(lib, "ws2_32.lib")
#include "stdafx.h"
#include <winsock2.h>
#include "ws2tcpip.h"
#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include <stdlib.h>
#include <stdint.h>
#include "libcrc-2.0/include/checksum.h"


//#define TARGET_IP	"147.32.221.7"
#define TARGET_IP	"147.32.221.175"
#define NAME "obrazek.jpg"

#define BUFFERS_LEN 1024
//#define CONFIRM "OK"

#define SENDER
#define RECEIVER

char *END_FLAG = "================END";
char *CONFIRM = "OK";
char *DECLINE = "NO";

#ifdef SENDER
#define TARGET_PORT 5555
#define LOCAL_PORT 8888
#endif // SENDER
/*
#ifdef RECEIVER
#define TARGET_PORT 8888
#define LOCAL_PORT 5555
#endif // RECEIVER
*/

void InitWinsock()
{
	WSADATA wsaData;
	WSAStartup(MAKEWORD(2, 2), &wsaData);
}

//**********************************************************************
int main()
{
	SOCKET socketS;
	
	InitWinsock();

	struct sockaddr_in local;
	struct sockaddr_in from;

	int fromlen = sizeof(from);
	local.sin_family = AF_INET;
	local.sin_port = htons(LOCAL_PORT);
	local.sin_addr.s_addr = INADDR_ANY;


	socketS = socket(AF_INET, SOCK_DGRAM, 0);
	if (bind(socketS, (sockaddr*)&local, sizeof(local)) != 0){
		printf("Binding error!\n");
	    getchar(); //wait for press Enter
		return 1;
	}
	//**********************************************************************
	char buffer_rx[BUFFERS_LEN];
	char buffer_tx[BUFFERS_LEN];

	char ack_buffer[3];
	int paritniBit = 0;
	char strParitni[1];
	char str[10];

#ifdef SENDER
	/*
	for (int i = 0; i < BUFFERS_LEN; i++) {
		buffer_tx[i] = 0;
	}
	*/
	sockaddr_in addrDest;
	addrDest.sin_family = AF_INET;
	addrDest.sin_port = htons(TARGET_PORT);
	InetPton(AF_INET, _T(TARGET_IP), &addrDest.sin_addr.s_addr);

	//strncpy(buffer_tx, NAME, BUFFERS_LEN);
	/*
	int one = 1;
	int two = 1000;
	printf("%i", 1 / 1000);
	*/
	//printf("%s", buffer_tx);

	//sendto(socketS, buffer_tx, strlen(buffer_tx), 0, (sockaddr*)&addrDest, sizeof(addrDest));

	//printf("%s", buffer_tx);
	printf("Transmission started\n");
	printf("Waiting for client to enter sending speed\n");

	if (recvfrom(socketS, buffer_rx, sizeof(buffer_rx), 0, (sockaddr*)&from, &fromlen) == SOCKET_ERROR) {

		printf("error");
		getchar();
		return 1;
	}
	printf("BUFFER %s\n", buffer_rx);

	int numberOfDigits = -1;
	for (int i = 0; i < strlen(buffer_rx); i++) {
		if (buffer_rx[i] == '0' || buffer_rx[i] == '1' || buffer_rx[i] == '2' || buffer_rx[i] == '3' || buffer_rx[i] == '4' || buffer_rx[i] == '5' || buffer_rx[i] == '6'
			|| buffer_rx[i] == '7' || buffer_rx[i] == '8' || buffer_rx[i] == '9') {
			numberOfDigits++;
			buffer_rx[i] -= 48;
		}
	}
	printf("NO DIGITS %i\n", numberOfDigits);
	if (numberOfDigits == -1) {
		printf("error");
		return 1;
	}
	int j = 1;
	double speed = 0;
	for (int i = numberOfDigits; i > -1; i--) {
		
		speed += buffer_rx[i] * j;
		j *= 10;
	}
	if (speed > 0) {
		speed = 1000 / speed;
		printf("SPEED %lf\n", speed);
	} else {
		printf("Maximum speed\n");
		speed = 0;
	}
	

	

	//Sleep(2000000000);

	FILE* f = fopen(NAME, "rb");

	if (f == NULL) {
		printf("fine... file not found!");
	}
	fseek(f, 0, SEEK_END);
	int sizeOfFile = ftell(f);



	fseek(f, 0, SEEK_SET);
	unsigned char* buff = (unsigned char*)malloc(sizeOfFile + 1);
	fread(buff, sizeof(unsigned char), sizeOfFile, f);
	buff[sizeOfFile] = '\0';

	//char str[9];

	sprintf(str, "%d", sizeOfFile);

	strncpy(buffer_tx, str, BUFFERS_LEN);
	//printf("%s", buffer_tx);

	//sendto(socketS, buffer_tx, strlen(buffer_tx), 0, (sockaddr*)&addrDest, sizeof(addrDest));
	
	int numberOfPackets = sizeOfFile / 1014;
	
	int timer;
	int blob = 0;
	int numberOfBitesSent;
	for (int i = 0; i <= numberOfPackets; i++) {
		numberOfBitesSent = 0;
		//char promenna = '0';

		if (i == numberOfPackets) {
			printf("last packet\n");
		}
		for (int j = 0; j < 1014; j++) {
			if (sizeOfFile == 0) {
				buffer_tx[j] = '0';
				numberOfBitesSent++;
			}
			if (sizeOfFile > 0) {
				buffer_tx[j] = buff[blob + j];
				numberOfBitesSent++;
				sizeOfFile--;
				//if (j % 100 == 0)promenna++;
			}
		}
		const unsigned char *input_str = (const unsigned char*)buffer_tx;
		
		uint32_t kek = crc_32(input_str, 1014);

		sprintf(str, "%lu", kek);
		
		printf("%s\n", str);
		int position = 0;
		for (int j = 1014; j < 1023; j++) {
			buffer_tx[j] = str[position++];
			numberOfBitesSent++;
			//printf("%c ", buffer_tx[j]);
		}
		sprintf(strParitni, "%i", paritniBit);

		buffer_tx[1023] = strParitni[0];
		numberOfBitesSent++;


		//printf("%c ", buffer_tx[1023]);
		//printf("%s", buffer_tx);
		
		//printf("%lu\n", kek);
		//printf("note\n");
		
		blob += 1014;

		//printf("%s", buffer_tx);

		sendto(socketS, buffer_tx, numberOfBitesSent, 0, (sockaddr*)&addrDest, sizeof(addrDest));
		Sleep(speed);
		//printf("%s", buffer_tx);

		printf("sending...\n");
		printf("waiting for ack...\n");
		timer = 0;
		while (1) {
			//break;
			if (recvfrom(socketS, buffer_rx, sizeof(buffer_rx), 0, (sockaddr*)&from, &fromlen) == SOCKET_ERROR) {
				printf("error");
				getchar();
				return 1;
			}
			if (buffer_rx[0] == DECLINE[0] && buffer_rx[1] == DECLINE[1]) {
				printf("sending_again...\n");
				sendto(socketS, buffer_tx, numberOfBitesSent, 0, (sockaddr*)&addrDest, sizeof(addrDest));
			}
			if (buffer_rx[0] == CONFIRM[0] && buffer_rx[1] == CONFIRM[1]){
				printf("acknowledged...\n");
				break;
			}
			else {
				sendto(socketS, buffer_tx, numberOfBitesSent, 0, (sockaddr*)&addrDest, sizeof(addrDest));
				Sleep(speed);
			}
			Sleep(1);
			timer++;
			if (timer == 5000) {
				sendto(socketS, buffer_tx, numberOfBitesSent, 0, (sockaddr*)&addrDest, sizeof(addrDest));
				Sleep(speed);
				timer = 0;
			}
		}
		if (paritniBit == 0) {
			paritniBit = 1;
		}
		else {
			paritniBit = 0;
		}
		
		//Sleep(1);
	}
	free(buff);

	strncpy(buffer_tx, END_FLAG, BUFFERS_LEN);
	sendto(socketS, buffer_tx, strlen(buffer_tx), 0, (sockaddr*)&addrDest, sizeof(addrDest));
	printf("%s", buffer_tx);
	

	fclose(f);


	closesocket(socketS);

#endif // SENDER
/*
#ifdef RECEIVER

	strncpy(buffer_rx, "No data received.\n", BUFFERS_LEN);
	printf("Waiting for datagram ...\n");
	if(recvfrom(socketS, buffer_rx, sizeof(buffer_rx), 0, (sockaddr*)&from, &fromlen) == SOCKET_ERROR){
		printf("Socket error!\n");
		getchar();
		return 1;
	}
	else
		printf("Datagram: %s", buffer_rx);

	closesocket(socketS);
#endif
	//**********************************************************************

*/
	getchar(); //wait for press Enter
	return 0;
}
/*

uint32_t crc_32(const unsigned char *input_str, size_t num_bytes) {

	uint32_t crc;
	uint32_t tmp;
	uint32_t long_c;
	const unsigned char *ptr;
	size_t a;

	if (!crc_tab32_init) init_crc32_tab();

	crc = CRC_START_32;
	ptr = input_str;

	if (ptr != NULL) for (a = 0; a < num_bytes; a++) {

		long_c = 0x000000FFL & (uint32_t)*ptr;
		tmp = crc ^ long_c;
		crc = (crc >> 8) ^ crc_tab32[tmp & 0xff];

		ptr++;
	}

	crc ^= 0xffffffffL;

	return crc & 0xffffffffL;
}
*/

static void             init_crc32_tab(void);

static bool             crc_tab32_init = false;
static uint32_t		crc_tab32[256];

/*
 * uint32_t crc_32( const unsigned char *input_str, size_t num_bytes );
 *
 * The function crc_32() calculates in one pass the common 32 bit CRC value for
 * a byte string that is passed to the function together with a parameter
 * indicating the length.
 */

uint32_t crc_32(const unsigned char *input_str, size_t num_bytes) {

	uint32_t crc;
	uint32_t tmp;
	uint32_t long_c;
	const unsigned char *ptr;
	size_t a;

	if (!crc_tab32_init) init_crc32_tab();

	crc = CRC_START_32;
	ptr = input_str;

	if (ptr != NULL) for (a = 0; a < num_bytes; a++) {

		long_c = 0x000000FFL & (uint32_t)*ptr;
		tmp = crc ^ long_c;
		crc = (crc >> 8) ^ crc_tab32[tmp & 0xff];

		ptr++;
	}

	crc ^= 0xffffffffL;

	return crc & 0xffffffffL;

}
uint32_t update_crc_32(uint32_t crc, unsigned char c) {

	uint32_t tmp;
	uint32_t long_c;

	long_c = 0x000000ffL & (uint32_t)c;

	if (!crc_tab32_init) init_crc32_tab();

	tmp = crc ^ long_c;
	crc = (crc >> 8) ^ crc_tab32[tmp & 0xff];

	return crc & 0xffffffffL;;

}  /* update_crc_32 */

/*
 * static void init_crc32_tab( void );
 *
 * For optimal speed, the CRC32 calculation uses a table with pre-calculated
 * bit patterns which are used in the XOR operations in the program. This table
 * is generated once, the first time the CRC update routine is called.
 */

static void init_crc32_tab(void) {

	uint32_t i;
	uint32_t j;
	uint32_t crc;

	for (i = 0; i < 256; i++) {

		crc = i;

		for (j = 0; j < 8; j++) {

			if (crc & 0x00000001L) crc = (crc >> 1) ^ CRC_POLY_32;
			else                     crc = crc >> 1;
		}

		crc_tab32[i] = crc;
	}

	crc_tab32_init = true;

}  /* init_crc32_tab */
