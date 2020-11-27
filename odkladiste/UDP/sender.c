#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <time.h>

#define MAX_BUF 100
int transmiter(char * ip_address, int port, int playload_size, int messages_count);
int origin(char * ip_address, int port, int playload_size, int messages_count);

int main(){

  transmiter("192.168.1.116", 2347, 4, 100000);
  //origin("192.168.1.116", 2347, 2000, 5);
  return 0;
}

int transmiter(char * ip_address, int port, int playload_size, int messages_count)
{
  struct timespec ts;
  int sockd;
  struct sockaddr_in my_addr, srv_addr;
  char buf[playload_size];
  char recvBuf[playload_size];
  int count;
  int addrlen;

  /* Create a UDP socket */
  sockd = socket(AF_INET, SOCK_DGRAM, 0);
  if (sockd == -1)
  {
    perror("Socket creation error");
    exit(1);
  }

  /* Configure client address */
  my_addr.sin_family = AF_INET;
  my_addr.sin_addr.s_addr = INADDR_ANY;
  my_addr.sin_port = 0;

  bind(sockd, (struct sockaddr*)&my_addr, sizeof(my_addr));

  strcpy(buf, "");

  int size = 2;
  int* hist = (int*)malloc(sizeof(int)*size);
  for(int i=0; i<size; i++){
      hist[i] = 0;
  }

  /* Set server address */
  srv_addr.sin_family = AF_INET;
  inet_aton(ip_address, &srv_addr.sin_addr);
  srv_addr.sin_port = htons(port);

  struct timeval tv;
  tv.tv_sec = 0;
  tv.tv_usec = 500000;
  if (setsockopt(sockd, SOL_SOCKET, SO_RCVTIMEO,&tv,sizeof(tv)) < 0) {
      perror("Error");
  }

  unsigned long max = 0;
do{
  //memset(buf,1,strlen(buf));

  //itoa(messages_count, buf, 10);
  for(int i=0; i<playload_size; i++){
      buf[i] = '0';
  }
  int tailingZeroPosition = sprintf(buf, "%i", messages_count);
  buf[tailingZeroPosition] = '0';
  /*printf("sendBuff:\n");
  for(int i=0; i<playload_size; i++){
      printf("%x ", buf[i]);
  } printf("\n");*/
  
  //printf("strlen: %lu\t", strlen(buf)+1);
  timespec_get(&ts,TIME_UTC);
  unsigned long blob = (1000000000 * ts.tv_sec + ts.tv_nsec)/1000;
  sendto(sockd, buf, playload_size, 0,
      (struct sockaddr*)&srv_addr, sizeof(srv_addr));

  addrlen = sizeof(srv_addr);
  count = recvfrom(sockd, recvBuf, playload_size, 0,
      (struct sockaddr*)&srv_addr, &addrlen);
  timespec_get(&ts,TIME_UTC);
  unsigned long blob2 = (1000000000 * ts.tv_sec + ts.tv_nsec)/1000;
  //write(1, buf, count);
  if(count == -1){
    printf("error - timeout\n");
    continue;
  }
  unsigned long delta = blob2-blob;
  //printf("%i delta: %lu\n", atoi(buf), blob2-blob);
  if(delta >= size){
    void* blob = hist;
    int i = size;
    size = delta+1;
    hist = (int*)realloc(blob, sizeof(int)*(delta+2));
    while(i < size){
        hist[i] = 0;
        i++;
    }
  }
  hist[delta]++;
  if(delta > max){
    max  = delta;
  }
  hist[delta]++;
  /*printf("Recv:\n");
  for(int i=0; i<playload_size; i++){
      printf("%x ", recvBuf[i]);
  } printf("\n");*/
  messages_count--;
} while (messages_count != 0);
  /*for(int i=0; i<size ; i++){
      printf("%i,", i);
  } printf("\n");*/
  int mostCommonOccurance = 0;
  int commonPosition = 0;
  for(int i=0; i<size ; i++){
      printf("%i,", hist[i]);
      if(hist[i] > mostCommonOccurance){
        mostCommonOccurance = hist[i];
        commonPosition = i;
      }
  } printf("\n");
  printf("Max: %lu MostCommon: %i\n", max, commonPosition);
  free(hist);
  close(sockd);
  return 0;
}


int origin(char * ip_address, int port, int playload_size, int messages_count)
{
  int sockd;
  struct sockaddr_in my_addr, srv_addr;
  char buf[MAX_BUF];
  int count;
  int addrlen;
  /* Create a UDP socket */
  sockd = socket(AF_INET, SOCK_DGRAM, 0);
  if (sockd == -1)
  {
    perror("Socket creation error");
    exit(1);
  }

  /* Configure client address */
  my_addr.sin_family = AF_INET;
  my_addr.sin_addr.s_addr = INADDR_ANY;
  my_addr.sin_port = 0;

  bind(sockd, (struct sockaddr*)&my_addr, sizeof(my_addr));

  strcpy(buf, "Hello world\n");

  /* Set server address */
  srv_addr.sin_family = AF_INET;
  inet_aton(ip_address, &srv_addr.sin_addr);
  srv_addr.sin_port = htons(port);

  sendto(sockd, buf, strlen(buf)+1, 0,
      (struct sockaddr*)&srv_addr, sizeof(srv_addr));

  addrlen = sizeof(srv_addr);
  count = recvfrom(sockd, buf, MAX_BUF, 0,
      (struct sockaddr*)&srv_addr, &addrlen);
  write(1, buf, count);

  close(sockd);
  return 0;
}