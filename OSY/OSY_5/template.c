mutex_lock(m);
while(!ready)
	pthread_cond_wait(p,m);
read buffer;
mutex_unlock(m)





mutex_lock(m);
write(b);
ready=true
pthread_cond_signal(p);
mutex_unlock(m);