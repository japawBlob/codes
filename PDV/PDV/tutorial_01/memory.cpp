#include <cstdio>
#include <cstdlib>
#include <chrono>

using namespace std::chrono;

void benchmark(const size_t size, const size_t jump_size);

// Pocet iteraci v ramci jednoho mereni
constexpr unsigned int ITERS = 100'000'000;

// Pocet mereni
constexpr unsigned int TRIALS = 10;

// Konstanty pro prevod z bytu na kilobyty a megabyty (a opacne)
constexpr size_t KB = 1024;
constexpr size_t MB = 1024 * 1024;

int main(int argc, char ** argv) {
	// Provedeme benchmark pro ruzne velikosti pametoveho bloku od 128B do 2GB
	for(unsigned int i = 7 ; i < 32 ; i++) {
		benchmark(1L << i, 67);
	}

	return 0;
}

void benchmark(const size_t size, const size_t jump_size) {
	// Nejprve si naalokujeme blok pameti pozadovane velikosti
	char * memory = (char *) malloc(size * sizeof(char));

	// A spocteme masku, ktera nam umozni rychle pocitat modulo (pro size=2^n, x % size == x & mask)
	const size_t mask = size - 1;

	std::chrono::steady_clock::time_point begin = std::chrono::steady_clock::now();
	// Provedeme TRIALS mereni
	for(unsigned int trial = 0 ; trial < TRIALS ; trial++) {
		size_t index = 0;

		// A v prubehu mereni provedeme ITERS pristupu do pameti
		for(unsigned int i = 0 ; i < ITERS ; i++) {
			memory[index] ^= 1;
			index = (index + jump_size) & mask;

			// Pokud je velikost cache-line procesoru 64B, pricteni jump_size=67 k indexu zajisti, ze
			// nasledujici pristup do pameti bude pristupem do jine cache-line. Procesor tak bude nucen
			// ji nacist z pameti (resp. nejrychlejsi pameti cache, ve ktere je uz tento blok pameti
			// nacteny). Kod nam proto ilustruje "rychlost" pameti cache (merenou v poctu operaci za
			// vterinu), do ktere se blok pameti o velikosti size vejde.
		}
	}
	std::chrono::steady_clock::time_point end = std::chrono::steady_clock::now();

	// Abychom kompilatoru zabranili "odstranit" pri optimalizaci for smycku, s napocitanymi daty
	// provedeme operaci a vypiseme vysledek na standartni vystup (3. sloupec ve vypisu).
	unsigned int acc = 0;
	for(size_t i = 0 ; i < size ; i++) acc ^= memory[i];

	if(size < KB) {
		printf(" %4ldB   %8.2fMHz                    %d\n", size, (double)(TRIALS*ITERS) / duration_cast<microseconds>(end-begin).count(), acc);
	} else if(size < MB) {
		printf("%4ldKB   %8.2fMHz                    %d\n", size/KB, (double)(TRIALS*ITERS) / duration_cast<microseconds>(end-begin).count(), acc);
	} else {
		printf("%4ldMB   %8.2fMHz                    %d\n", size/MB, (double)(TRIALS*ITERS) / duration_cast<microseconds>(end-begin).count(), acc);
	}

	free(memory);
}