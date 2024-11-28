set -euxo pipefail

VCPKG_ROOT="/home/vojtechnovotny/Desktop/vcpkg" # TODO nice printing if not found
TRIPLET="x64-linux" #of course change this to linux/windows (or delete)

CMAKE_TOOLCHAIN_FILE="$VCPKG_ROOT/scripts/buildsystems/vcpkg.cmake";

# TODO ne vzdycky se to musi instalovat
$VCPKG_ROOT/bootstrap-vcpkg.sh;
export PATH=$PATH:$VCPKG_ROOT;
$VCPKG_ROOT/vcpkg install fmt --triplet=$TRIPLET
$VCPKG_ROOT/vcpkg install gtkmm --triplet=$TRIPLET
$VCPKG_ROOT/vcpkg install libsigcpp --triplet=$TRIPLET
$VCPKG_ROOT/vcpkg install pkgconf --triplet=$TRIPLET

cmake ./CMakeLists.txt -DVCPKG_ROOT=$VCPKG_ROOT -DTRIPLET=$TRIPLET -DCMAKE_BUILD_TYPE=Debug -DCMAKE_TOOLCHAIN_FILE="$VCPKG_ROOT/scripts/buildsystems/vcpkg.cmake"
