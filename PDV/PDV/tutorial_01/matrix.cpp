#include <ctime>
#include <iostream>
#include <vector>
#include <memory>

// Nasledujici program pocita nasobeni matice vektorem, y = Ax
int main() {
    const int MAXIMUM = 10000;

    std::vector<double> A(MAXIMUM*MAXIMUM, 0);
    std::vector<double> x(MAXIMUM);
    std::vector<double> y(MAXIMUM);

    for ( int i = 0; i < MAXIMUM ; i ++) {
        x[i] = rand() % 100;
        y[i] = 0;
        for (int j = 0; j < MAXIMUM; j++)
            A[i * MAXIMUM + j] = rand() % 100;
    }


    clock_t begin = clock();

    for ( int i = 0; i < MAXIMUM ; i ++) {
        for ( int j = 0; j < MAXIMUM ; j ++) {
        		// Vsimnete si, ze vnitrni for smycka zpracovava po sobe jdouci prvky
        		// Tyto prvky uz mohou byt nactene v cache pameti procesoru, a my se
        		// tak vyhneme zbytecnym pristupum do pameti.
            y[i] += A[i * MAXIMUM + j]*x[j];
        }
    }     

    clock_t end = clock();
    double elapsed_secs = double(end - begin) / CLOCKS_PER_SEC;

    std::cout << "first i, second j; time " << elapsed_secs << "s" << std::endl;

    for ( int i = 0; i < MAXIMUM ; i ++) {
        y[i] = 0;
    }

    begin = clock();

    for ( int j = 0; j < MAXIMUM ; j ++) {
        for ( int i = 0; i < MAXIMUM ; i ++) {
        		// Naopak v teto implementaci, kdykoliv zmenime hodnotu promenne i ve
        		// vnitrni for smycce, skocime v pameti o MAXIMUM*sizeof(double) bytu.
        		// Nevyuzijeme tak princip lokality a donutime procesor nacitat data
        		// z pameti nacitat zbytecne (protoze ve chvili, kdy se vratime
        		// k predchazejici hodnote i, procesor uz dany blok pameti pravdepodobne
        		// "zapomnel" a bude ho muset nacist znova).
            y [i] += A[i * MAXIMUM + j]*x[j];
        }
    }

    end = clock();
    elapsed_secs = double(end - begin) / CLOCKS_PER_SEC;

    std::cout << "first j, second i; time " << elapsed_secs << "s" << std::endl;

}