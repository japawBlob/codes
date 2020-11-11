cmake_minimum_required(VERSION 3.5.1)
project(vectorization)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -O2 -march=native")

add_executable(autovec autovec.cpp)
#target_compile_options(autovec PUBLIC -ftree-vectorize -fopt-info-vec-all)
add_executable(prob prob.cpp)
add_executable(cond cond.cpp)
add_executable(lzcnt lzcnt.cpp)
add_executable(popcnt popcnt.cpp)
