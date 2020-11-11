#include <stdio.h>


void write_numbers(){
	long int arr[] = {-1, 6, 16, 0 ,-2, 1208957128};
	float arrf[] = {0.7,0.5};
	FILE* f = fopen("cisla", "w");
	fwrite(arr, sizeof(*arr), sizeof(arr)/sizeof(*arr), f);
	fwrite(arrf, sizeof(*arrf), sizeof(arrf)/sizeof(*arrf), f);
	fclose(f);
}

void read_numbers(){
	long int arr[3];
	float arrf[2];
	FILE* f = fopen("cisla", "r");
	fread(arr, sizeof(*arr), sizeof(arr)/sizeof(*arr), f);
	//fread(arrf, sizeof(*arrf), sizeof(arrf)/sizeof(*arrf), f);
	fread(arrf, sizeof(arrf), 1, f);
	fclose(f);
	for(int i = 0; i<3; i++){
		printf("%li ", arr[i]);
	}
	for(int i = 0; i<2; i++){
		printf("%f", arrf[i]);
	}
	printf("\n");
}

struct test {
    int ival;
    char cval;
};
typedef struct test test_t;

void write_struct(){
	test_t str;
	str.ival = 1;
	str.cval = 'a';
	FILE* f = fopen("struct", "w");
	fwrite(&str, sizeof(str), 1, f);
	fclose(f);
}

void read_struct(){
	test_t str;
	FILE* f = fopen("struct", "r");
	fread(&str, sizeof(str), 1, f);
	fclose(f);
	printf("%i %c", str.ival, str.cval);
}

struct test2 {
    int ival;
    char cval;
    char *s;
};
typedef struct test2 test2_t;


void write_test2(){
	test2_t str;
	str.ival = 1;
	str.cval = 'a';
	str.s = "ahoj";
	FILE* f = fopen("struct", "w");
	fwrite(&str, sizeof(str), 1, f);
	
	
	//char text[] = str.s;
	int i = 0;
	while(str.s[i] != '\0'){
		fwrite(&str.s[i], sizeof(str.s[pocet]), 1, f);
	}
	fclose(f);
}

void read_test2(){
	test2_t str;
	char text[100];
	FILE* f = fopen("struct", "r");
	fread(&str, sizeof(str), 1, f);
	fread(&str.s, sizeof(str.s), 1, f);
	fclose(f);
	printf("ival :%i\n", str.ival, str.cval);
	printf("cval :%c\n", str.ival, str.cval);
	printf("s: %s\n", str.s);
}








int main(){
	//write_numbers();
	//read_numbers();
	//write_struct();
	//read_struct();
	write_test2();
	read_test2();
}



//*arr == arr[0]
