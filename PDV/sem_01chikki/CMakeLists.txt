cmake_minimum_required(VERSION 3.5.1)
project(PDV_Search)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=native -fopenmp -O3")

add_executable(search main.cpp state.h domains/hanoi.h domains/maze.h domains/sat.h domains/slidingPuzzle.h
        domains/utils.h algorithms/bfs.cpp algorithms/bfs.h algorithms/iddfs.cpp algorithms/iddfs.h)