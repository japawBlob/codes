#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define MAX_BUF 1024

int main(int argc, char* argv[])
{
  int sockd;
  struct sockaddr_in my_name, cli_name;
  char buf[MAX_BUF];
  int status;
  int addrlen;

  if (argc < 2)
  {
    fprintf(stderr, "Usage: %s port_number\n", argv[0]);
    exit(1);
  }
  /* Create a UDP socket */
  sockd = socket(AF_INET, SOCK_DGRAM, 0);
  if (sockd == -1)
  {
    perror("Socket creation error");
    exit(1);
  }

  /* Configure server address */
  my_name.sin_family = AF_INET;
  my_name.sin_addr.s_addr = INADDR_ANY;
  my_name.sin_port = htons(atoi(argv[1]));

  status = bind(sockd, (struct sockaddr*)&my_name, sizeof(my_name));

  addrlen = sizeof(cli_name);
  status = recvfrom(sockd, buf, MAX_BUF, 0,
      (struct sockaddr*)&cli_name, &addrlen);

  printf("%s", buf);
  strcat(buf, "OK!\n");

  status = sendto(sockd, buf, strlen(buf)+1, 0,
      (struct sockaddr*)&cli_name, sizeof(cli_name));

  close(sockd);
  return 0;
}