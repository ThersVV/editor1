
VCPKG_ROOT="/home/vojtechnovotny/Desktop/skolaTest/vcpkg"

CMAKE_TOOLCHAIN_FILE="$VCPKG_ROOT/scripts/buildsystems/vcpkg.cmake";

# TODO ne vzdycky se to musi instalovat
$VCPKG_ROOT/bootstrap-vcpkg.sh;
export PATH=$PATH:$VCPKG_ROOT;
vcpkg install fmt
vcpkg install qtcore

cmake ./CMakeLists.txt -DVCPKG_ROOT=$VCPKG_ROOT -DCMAKE_TOOLCHAIN_FILE="$VCPKG_ROOT/scripts/buildsystems/vcpkg.cmake";
