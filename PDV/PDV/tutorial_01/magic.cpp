#include <cstdio>
#include <chrono>
#include <cmath>
#include <omp.h>

#include "timing.h"
#include "cpu_info.h"

void magic_operation(double * array) {
	// Vypocet hodnoty array[i] nezavisi na vypoctu hodnoty array[j] (pro i != j).
	// Muzeme proto vypocty ruznych array[i] rozdelit mezi vice vlaken pomoci:
	// #pragma omp parallel for
	for(unsigned int i = 0 ; i < 1'000'000 ; i++) {
		for(unsigned int k = 0 ; k < 500 ; k++) {
			array[i] = exp(log(array[i]));
		}
	}
}

int main(int argc, char ** argv) {
	double * array = new double[1'000'000];

	omp_set_num_threads(get_num_cores());

	START_TIMING(loop)
	magic_operation(array);
	STOP_TIMING(loop, "magic_operation")

	delete[] array;

	return 0;
}