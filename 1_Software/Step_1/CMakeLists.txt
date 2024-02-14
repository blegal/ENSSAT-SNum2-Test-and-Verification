cmake_minimum_required(VERSION 3.5)


set(CMAKE_C_FLAGS          "-Wall -O3 -march=native -mtune=native")
set(CMAKE_CXX_FLAGS        "-Wall -O3 -march=native -mtune=native")
set(CMAKE_EXE_LINKER_FLAGS "-lm")

project(main)

set(SOURCE_FILES
        ./src/main.c
        )

add_executable(main ${SOURCE_FILES})
