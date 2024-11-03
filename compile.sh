
VCPKG_ROOT="C:/vcpkg"
TRIPLET="x64-windows" #of course change this to linux (or delete)

CMAKE_TOOLCHAIN_FILE="$VCPKG_ROOT/scripts/buildsystems/vcpkg.cmake";

# TODO ne vzdycky se to musi instalovat
$VCPKG_ROOT/bootstrap-vcpkg.sh;
export PATH=$PATH:$VCPKG_ROOT;
vcpkg install fmt --triplet=$TRIPLET
vcpkg install gtkmm --triplet=$TRIPLET
vcpkg install libsigcpp --triplet=$TRIPLET
vcpkg install pkgconf --triplet=$TRIPLET

cmake ./CMakeLists.txt -DVCPKG_ROOT=$VCPKG_ROOT -DTRIPLET=$TRIPLET -DCMAKE_BUILD_TYPE=Debug -DCMAKE_TOOLCHAIN_FILE="$VCPKG_ROOT/scripts/buildsystems/vcpkg.cmake"
