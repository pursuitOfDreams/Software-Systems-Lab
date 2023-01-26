cmake_minimum_required(VERSION 2.8.9)
project(outlab)
include_directories(./myengine)
add_library(MyEngineStatic STATIC myengine/myengine.cpp)
install(TARGETS MyEngineStatic DESTINATION /usr/local/lib/)
install(FILES myengine/myengine.hpp DESTINATION /usr/local/include)

include_directories(./myengine)
add_library(MyEngineDynamic SHARED myengine/myengine.cpp)
install(TARGETS MyEngineDynamic DESTINATION /usr/local/lib/)
install(FILES myengine/myengine.hpp DESTINATION /usr/local/include)

add_executable(helloworld helloworld.cpp)
add_executable(usespthread usespthread.cpp)

target_link_libraries(usespthread pthread)







