#include <thread>
#include <mutex>
#include <iostream>
#include <condition_variable>
#include <cstdlib>
#include <unistd.h>

static bool value = false;
static bool running = true;

std::mutex m;

std::condition_variable cv;

// Prvni vlakno ve smycce nahodne nastavuje hodnotu promenne 'value'
// Tuto hodnotu pak kontroluje druhe vlakno, vykonavajici 'logger'
void setter() {
	for(int i = 0 ; i < 100 ; i++) {
		{
			std::unique_lock<std::mutex> lock(m);
			value = (rand() % 2) == 0;
			std::cout << "Setting value = " << value << std::endl;
			cv.notify_one();
		}
		usleep(100 * 1000);
	}
	running = false;
}

// Druhe vlakno reaguje na zmenu v hodnote promenne 'value'
// Doplnte do vlakna podminkovou promennou tak, aby vlakno 
// nemuselo aktivne cekat na zmenu promenne (busy waiting)
void logger() {
	bool last_value = true;
	while(running) {
		std::unique_lock<std::mutex> lock(m);
		cv.wait(lock, [&] () {return value != last_value; });
		std::cout << "Value changed to " << value << std::endl;
		last_value = value;
		
	}
}

int main() {
	std::thread logger_thread(logger);
	std::thread setter_thread(setter);
	setter_thread.join();
    logger_thread.join();

	return 0;
}