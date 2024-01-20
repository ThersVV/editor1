# CMakeList.txt: Projekt CMake pro editor1, sem přidejte logiku zdrojového
# kódu a definic specifickou pro projekt.
#
cmake_minimum_required (VERSION 3.8)

# Přidejte zdrojový kód ke spustitelnému souboru tohoto projektu.
add_executable (editor1 "editor1.cpp" "editor1.h" "example_cpp_file.cpp" "example_cpp_file.h")

# TODO: V případě potřeby přidejte testy a cíle instalace.
