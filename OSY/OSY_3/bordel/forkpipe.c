 #include <sys/types.h>
#include <sys/wait.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <signal.h>

int main(){
	int pipefd[2];
	if(pipe(pipefd) == -1){
		return 2;
	}
	pid_t genChild;
	pid_t nsdChild;

	genChild = fork();

	if(genChild<0){
		return 2;
	}
	if(genChild != 0){
		nsdChild = fork();
	}
	if(nsdChild<0){
		return 2;
	}

	if(genChild==0){
		if(dup2(pipefd[1],1) == -1){
			return 2;
		}
		close(pipefd[1]);
		close(pipefd[0]);

		signal(SIGTERM, blob);

		while(true){
			printf(“%d %d\n”, rand() % 4096, rand() % 4096);
			fflush(1); //matyas ma stdout
			sleep(1);
		}


	}
	if(nsdChild==0){
		if(dup2(pipefd[0],0) == -1){
			return 2;
		}
		close(pipefd[1]);
		close(pipefd[0]);

		if(execl("./nsd","nsd",NULL) == -1){
			return 2;
		}
	}
	if(nsdChild != 0 && genChild != 0){
		close(pipefd[0]);
		close(pipefd[1]);
		sleep(5);

		kill(genChild, SIGTERM);
		int blob;
		waitpid(-1, &blob, 0);
		/*if(blob != 0){
			printf("ERROR")
			return 1;
		}*/
		int blob2;
		waitpid(-1, &blob2, 0);
		if(blob2 != 0 || blob != 0){
			printf("ERROR")
			return 1;
		} else {
			printf("OK");
			return 0;
		}
	}
	return 0;
}

void blob (){
	write(2,"GEN TERMINATED", 15);
	//exit(0);
}