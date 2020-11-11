cmake_minimum_required(VERSION 3.5.1)
project(ZK_04)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3 -fopenmp -march=native -pthread")

add_executable(levenshtein main_levenshtein.cpp levenshtein.cpp levenshtein.h strings.h strings.cpp)
add_executable(filter main_filter.cpp filter.cpp filter.h data_table.h data_table.cpp)

