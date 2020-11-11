//#include <cstdlib>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <pthread.h>


int a[2];
pthread_mutex_t mutex[2];
void *fce1(void *n) {
int num=*(int*)n;
for (int i = 0; i < 150; i++) {
pthread_mutex_lock(&mutex[0]);
pthread_mutex_lock(&mutex[1]);
a[num] += a[1-num];
pthread_mutex_unlock(&mutex[1]);
pthread_mutex_unlock(&mutex[0]);
}
pthread_exit(NULL);
}
void *fce2(void *n) {
int num=*(int*)n;
for (int i = 0; i < 150; i++) {
pthread_mutex_lock(&mutex[1]);
pthread_mutex_lock(&mutex[0]);
a[num] += a[1-num];
pthread_mutex_unlock(&mutex[0]);
pthread_mutex_unlock(&mutex[1]);
}
pthread_exit(NULL);
}
int main()
{
pthread_t tid[2];
a[0]=0; a[1]=1;
pthread_mutex_init(&mutex[0], NULL);
pthread_mutex_init(&mutex[1], NULL);
pthread_create(&tid[0], NULL, fce1, NULL);
pthread_create(&tid[1], NULL, fce2, NULL);
pthread_join(tid[0], NULL);
pthread_join(tid[1], NULL);
return 0;
}

