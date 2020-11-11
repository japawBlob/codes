#include "integrate.h"

#include <omp.h>
#include <cmath>

double
integrate_sequential(std::function<double(double)> integrand, double a, double step_size, int step_count) {

    // Promenna kumulujici obsahy jednotlivych obdelniku
    double acc = 0.0;

    //TODO doplnte kod
    //spodni mez = a
    //horni mez = a+step_size
    for (int i = 0; i < step_count; ++i){	
    	double stred = (a+i*step_size+a+i*step_size+step_size)/2;
    	acc += integrand(stred) * step_size;
    }
    
    // Celkovy obsah aproximuje hodnotu integralu funkce
    return acc;
}

double
integrate_omp_critical(std::function<double(double)> integrand, double a, double step_size, int step_count) {
    double acc = 0.0;

    //TODO
    // Rozdelte celkovy interval na podintervaly prislusici jednotlivym vlaknum
    // Identifikujte kritickou sekci, kde musi dojit k zajisteni konzistence mezi vlakny
    #pragma omp parallel
    {
        double threadNumber = omp_get_thread_num();
        double numberOfThreads = omp_get_num_threads();
        int batch = step_count/numberOfThreads;
        int start = threadNumber*batch;
        int end =  threadNumber + 1 < numberOfThreads ? start + batch : step_count;
        double blob = 0;
	   	for (int i = start; i < end; ++i){	
    		double stred = (a+i*step_size+a+i*step_size+step_size)/2;
    		blob += integrand(stred) * step_size;
    	}
        #pragma omp critical
        {
            acc+=blob;
        }
    }
    return acc;
}

double
integrate_omp_atomic(std::function<double(double)> integrand, double a, double step_size, int step_count) {
    double acc = 0.0;

    #pragma omp parallel
    {
        double threadNumber = omp_get_thread_num();
        double numberOfThreads = omp_get_num_threads();
        int batch = step_count/numberOfThreads;
        int start = threadNumber*batch;
        int end =  threadNumber + 1 < numberOfThreads ? start + batch : step_count;
        double blob = 0;
        for (int i = start; i < end; ++i){  
            double stred = (a+i*step_size+a+i*step_size+step_size)/2;
            blob += integrand(stred) * step_size;
        }
        #pragma omp atomic
        acc+=blob;
    }
    return acc;
}

double integrate_omp_reduction(std::function<double(double)> integrand, double a, double step_size, int step_count) {
    double acc = 0.0;

    #pragma omp parallel reduction(+:acc)
    {
        double threadNumber = omp_get_thread_num();
        double numberOfThreads = omp_get_num_threads();
        int batch = step_count/numberOfThreads;
        int start = threadNumber*batch;
        int end =  threadNumber + 1 < numberOfThreads ? start + batch : step_count;
        for (int i = start; i < end; ++i){  
            double stred = (a+i*step_size+a+i*step_size+step_size)/2;
            acc += integrand(stred) * step_size;
        }
    }
    return acc;
}

double integrate_omp_for_static(std::function<double(double)> integrand, double a, double step_size, int step_count) {
    double acc = 0.0;
    #pragma omp parallel for reduction(+:acc)
        for (int i = 0; i < step_count; ++i){  
            double stred = (a+i*step_size+a+i*step_size+step_size)/2;
            acc += integrand(stred) * step_size;
        }
    return acc;
}

double integrate_omp_for_dynamic(std::function<double(double)> integrand, double a, double step_size, int step_count) {
    double acc = 0.0;
    #pragma omp parallel for reduction(+:acc) schedule(dynamic, 20)
        for (int i = 0; i < step_count; ++i){  
            double stred = (a+i*step_size+a+i*step_size+step_size)/2;
            acc += integrand(stred) * step_size;
        }
    return acc;
}
