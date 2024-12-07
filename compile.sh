set -euxo pipefail

VCPKG_ROOT="../vcpkg" # TODO nice printing if not found
TRIPLET="x64-windows" #of course change this to linux/windows (or delete)

export X_VCPKG_FORCE_VCPKG_X_LIBRARIES=1

if [[ "$OSTYPE" == "msys"* || "$OSTYPE" == "win32" ]]; then
    # Windows installation
    if ! command -v choco &> /dev/null; then
        echo "Installing Chocolatey..."
        powershell -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; \
            [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12; \
            iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"
    fi

    choco install cmake nasm python curl zip unzip --no-progress -y
    
elif [[ -f /etc/os-release ]]; then
    # Linux installation
    . /etc/os-release
    if [[ "$ID" == "ubuntu" ]]; then
        apt update && apt -y install \
            sudo build-essential cmake gdb nasm pkg-config git curl zip unzip tar python3 \
            bison libxext-dev autoconf libtool libxrandr-dev libxi-dev libxcursor-dev \
            libxdamage-dev libxinerama-dev libdrm-dev
    elif [[ "$ID" == "fedora" ]]; then
        sudo dnf update -y && dnf -y install \
            cmake gdb nasm pkgconf-pkg-config git curl zip unzip tar python3 gcc-c++ \
            bison autoconf libtool libXcursor-devel libdrm-devel libXext-devel libXrandr-devel \
            libXi-devel libXdamage-devel libXinerama-devel
        # This looks an extra package but for some reason it needs to be done in fedora only:
        sudo dnf install glibc-gconv-extra -y
    else
        echo "Unsupported Linux distribution: $ID"
        exit 1
    fi
fi

# TODO ne vzdycky se to musi instalovat
$VCPKG_ROOT/bootstrap-vcpkg.sh;
export PATH=$PATH:$VCPKG_ROOT;
$VCPKG_ROOT/vcpkg install fmt:$TRIPLET
$VCPKG_ROOT/vcpkg install gtkmm:$TRIPLET
$VCPKG_ROOT/vcpkg install libsigcpp:$TRIPLET
$VCPKG_ROOT/vcpkg install pkgconf:$TRIPLET
CMAKE_TOOLCHAIN_FILE="$VCPKG_ROOT/scripts/buildsystems/vcpkg.cmake";

cmake ./CMakeLists.txt -DVCPKG_ROOT=$VCPKG_ROOT -DTRIPLET=$TRIPLET -DCMAKE_BUILD_TYPE=Debug -DCMAKE_TOOLCHAIN_FILE=$CMAKE_TOOLCHAIN_FILE
