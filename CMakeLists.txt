cmake_minimum_required(VERSION 3.0)
project(HackHelloWorld)

if(NOT CMAKE_BUILD_TYPE)
  message(
    STATUS
      "Build type is default defined as Release. change it by define -DCMAKE_BUILD_TYPE=Debug as param to cmake"
  )
  set(CMAKE_BUILD_TYPE Release)
endif()

include(env/emscripten.cmake)

set(CMAKE_CXX_STANDARD 17)

set(EXE_NAME ${CMAKE_PROJECT_NAME})
add_executable(${EXE_NAME}  src/Main.cpp src/HackHelloWorld.cpp src/HackHelloWorld.h)
get_target_property(EXE_FILES ${EXE_NAME} SOURCES)
target_link_libraries(${EXE_NAME} ${CONAN_LIBS})
if(WIN32)
  target_compile_definitions(${EXE_NAME} PRIVATE UNICODE _UNICODE)
endif()

if(EMSCRIPTEN)
  wasemize_exe(${EXE_NAME})
endif()

# Tests
set(TEST_NAME ${EXE_NAME}Test)
add_executable(${TEST_NAME} src/HackHelloWorld.cpp src/HackHelloWorld.h tests/HackHelloWorldTest.cpp tests/Main.cpp)
get_target_property(TEST_FILES ${TEST_NAME} SOURCES)
target_link_libraries(${TEST_NAME} ${CONAN_LIBS})
if(WIN32)
  target_compile_definitions(${TEST_NAME} PRIVATE UNICODE _UNICODE)
endif()
