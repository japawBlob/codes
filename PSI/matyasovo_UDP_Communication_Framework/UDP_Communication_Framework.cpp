// UDP_Communication_Framework.cpp : Defines the entry point for the console application.
//

#pragma comment(lib, "ws2_32.lib")
#include "stdafx.h"
#include <winsock2.h>
#include "ws2tcpip.h"
#include "libcrc-2.0\include\checksum.h"
#include <stdbool.h>
#include <stdlib.h>
#include <inttypes.h>

#define TARGET_IP	"192.168.1.100"

#define BUFFERS_LEN 1024
#define NAME "snek.jpg"

//#define SENDER
#define RECEIVER

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
	if (bind(socketS, (sockaddr*)& local, sizeof(local)) != 0) {
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

	for (int i = 0; i < 6; i++) {
		strncpy(buffer_tx, "Hello world payload!\n", BUFFERS_LEN); //put some data to buffer
		printf("Sending packet.\n");
		sendto(socketS, buffer_tx, strlen(buffer_tx), 0, (sockaddr*)& addrDest, sizeof(addrDest));
	}
	closesocket(socketS);

#endif // SENDER

#ifdef RECEIVER

	int prev = 0;
	int previous[10];   //previous packet numbers
	int currentPackter;			//current packet number
	int sizeOfPicture = 0;			//size of the sent picture
	bool duplicate = false;//boolean indicating if I got a duplicate
	bool correction = false;//bool for indicating if I got a correction packet for something wrong
	int remainingSizeOfFile;		//number of bytes left to receive
	int speed;			//transmission speed
	int badlyRecivied = 0;		// counter for badly received packets
	int counter = 0;	    //counter for previous packets
	int N = 10;			//max packets sent at one time
	int test = 0;
	int wrongPackets[10];//array with the numbers of max 10 packets badly received
	char packets[10 * 1024];//array with the 10 last received packets
	uint32_t crc;		//crc received
	uint32_t crcmine;	//crc calculated from received packet

	sockaddr_in addrDest;
	addrDest.sin_family = AF_INET;
	addrDest.sin_port = htons(TARGET_PORT);
	InetPton(AF_INET, _T(TARGET_IP), &addrDest.sin_addr.s_addr);

	FILE* fp = fopen(NAME, "wb");


	/***Set trans speed***/
	printf("PLEASE ENTER SPEED OF TRANSMISSION\n");
	printf("sender will take your int i and will wait 1000/i miliseconds after each transmition\n");
	printf("for maximum speed enter 0\n");
	scanf("%i", &speed);
	if (speed < 0) {
		printf("please enter number higher than 0\n");
		scanf("%i", &speed);
	}
	memcpy(buffer_tx, ((unsigned char*)& speed), sizeof(speed));
	Sleep(5);
	sendto(socketS, buffer_tx, sizeof(currentPackter), 0, (sockaddr*)& addrDest, sizeof(addrDest));

	/***getting size***/
	strncpy(buffer_rx, "", BUFFERS_LEN);
	printf("Waiting for datagram ...\n");
	if (recvfrom(socketS, buffer_rx, sizeof(buffer_rx), 0, (sockaddr*)& from, &fromlen) == SOCKET_ERROR) {
		printf("Socket error!\n");
		getchar();
		return 1;
	}

	memcpy(((unsigned char*)& sizeOfPicture), buffer_rx, sizeof(sizeOfPicture));
	printf("%d\n", sizeOfPicture);

	/*************************************************main receiving cycle**************************************************************/
	remainingSizeOfFile = sizeOfPicture;
	char* buffer = (char*)malloc(sizeOfPicture + ((sizeOfPicture / 1016) + 1) * 8);
	for (int i = 0; i < (sizeOfPicture / 1016) + 1; i++) {

		/***receiving packet***/
		strncpy(buffer_rx, "", BUFFERS_LEN);
		printf("Waiting for datagram ...\n");
		if (recvfrom(socketS, buffer_rx, 1024, 0, (sockaddr*)& from, &fromlen) == SOCKET_ERROR) {
			printf("Socket error!\n");
			getchar();
			return 1;
		}
		memcpy(((unsigned char*)& currentPackter), buffer_rx, 4);
		printf(" Current Packet :%d \n", currentPackter);

		/***duplicate check***/
		correction = false;

		for (int x = 0; x < 10; x++) {
			if (previous[x] == currentPackter) {
				duplicate = true;
				printf("duplicate");
				break;
			}
			if (wrongPackets[x] == currentPackter) {
				printf("\nGot new packet");
				//if (remainingSizeOfFile >= 1016) {
					crcmine = crc_32((const unsigned char*)buffer_rx + 4, 1016);
					printf("\nmy CRC:%" PRIu32 "\n", crcmine);
				//}
				//else {
				//	crcmine = crc_32((const unsigned char*)buffer_rx + 4, remainingSizeOfFile);
				//	printf("\nlast packet my CRC:%" PRIu32 "\n", crcmine);
				//}
				memcpy((unsigned int*)& crc, buffer_rx + 1020, 4);
				printf("got crc %" PRIu32 " \n", crc);

				/***CRC check, if correct, save the picture packet into the file***/
				if (crc == crcmine) {
					printf("CRC OK");

					if (remainingSizeOfFile >= 1016) {
						memcpy(buffer + ((currentPackter - 1) * 1024), buffer_rx, 1024);
						remainingSizeOfFile -= 1016;
					}
					/*else {
						memcpy(buffer + ((count - 1) * 1028), buffer_rx, counter);
						counter = 0;
					}*/
					printf("%d\n", currentPackter);
					printf("Sending packet.\n");
					memcpy(buffer_tx, ((unsigned char*)& currentPackter), sizeof(currentPackter));
					sendto(socketS, buffer_tx, sizeof(currentPackter), 0, (sockaddr*)& addrDest, sizeof(addrDest));
					prev = currentPackter;
					if (counter == 10) {
						counter = 0;
					}
					previous[counter++] = currentPackter;
					wrongPackets[x] = NULL;
					badlyRecivied -= 1;
					correction = true;
					printf("correction");
					break;
				}
			}


		}


		if (!duplicate && !correction) {

			printf("\nGot new packet");

			crcmine = crc_32((const unsigned char*)buffer_rx + 4, 1016);
			printf("\nmy CRC:%" PRIu32 "\n", crcmine);

			memcpy((unsigned int*)& crc, buffer_rx + 1020, 4);
			printf("got crc %" PRIu32 " \n", crc);

			/***CRC check, if correct, save the picture packet into the file***/
			if (crc == crcmine) {
				printf("CRC OK");

				if (remainingSizeOfFile >= 1016) {
					memcpy(buffer + ((currentPackter - 1) * 1024), buffer_rx, 1024);
					remainingSizeOfFile -= 1016;
				}
				else {
					memcpy(buffer + ((currentPackter - 1) * 1024), buffer_rx, remainingSizeOfFile);
					remainingSizeOfFile = 0;
				}

				printf("Sending packet.\n");
				//duplicate packet check
				//if (currentPackter == 10) {
				//	int tempBuff = -currentPackter;
				//	printf("\n wrong answer: %d\n", tempBuff);
				//	memcpy(buffer_tx, ((unsigned char*)& tempBuff), sizeof(currentPackter));
				//	sendto(socketS, buffer_tx, sizeof(currentPackter), 0, (sockaddr*)& addrDest, sizeof(addrDest));
				//}
				//else {
					printf("\nOK answer: %d\n", currentPackter);
					memcpy(buffer_tx, ((unsigned char*)& currentPackter), sizeof(currentPackter));
					sendto(socketS, buffer_tx, sizeof(currentPackter), 0, (sockaddr*)& addrDest, sizeof(addrDest));
				//}
				prev = currentPackter;
				if (counter == 10) {
					counter = 0;
				}
				previous[counter++] = currentPackter;
			}
			/***if CRC is incorrect, send back the number of previous packet, to get the current packet again***/
			else {
				i--;
				prev = -currentPackter;
				printf("%d\n", prev);
				printf("Sending packet again due to CRC.\n");
				memcpy(buffer_tx, ((unsigned char*)& prev), sizeof(prev));
				sendto(socketS, buffer_tx, sizeof(currentPackter), 0, (sockaddr*)& addrDest, sizeof(addrDest));
				if (badlyRecivied == 10) {
					badlyRecivied == 0;
				}
				wrongPackets[badlyRecivied++] = currentPackter++;


			}

			/***if I get a duplicate packet, send back the number of packet I received duplicate without saving the picture packet***/
		}
		if (duplicate && !correction) {
			duplicate = false;
			currentPackter = -(prev + 1);
			i--;
			printf("\n was supposed to get : %d\n", currentPackter);
			printf("Sending packet again due to duplicate.\n");
			memcpy(buffer_tx, ((unsigned char*)& currentPackter), sizeof(currentPackter));
			currentPackter = -currentPackter;
			Sleep(5);
			//sendto(socketS, buffer_tx, sizeof(count), 0, (sockaddr*)&addrDest, sizeof(addrDest));
			/*if (kount == 10) {
				kount == 0;
			}
			packet_nums[kount++] = count++;*/
			printf("expect: %d", currentPackter);

		}
	}


	for (int write = 0; write < currentPackter; write++) {
		fwrite((buffer + 4) + write * 1024, 1, 1016, fp);

	}

	free(buffer);
	fclose(fp);
	closesocket(socketS);
	printf("closed Socket");
#endif
	//**********************************************************************

	getchar(); //wait for press Enter
	return 0;
}


/*********************************************   CRC   ******************************************************/

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

uint32_t crc_32(const unsigned char* input_str, size_t num_bytes) {

	uint32_t crc;
	uint32_t tmp;
	uint32_t long_c;
	const unsigned char* ptr;
	size_t a;

	if (!crc_tab32_init) init_crc32_tab();

	crc = CRC_START_32;
	ptr = input_str;

	if (ptr != NULL) for (a = 0; a < num_bytes; a++) {

		long_c = 0x000000FFL & (uint32_t)* ptr;
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

