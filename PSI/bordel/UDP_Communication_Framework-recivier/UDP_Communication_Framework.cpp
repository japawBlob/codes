// UDP_Communication_Framework.cpp : Defines the entry point for the console application.
//

#pragma comment(lib, "ws2_32.lib")
#include "stdafx.h"
#include <winsock2.h>
#include "ws2tcpip.h"
#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include "libcrc-2.0/libcrc-2.0/include/checksum.h"
#include <stdbool.h>
#include <stdlib.h>

//#define TARGET_IP	"147.32.221.8"
//#define TARGET_IP	"147.32.221.174"
#define TARGET_IP	"147.32.216.73"

#define BUFFERS_LEN 1024
char *END_FLAG = "================END";
char *CONFIRM = "OK";
char *DECLINE = "NO";

//#define SENDER
#define RECEIVER

#ifdef SENDER
#define TARGET_PORT 5555
#define LOCAL_PORT 8888
#endif  SENDER

#ifdef RECEIVER
#define TARGET_PORT 8888
#define LOCAL_PORT 5555
#endif  RECEIVER


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
	if (bind(socketS, (sockaddr*)&local, sizeof(local)) != 0) {
		printf("Binding error!\n");
		getchar(); //wait for press Enter
		return 1;
	}
	//**********************************************************************
	char buffer_rx[BUFFERS_LEN];
	char buffer_tx[BUFFERS_LEN];
	char lastAck[BUFFERS_LEN];
	sockaddr_in addrDest;
	addrDest.sin_family = AF_INET;
	addrDest.sin_port = htons(TARGET_PORT);
	InetPton(AF_INET, _T(TARGET_IP), &addrDest.sin_addr.s_addr);
	//sockaddr_in addrDest;
	//addrDest.sin_family = AF_INET;
	//addrDest.sin_port = htons(TARGET_PORT);
	//InetPton(AF_INET, _T(TARGET_IP), &addrDest.sin_addr.s_addr);
	/*
#ifdef SENDER
	
	sockaddr_in addrDest;
	addrDest.sin_family = AF_INET;
	addrDest.sin_port = htons(TARGET_PORT);
	InetPton(AF_INET, _T(TARGET_IP), &addrDest.sin_addr.s_addr);

	
	strncpy(buffer_tx, "Hello world payload!\n", BUFFERS_LEN); //put some data to buffer
	printf("Sending packet.\n");
	sendto(socketS, buffer_tx, strlen(buffer_tx), 0, (sockaddr*)&addrDest, sizeof(addrDest));	

	closesocket(socketS);

#endif  SENDER*/

