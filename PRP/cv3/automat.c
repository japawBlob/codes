#include <stdio.h>

int main(){
	int p = 77;
	int dvacka = 0;
	int desetikoruna = 0;
	int petikoruna = 0;
	int dvoukoruna = 0;
	int koruna = 0;

	scanf("%d", &p);

	while(p>=20){
		p=p-20;
		dvacka++;
	}
	while(p>=10){
		p=p-10;
		desetikoruna++;
	}
	while(p>=5){
		p=p-5;
		petikoruna++;
	}
	while(p>=2){
		p=p-2;
		dvoukoruna++;
	}
	while(p>=1){
		p=p-1;
		koruna++;
	}
	/*for(i=0;p<20;i++){
		p-=20;	
		dvacka++;
	}
	for(i=0;p<10;i++){
		p-=10;	
		desetikoruna++;
	}
	for(i=0;p<5;i++){
		p-=5;	
		petikoruna++;
	}
	for(i=0;p<2;i++){
		p-=2;	
		dvoukoruna++;
	}
	for(i=0;p<1;i++){
		p-=1;	
		koruna++;
	}
	*/
	printf("%d dvacetikorun\n%d desetikorun\n%d petikorun\n%d dvoukorun\n%d korun\n", dvacka, desetikoruna, petikoruna, dvoukoruna, koruna);
}
