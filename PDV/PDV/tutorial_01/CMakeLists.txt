cmake_minimum_required(VERSION 3.5.1)
project(B4B36PDV_01)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -O3 -fopenmp -pthread")

add_executable(hello.bin hello.cpp)
add_executable(memory.bin memory.cpp)
add_executable(magic.bin magic.cpp cpu_info.cpp)
add_executable(matrix.bin matrix.cpp)
add_executable(decrypt.bin decrypt.cpp PDVCrypt.cpp)
add_executable(false_sharing.bin false_sharing.cpp)

add_custom_target(hello COMMAND hello.bin DEPENDS hello.bin)
add_custom_target(memory COMMAND memory.bin DEPENDS memory.bin)
add_custom_target(magic COMMAND magic.bin DEPENDS magic.bin)
add_custom_target(matrix COMMAND matrix.bin DEPENDS matrix.bin)
add_custom_target(decrypt COMMAND decrypt.bin DEPENDS decrypt.bin)
add_custom_target(false_sharing COMMAND false_sharing.bin DEPENDS false_sharing.bin)