#ifdef RECEIVER

	//strncpy(buffer_rx, "No data received.\n", BUFFERS_LEN);
	//printf("Waiting for datagram ...\n");
	//int n = (recvfrom(socketS, buffer_rx, sizeof(buffer_rx), 0, (sockaddr*)&from, &fromlen));
	//char buf[BUFFERS_LEN];
	//if ((recvfrom(socketS, buffer_rx, sizeof(buffer_rx), 0, (sockaddr*)&from, &fromlen)) == SOCKET_ERROR) {
	//	printf("Socket error!\n");
	//	getchar();
	//	return 1;
	//}
	//else {
		//int size;
		//memcpy(((char *)&size), buffer_rx, sizeof(size));
		//printf("%d\n", size);
		//printf("Datagram: %s", buffer_rx);
		//char* fileName = buffer_rx;
		//strncpy(buffer_tx, buffer_rx, BUFFERS_LEN);
	int speed;

	printf("PLEASE ENTER SPEED OF TRANSMISSION\n");
	printf("sender will take your int i and will wait 1000/i miliseconds after each transmition\n");
	printf("for maximum speed enter 0\n");
	scanf("%i",&speed);
	if (speed < 0) {
		printf("please enter number higher than 0\n");
		scanf("%i", &speed);
	}

	sprintf(buffer_tx, "%i", speed);

	sendto(socketS, buffer_tx, sizeof(buffer_tx), 0, (sockaddr*)&addrDest, sizeof(addrDest));


	FILE* fp = fopen("name55.jpg", "wb+");
	if (!fp) printf("Error creating file\n");
	//int count = size;
	char gotcrc[20];

	char mycrc[20];


	char parBit;
	char lastParBit = 5;

	fd_set set;
	struct timeval timeout;
	timeout.tv_sec = 0;
	timeout.tv_usec = 1000000;

	strncpy(lastAck, "OK", BUFFERS_LEN);
	while (1 < 2) {
		strncpy(buffer_rx, "No data received.\n", BUFFERS_LEN);
		printf("Waiting for datagram ...\n");
		FD_ZERO(&set);
		FD_SET(socketS, &set);
		int rv = select(socketS, &set, NULL, NULL, &timeout);
		if (rv == 0) {
			sendto(socketS, buffer_tx, strlen(buffer_tx), 0, (sockaddr*)&addrDest, sizeof(addrDest));
			continue;
		}
		if (recvfrom(socketS, buffer_rx, sizeof(buffer_rx), 0, (sockaddr*)&from, &fromlen) == SOCKET_ERROR) {
			printf("Socket error!\n");
			getchar();
			return 1;
		}
		if (strcmp(buffer_rx, END_FLAG) == 0) {
			fclose(fp);
			closesocket(socketS);
			printf("%s", buffer_rx);
			break;
			
		}
			
			//count -= BUFFERS_LEN;
			//for (int i = 1014; i < 1024; i++) {
			//	printf("%c ", buffer_rx[i]);
			//}
			//printf("\n");
		parBit = buffer_rx[1023];
		printf("%c", parBit);
		const unsigned char *crcbuf = (const unsigned char*)buffer_rx;
		uint32_t printcrc = crc_32(crcbuf, 1013);
		const char *overrd = (const char*) printcrc;
		printf("%lu\n", overrd);
		sprintf(mycrc, "%lu", printcrc);
		
		//char gotcrc[9];
		//printf("%s", buffer_rx);
		int j = 0;
		for (int i = 1013; i < 1023; i++) {
			//printf("%c\n", buffer_rx[i]);
			gotcrc[j++] = buffer_rx[i];
			
		}
		printf("MY CRC = %s\n", mycrc);
		printf("GOTCRC = %s\n", gotcrc);

		int CRCflag = 0;
		for (int i = 0; i < 10; i++) {
			if (mycrc[i] == gotcrc[i]) {
				CRCflag++;
			}
		}
		if (parBit == lastParBit) {
			printf("i already have that one...");
			strncpy(buffer_tx, "OK", BUFFERS_LEN);
			sendto(socketS, buffer_tx, strlen(buffer_tx), 0, (sockaddr*)&addrDest, sizeof(addrDest));
		}
		if (CRCflag == 10) {
			fwrite(buffer_rx, 1, 1013, fp);
			strncpy(buffer_tx, "OK", BUFFERS_LEN);
			sendto(socketS, buffer_tx, strlen(buffer_tx), 0, (sockaddr*)&addrDest, sizeof(addrDest));
			printf("acklowledged\n");
			CRCflag = 0;
			lastParBit = parBit;
		}
		else {
			strncpy(buffer_tx, "NO", BUFFERS_LEN);
			sendto(socketS, buffer_tx, strlen(buffer_tx), 0, (sockaddr*)&addrDest, sizeof(addrDest));
			printf("again_please\n");
		}
			
			//}
			//else {
			//	fwrite(buffer_rx, 1, count, fp);
			//	count = 0;
				//sendto(socketS, buffer_tx, strlen(buffer_tx), 0, (sockaddr*)&TARGET_IP, sizeof(TARGET_IP));
				//printf("akclowledged\n");
				//const unsigned char *crcbuf = (const unsigned char*)buffer_rx;
				//uint32_t printcrc = crc_32(crcbuf, 1024);
				//const char *overrd = (const char*)printcrc;
				//printf("%lu\n", overrd);
			//}
	}
	fclose(fp);
	closesocket(socketS);
	//}
#endif
	//**********************************************************************

	getchar(); //wait for press Enter
	return 0;
}

static void             init_crc32_tab(void);

static bool             crc_tab32_init = false;
static uint32_t		crc_tab32[256];

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

} 

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
}