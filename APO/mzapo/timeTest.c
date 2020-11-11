#include <stdio.h>
#include <time.h>
#include <unistd.h>
#include <math.h>

int main ()
{
  /*clock_t now = time(0);
  clock_t then;
  printf ("Current local time and date: %ld", now );
  while(1){
  	//printf("%ld\n", time(0));
  	//printf ( "Current local time and date: %ld, %ld\n", time(0) , (time(0)+2));
  	then = time(0);
  	//printf ( "Current local time and date: %ld, %ld\n", then , now);
  	if((now + 2) < then) {
  		printf("blob");
  		printf ("Current local time and date: %ld\n", then);
  		now = time(0);
  	}
  }
  */
  int ms;
  int then;
  struct timespec spec;
  clock_gettime(CLOCK_REALTIME, &spec);
  ms = round(spec.tv_nsec / 1.0e6);
  printf("%i\n", ms);
  clock_gettime(CLOCK_REALTIME, &spec);
  ms = round(spec.tv_nsec / 1.0e6);
  printf("%i\n", ms);
  while(1){
  	clock_gettime(CLOCK_REALTIME, &spec);
  	then = round(spec.tv_nsec / 1.0e6);
  	//printf ( "Current local time and date: %ld, %ld\n", then , now);
  	//if(ms+250>1000) ms = ms-1000;
  	if((ms) == then) {
  		//printf("blob");
  		printf ("Current local time and date: %i\n", ms);
  		clock_gettime(CLOCK_REALTIME, &spec);
  		ms = round(spec.tv_nsec / 1.0e6) + 999;
  		if(ms > 1000) ms = ms - 1000;
  	}
  }
  //usleep(25*1000);
  //clock_gettime(CLOCK_REALTIME, &spec);
  //ns = spec.tv_nsec/10000;
  //printf("%i\n", ns);

  return 0;
}