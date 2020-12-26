/* This program sends "Hello world" string to address and port given
 * as command line parameters, then it wait for any response and
 * prints it. */

#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define MAX_BUF 100
int listener(int port, int playload_size, int messages_count);
int main(int argc, char const *argv[])
{
  listener(2347, 100, 5);
  return 0;
}

int listener(int port, int playload_size, int messages_count)
{
  int sockd;
  struct sockaddr_in my_name, cli_name;
  char buf[payload_size];
  int status;
  int addrlen;

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
  my_name.sin_port = htons(port);

  status = bind(sockd, (struct sockaddr*)&my_name, sizeof(my_name));

  addrlen = sizeof(cli_name);
  do{
 status = recvfrom(sockd, buf, payload_size, 0,
       (struct sockaddr*)&cli_name, &addrlen);

   status = sendto(sockd, buf, payload_size+1, 0,
       (struct sockaddr*)&cli_name, sizeof(cli_name));
   messages_count--;
  } while (messages_count != 0);
 

  close(sockd);
  return 0;
}
