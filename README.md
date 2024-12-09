Compilation guide:

On Linux (Proven to work in Fedora 40 docker container and in Ubuntu 22.04 docker container):
1. Clone the vcpkg repository (https://github.com/microsoft/vcpkg.git)
2. In compile.sh, set the VCPKG_ROOT variable to the full path of the previously cloned repository
3. Run `sudo ./install_linux_pkgs.sh` or install the packages specified inside by hand
4. Run `./compile.sh`
5. (In the root directory of this project a Makefile should appear. Then you can just run make and editorMain will be created, which you can simply run)

On Windows (Proven to work in Windows 10 Virtual Machine):
1. Install Visual Studio with the "Desktop Development with C++" workload
2. Install CMake
3. Clone the vcpkg repository (https://github.com/microsoft/vcpkg.git)
4. In compile.sh, set the VCPKG_ROOT variable to the full path of the previously cloned repository
5. Run compile.sh
6. (Then you can open the generated .sln file in Visual studio and happily so whatever you wanted to do)

If you examine the compile.sh file, you'll find that it will install some X libraries using the Ubuntu/Fedora default package manager. Why not use VCPKG? I've tried it and it's not only a bit of a hassle (one must set an enviroment variable in the triplet cmake file), still libXcursor has no VCPKG replacement and then, when everything finally compiles, cmake throws a warning at the user. I'm not sure what the warning means or how difficult it is to solve. But what was obvious was that using apt/dnf for these development libraries is just easier and probably will result in less unexpected behaviour in the future.
