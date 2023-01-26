cmake_minimum_required(VERSION 2.8.9)
project(mygame)

find_library(LIB_DYNAMIC libMyEngineDynamic.so)
find_library(LIB_STATIC libMyEngineStatic.a)

message(STATUS ${LIB_DYNAMIC})
message(STATUS ${LIB_STATIC})


add_executable(mygamestatic mygame.cpp)
add_executable(mygamedynamic mygame.cpp)

target_link_libraries(mygamedynamic PRIVATE ${LIB_DYNAMIC})
target_link_libraries(mygamestatic PRIVATE ${LIB_STATIC})

