#ifndef PDV_SEARCH_UTILS_H
#define PDV_SEARCH_UTILS_H

constexpr unsigned int LOG2worker(unsigned int x) {
    return (x == 1) ? 0 : 1 + LOG2worker(x >> 1);
}
constexpr unsigned int LOG2(unsigned int x) {
    return (x & (x-1)) ? 1 + LOG2worker(x) : LOG2worker(x);
}

#endif //PDV_SEARCH_UTILS_H
