TODO tohle vsechno, jen sepisuju myslneky xd

1. ve VSCODE nastaveni najdi C/C++: Edit configurations (UI), tam include path, přidej tam něco jako /usr/local/qt6/**
2. Někam si pullni vcpkg repozitář a v compile.sh k němu nastav cestu (TODO parametr) a nastav tam i TRIPLET asi
3. Na windowsu nainstalovat VS s C++ desktop balickem, cmake, clonenout vcpkg, nastavit veci v compile.sh a je to. Jeste je potreba najit co je potreba ve vidual studiu nastavit, pravdepodobne jen includy.

PS: On Windows 11 vcpkg used different triplet than it specified in my CMakeLists.txt file. If compile.sh does not succeed, uncomment and comment relevant lines, it should be intuitive which ones


            "includePath": [
                "${workspaceFolder}/**",
                "C:/vcpkg/installed/x64-windows/include/gtkmm-4.0/**",
                "C:/vcpkg/installed/x64-windows/include/glibmm-2.68/**",
                "C:/vcpkg/installed/x64-windows/include/glib-2.0/**",
                "C:/vcpkg/installed/x64-windows/include/",
                "C:/vcpkg/installed/x64-windows/include/giomm-2.68/**",
                "C:/vcpkg/installed/x64-windows/include/cairo/**",
                "C:/vcpkg/installed/x64-windows/include/gtk-4.0/**",
                "C:/vcpkg/installed/x64-windows/include/pango-1.0/**",
                "C:/vcpkg/installed/x64-windows/include/harfbuzz/**",
                "C:/vcpkg/installed/x64-windows/include/gdk-pixbuf-2.0/**",
                "C:/vcpkg/installed/x64-windows/include/pangomm-2.48/**",
                "C:/vcpkg/installed/x64-windows/include/graphene-1.0/**",
                "C:/vcpkg/installed/x64-windows/lib/**"
            ],