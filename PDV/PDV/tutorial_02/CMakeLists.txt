cmake_minimum_required(VERSION 3.5.1)
project(B4B36PDV_02)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -O3 -fopenmp -pthread")

add_executable(benchmark.bin benchmark.cpp decryption.cpp PDVCrypt.cpp)
add_executable(condition_variable.bin condition_variable.cpp)
add_executable(decrypt.bin decrypt.cpp PDVCrypt.cpp)

add_custom_target(benchmark COMMAND benchmark.bin DEPENDS benchmark.bin)
add_custom_target(condition_variable COMMAND condition_variable.bin DEPENDS condition_variable.bin)
add_custom_target(decrypt COMMAND decrypt.bin DEPENDS decrypt.bin)
