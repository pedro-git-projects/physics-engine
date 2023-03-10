cmake_minimum_required(VERSION 3.14)

project(PhysicsEngine VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

########################## Adding Google Test ###########################

include(FetchContent)
FetchContent_Declare(googletest
	GIT_REPOSITORY	https://github.com/google/googletest
	GIT_TAG release-1.12.1
)
FetchContent_GetProperties(googletest)
if(NOT googletest_POPULATED)
	FetchContent_Populate(googletest)
	add_subdirectory(${googletest_SOURCE_DIR} ${googletest_BUILD_DIR})
endif()

#########################################################################

set(INCLUDE_SOURCES
	headers/
)

include_directories(${INCLUDE_SOURCES})
link_directories(${INCLUDE_SOURCES})

set(PROJECT_SOURCES
	src/main.cc
)

add_library(PhysicsEngineLib STATIC ${PROJECT_SOURCES})

add_executable(PhysicsEngine ${PROJECT_SOURCES})

target_link_libraries(PhysicsEngine PhysicsEngineLib)


########################## Google Test libs bin and linking ###########################

set(TEST_SOURCES
	tests/test.cc
)

add_executable(TestRunner ${TEST_SOURCES})
target_link_libraries(TestRunner PhysicsEngineLib gtest_main gmock_main)
