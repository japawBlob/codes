#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define MAX_BUF 100

int main(int argc, char* argv[])
{
  int sockd;
  struct sockaddr_in my_addr, srv_addr;
  char buf[MAX_BUF];
  int count;
  int addrlen;

  if (argc < 3)
  {
    fprintf(stderr, "Usage: %s ip_address port_number\n", argv[0]);
    exit(1);
  }
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
  inet_aton(argv[1], &srv_addr.sin_addr);
  srv_addr.sin_port = htons(atoi(argv[2]));

  sendto(sockd, buf, strlen(buf)+1, 0,
      (struct sockaddr*)&srv_addr, sizeof(srv_addr));

  addrlen = sizeof(srv_addr);
  count = recvfrom(sockd, buf, MAX_BUF, 0,
      (struct sockaddr*)&srv_addr, &addrlen);
  write(1, buf, count);

  close(sockd);
  return 0;
}