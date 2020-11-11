#include <cstdio>

int main(int argc, char ** argv) {

	// Pomoci #pragma omp parallel num_threads(64) rekneme kompilatoru,
	// ze ma nasledujici blok kodu spustit 64x na 64 vlaknech,
	// Vice o OpenMP se dozvite v prubehu semestru.
	#pragma omp parallel num_threads(64)
	{
		printf("Hello ");
		printf("parallel");
		printf(" world!\n");

		// Vlakna bezi soucasne, a jejich operace se tak mohou prokladat.
	}

	return 0;
}