cmake_minimum_required(VERSION 3.8)

set(CMAKE_TRY_COMPILE_TARGET_TYPE "STATIC_LIBRARY")
set(VCPKG_TARGET_TRIPLET ${TRIPLET})

project(editorMain VERSION 1.0.0 LANGUAGES CXX)
if (EXISTS "${VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake")
    # Not using -DCMAKE_TOOLCHAIN_FILE becuase it apparently is not cross-compilation proof
    # Source: (https://stackoverflow.com/questions/55496611/cmake-cannot-find-libraries-installed-with-vcpkg)
    include(${VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake)
endif()

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Use the package PkgConfig to detect GTK+ headers/library files
find_package(PkgConfig REQUIRED)
find_package(Threads REQUIRED)
find_package(fmt CONFIG REQUIRED)

pkg_check_modules(GTK4 REQUIRED gtk4)
PKG_CHECK_MODULES(GTKMM gtkmm-4.0)
pkg_check_modules(GTKMM_VARS REQUIRED IMPORTED_TARGET gtkmm-4.0)
pkg_search_module(LIBSIGCPP REQUIRED sigc++ sigc++-3.0)

####################################  

set(CODE_LOC "../editorMain/editor1")
add_executable(editorMain "${CODE_LOC}/editor1.cpp" "${CODE_LOC}/editor1.h" "${CODE_LOC}/example_cpp_file.cpp" 
"${CODE_LOC}/example_cpp_file.h")
set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT editorMain)

####################################

target_include_directories(editorMain PRIVATE ${GTK4_INCLUDE_DIRS} ${GTKMM_INCLUDE_DIRS} ${fmt_INCLUDE_DIRS} ${LIBSIGCPP_INCLUDE_DIRS})
target_link_directories(editorMain PRIVATE ${GTK4_LIBRARY_DIRS} ${GTKMM_LIBRARY_DIRS} ${VCPKG_ROOT}/packages/gtk_x64-windows/lib)
target_link_libraries(editorMain PRIVATE ${GTKMM_LIBRARIES} fmt::fmt PkgConfig::GTKMM_VARS ${LIBSIGCPP_LINK_LIBRARIES})

add_definitions(${GTK4_CFLAGS_OTHER})
target_compile_definitions(editorMain PRIVATE ${GTKMM_CFLAGS_OTHER})

# Zahrňte podprojekty.
add_subdirectory ("editor1")
