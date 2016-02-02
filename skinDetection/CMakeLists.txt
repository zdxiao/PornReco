cmake_minimum_required(VERSION 2.8)
project (skinDetection)

set(CMAKE_PREFIX_PATH ${CMAKE_PREFIX_PATH} "/home/xiao/OpenCV/OpenCV/build")
# opencv3 package required
find_package(OpenCV 3.0.0 REQUIRED)
include_directories(${OpenCV_INCLUDE_DIRS})

# skinDetection library
include_directories(include)
set(SOURCE_FILES
	src/xzdImageProcess.cpp
	src/calSkinRatio.cpp
)
add_library(skinDetection STATIC ${SOURCE_FILES})

# test cases
add_executable(demo main.cpp)

#link
target_link_libraries(demo ${OpenCV_LIBS} skinDetection ${OpenCV_LIBS})
set_target_properties(demo PROPERTIES RUNTIME_OUTPUT_DIRECTORY ../)

