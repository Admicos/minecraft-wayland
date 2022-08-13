#!/bin/bash

pkggit=62e175ef9fae75335575964c845a302447c012c7
appid="$1"
appdir="$HOME/.var/app/$appid"

if [ -z "$appid" ]; then
    echo "Please provide a Flatpak application ID"
    exit -1
fi

flatpak info $appid > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "Invalid Flatpak application ID"
    exit -1
fi

echo "Preparing workspace..."
rm -rf ./tmp
mkdir tmp && cd tmp
cwd=$(pwd)

echo "Downloading ECM source..."
git clone https://github.com/KDE/extra-cmake-modules.git

echo "Installing ECM..."
cd extra-cmake-modules
mkdir build && cd build
cmake .. -DCMAKE_INSTALL_PREFIX="$cwd/ecm"
mkdir -p "$cwd/ecm"
make && make install

echo "Downloading GLFW source..."
cd "$cwd"
wget -O glfw.tar.gz https://github.com/glfw/glfw/archive/$pkggit.tar.gz

echo "Uncompressing GLFW source..."
tar xf glfw.tar.gz
mv "glfw-$pkggit" "glfw"

echo "Patching GLFW source..."
cd glfw
for patch in "$cwd/../00"*.patch; do patch -p1 < "$patch"; done

echo "Building GLFW..."
mkdir -p "$appdir/usr"
mkdir build && cd build
flatpak run --command=sh --devel $appid -c "ECM_DIR=\"$cwd/ecm/share/ECM\" cmake .. -DCMAKE_INSTALL_PREFIX=\"$appdir/usr\" -DCMAKE_INSTALL_LIBDIR=lib -DBUILD_SHARED_LIBS=ON -DGLFW_USE_WAYLAND=ON && make install"

echo "Done!"
