
#pragma comment(lib, "ws2_32.lib")
#include "stdafx.h"
#include <winsock2.h>
#include "ws2tcpip.h"
#include <stdio.h>
#include <stdlib.h>
#include<time.h>
#include "libcrc-2.0/include/checksum.h"
#include <stdbool.h>
#include <stdlib.h>
#include <inttypes.h>



#define TARGET_IP	"147.32.216.27"

#define NAME "nameaaa.jpg"


#define BUFFERS_LEN 1024

#define SENDER
//#define RECEIVER

#ifdef SENDER
#define TARGET_PORT 5555
#define LOCAL_PORT 8888
#endif // SENDER

#ifdef RECEIVER
#define TARGET_PORT 8888
#define LOCAL_PORT 5555
#endif // RECEIVER


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


#ifdef SENDER

	sockaddr_in addrDest;
	addrDest.sin_family = AF_INET;
	addrDest.sin_port = htons(TARGET_PORT);
	InetPton(AF_INET, _T(TARGET_IP), &addrDest.sin_addr.s_addr);
	DWORD timeout = 1 * 1000;
	setsockopt(socketS, SOL_SOCKET, SO_RCVTIMEO, (const char*)&timeout, sizeof timeout);
	uint32_t crc;
	int size;						//SIZE OF PICTURE
	int temp;						//WHATS LEFT OF THE PICTURE TO SEND

	int lastNum = 0;
	char buffer[1024];				//OG BUFFER FOR SENDING, NOW HAS A PART OF FILE AND CRC
	int delka;
	int counter = 1;
	int kounter = 0;
	bool check1;
	bool check2;
	bool check3;
	int feedback;					//NUMBER OF THE PACKET RECEIVER RECEIVED
	int counterCRC;					//WHATS LEFT OF THE PICTURE TO COMPUTE CRC FROM
	int speed;						//SPEED OF TRANSMISSION
	int packet_nums[10];			//ARRRRRRAY OF 10 LAST RECEIVED PACKET NUMBERS

	char NOVY_BUFFER_TX[1028];		//CURREBT BUFFER FOR SENDING EVERYTHING
	char buffers[10*1028];

	/**********************************GETTING SIZE OF PICTURE*************************************/
	FILE *fp = fopen(NAME, "rb");

	if (fp == NULL)
	{
		printf("It fucked up\n");
	}
	else
	{
		fseek(fp, 0, SEEK_END); // seek to THE end of file
		size = ftell(fp);
		fseek(fp, 0, SEEK_SET);
		printf("The size of file is %d\n", size);
	}

	temp = size;
	counterCRC = temp;
	/*******************************************GETTING SPEED OF TRANSMISSION****************************************************/
	while (true)
	{
		if (recvfrom(socketS, buffer_rx, sizeof(buffer_rx), 0, (sockaddr*)&from, &fromlen) == SOCKET_ERROR)
		{
			printf("Waiting for the transmission speed!\n");
		}
		else {
			memcpy((unsigned char*)&speed, buffer_rx, sizeof(speed));
			break;
		}
	}
		speed = 1000 / speed;
	/***********************************************SENDING THE SIZE OF FILE*****************************************************************/
		memcpy(buffer_tx, (unsigned char *)&temp, sizeof(temp));
		sendto(socketS, buffer_tx, sizeof(temp), 0, (sockaddr*)&addrDest, sizeof(addrDest));

		/*********************************************SENDING THE FIRST N PACKET FRAME**************************************************/
		for (int x = 0; x < 10; x++)
		{	
			//READING THE FILE
			delka = fread(buffer, 1, 1020, fp);
			if (delka == 0)
				break;
			//ADDING THE PACKET NUMBER TO A PACKET
			memcpy(buffer_tx, (unsigned char *)&counter, sizeof(counter));
			printf("packet number: %d\n", counter);
			memcpy(NOVY_BUFFER_TX, buffer_tx, 4);

			//CRC COMPUTATION
			if (counterCRC >= 1020)
			{
				crc = crc_32((const unsigned char*)buffer, 1020);

				printf("CRC: %" PRIu32 "\n", crc);
			}
			else
			{
				crc = crc_32((const unsigned char*)buffer, counterCRC);

				printf("CRC: %" PRIu32 "\n", crc);
			}

			//ASSEMBLY OF THE ACTUAL SENT PACKET FROM PACKET NUMBER, A PART OF THE FILE AND CRC
			memcpy(buffer + 1020, (unsigned char *)&crc, sizeof(crc));
			memcpy(NOVY_BUFFER_TX + 4, buffer, 1024);
			//memcpy((unsigned char *)&lastNum, buffer_tx, sizeof(lastNum));
			memcpy((unsigned char*)&buffers[x * 1028], NOVY_BUFFER_TX, 1028);
			packet_nums[x] = counter;
			sendto(socketS, NOVY_BUFFER_TX, 1028, 0, (sockaddr*)&addrDest, sizeof(addrDest));
			Sleep(speed);
			counter++;
			counterCRC -= 1020;
		}

		/****************SENDING REST OF PICTURE, AFTER I GET A CONFIRMATION OF A WELL SENT PACKET, WILL SEND ANOTHER PACKET************/
		while (1)
		{
			check3 = false;
			check1 = false;
			check2 = false;

			while (check2 == false)
			{
				strncpy(buffer_rx, "", BUFFERS_LEN);
				printf("Waiting for datagram ...\n");

				int wait = 0;
				while (1)
				{
					while (buffer_rx[0] = (char)"")
					{

						if (recvfrom(socketS, buffer_rx, sizeof(buffer_rx), 0, (sockaddr*)&from, &fromlen) == SOCKET_ERROR)
						{
							printf("Socket error!\n");
							check3 = true;
						}
						else {
							printf("Got answer");
							break;
						}

						if (check3)
						{

							printf("\nSending once more");
							memcpy(buffer_tx, (unsigned char *)&counter, sizeof(counter));
							memcpy(buffer + 1024, (unsigned char *)&crc, sizeof(crc));
							sendto(socketS, NOVY_BUFFER_TX, 1028, 0, (sockaddr*)&addrDest, sizeof(addrDest));
							printf("Counter/Packet number is %d/n", counter);
							Sleep(speed);
							check3 = false;

						}

					}
					memcpy((unsigned char*)&feedback, buffer_rx, sizeof(feedback));
					printf("\n feedback: %i",feedback);
					for (int x = 0; x < 10; x++) 
					{
						printf("%i", x);
						if (packet_nums[x] == feedback)
						{
	
							check2 = true;
							printf("answer OK");
							printf("BREAK");
							break;
						}
						else 
						{
							if (packet_nums[x] == -feedback) 
							{
								check2 = true;
								sendto(socketS, buffers+(x*1028), 1028, 0, (sockaddr*)&addrDest, sizeof(addrDest));
								Sleep(speed);
								printf("\nRecieved num was %i\n", -feedback);
								printf("\nDuplicate Correction Sent\n");
								uint32_t temCRC;
								memcpy((unsigned char*)&temCRC, buffers + (x * 1028)+1024, 4);
								printf("\n%" PRIu32 "\n", temCRC);
								int tempCout;
								memcpy((unsigned char*)&tempCout, buffers + (x * 1028), 4);
								printf("\nSent packet was  %i\n", tempCout);
								break;
								
							}
						}
					}

					if (check2 == true) 
					{
						break;
					}
					
				}
				
			}
			printf("%d", lastNum);
			if (counter == (temp / 1020) + 2)
			{

				break;

			}

			delka = fread(buffer, 1, 1020, fp);
			if (delka == 0) {
				break;
			}
			memcpy(buffer_tx, (unsigned char *)&counter, sizeof(counter));

			printf("CNT: %d\n\n", counter);

			memcpy(NOVY_BUFFER_TX, buffer_tx, 4);

			if (counterCRC >= 1020)
			{
				crc = crc_32((const unsigned char*)buffer, 1020);

				printf("\nCRC is: % " PRIu32 "\n", crc);
			}
			else
			{
				crc = crc_32((const unsigned char*)buffer, counterCRC);

				printf("\n%" PRIu32 "\n", crc);
			}

			memcpy(buffer + 1020, (unsigned char *)&crc, sizeof(crc));
			memcpy(NOVY_BUFFER_TX + 4, buffer, 1024);
			
			sendto(socketS, NOVY_BUFFER_TX, 1028, 0, (sockaddr*)&addrDest, sizeof(addrDest));
			Sleep(speed);
			if (kounter == 10) {
				kounter = 0;
			}
			packet_nums[kounter] = counter;
			memcpy((unsigned char*)&buffers[kounter * 1028], NOVY_BUFFER_TX, 1028);
			kounter++;

			for (int j = 0; j < 10; j++) {
				printf(" %d ", packet_nums[j]);
			}
			printf("\n");
			counter++;
			counterCRC -= 1020;
		}

		fclose(fp);


		printf("closeSocket");
		closesocket(socketS);



#endif // SENDER

#ifdef RECEIVER

		strncpy(buffer_rx, "No data received.\n", BUFFERS_LEN);
		printf("Waiting for datagram ...\n");
		while (true)
		{
			if (recvfrom(socketS, buffer_rx, sizeof(buffer_rx), 0, (sockaddr*)&from, &fromlen) == SOCKET_ERROR) {
				printf("Socket error!\n");
				getchar();
				return 1;
			}
			else
				printf("Datagram: %s", buffer_rx);
		}
		closesocket(socketS);
#endif
		//**********************************************************************

		getchar(); //wait for press Enter
		return 0;
	}

/*
 * Library: libcrc
 * File:    src/crc32.c
 * Author:  Lammert Bies
 *
 * This file is licensed under the MIT License as stated below
 *
 * Copyright (c) 1999-2016 Lammert Bies
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 *
 * Description
 * -----------
 * The source file src/crc32.c contains the routines which are needed to
 * calculate a 32 bit CRC value of a sequence of bytes.
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

}  /* crc_32 */

/*
 * uint32_t update_crc_32( uint32_t crc, unsigned char c );
 *
 * The function update_crc_32() calculates a new CRC-32 value based on the
 * previous value of the CRC and the next byte of the data to be checked.
 */

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

