// Makra pro mereni casu (vyzaduji #include <chrono> a #include <cstdio>)

// Zahajeni mereni (s je identifikator promenne, ktera se pouzije pro ulozeni casu)
#define START_TIMING(s) auto begin_##s = std::chrono::steady_clock::now();

// Ukonceni mereni (s odpovida identifikatoru pouzitem v START_TIMING a desc je retezec
// kterym je aktualne probehly blok popsan na standartnim vystupu).
#define STOP_TIMING(s,desc)\
  auto end_##s = std::chrono::steady_clock::now(); \
  printf("%s took %ldus\n", desc, \
  	std::chrono::duration_cast<std::chrono::microseconds>(end_##s - begin_##s).count());


// Priklad pouziti:
//   START_TIMING(my_measurement)
//   for(int i = 0 ; i < 1000000 ; i++) j += array[i];
//   STOP_TIMING(my_measurement, "Sum of 1M numbers")
