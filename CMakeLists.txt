cmake_minimum_required(VERSION 3.8)

set(CMAKE_TRY_COMPILE_TARGET_TYPE "STATIC_LIBRARY")

project(editor1app VERSION 1.0.0 LANGUAGES CXX)
if (EXISTS "${VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake")
    # Not using -DCMAKE_TOOLCHAIN_FILE becuase it apparently is not cross-compilation proof
    # Source: (https://stackoverflow.com/questions/55496611/cmake-cannot-find-libraries-installed-with-vcpkg)
    include(${VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake)
endif()

set(CMAKE_AUTOUIC ON)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CODE_LOC "../editor1/editor1")
####################################  
find_package(fmt CONFIG REQUIRED)
find_package(Qt6Core CONFIG REQUIRED)
find_package(Qt6Sql CONFIG REQUIRED)
find_package(Qt6Widgets CONFIG REQUIRED)
find_package(Qt6Gui CONFIG REQUIRED)
qt_standard_project_setup()

qt_add_executable(editor1app "${CODE_LOC}/editor1.cpp" "${CODE_LOC}/editor1.h" "${CODE_LOC}/example_cpp_file.cpp" 
"${CODE_LOC}/example_cpp_file.h")
target_include_directories(editor1app PRIVATE ${Qt6Widgets_INCLUDE_DIRS} ${Qt6Gui_INCLUDE_DIRS} ${fmt_INCLUDE_DIRS})
target_link_libraries(editor1app PRIVATE Qt6::Core Qt6::Widgets Qt6::Gui Qt6::Sql fmt::fmt)
####################################

# Zahrňte podprojekty.
add_subdirectory ("editor1")
