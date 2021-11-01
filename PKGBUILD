# Maintainer: Ecmel Berk Canlıer <me@ecmelberk.com>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: philefou <tuxication AT gmail DOT com>
# Contributor: lindquist <tomas@famolsen.dk>
# Contributor: Christoph Siegenthaler <csi@gmx.ch>
# Contributor: Mihai Militaru <mihai.militaru@ephemeros.org>
# Contributor: SpepS <dreamspepser at yahoo dot it>

pkgname=glfw-wayland-minecraft
pkgdesc="A free, open source, portable framework for graphical application development (wayland, patched for Minecraft)"
pkgver=3.4.0
_pkggit=6876cf8d7e0e70dc3e4d7b0224d08312c9f78099
pkgrel=1
arch=('x86_64')
url="https://github.com/Admicos/minecraft-wayland"
license=('custom:ZLIB')
depends=('wayland' 'libxkbcommon' 'libgl' 'libdecor')
conflicts=('glfw' 'glfw-wayland')
provides=("glfw=$pkgver")
makedepends=('mesa' 'cmake' 'doxygen' 'vulkan-headers' 'vulkan-icd-loader'
             'extra-cmake-modules' 'wayland-protocols' 'libxi' 'libxrandr'
             'libxcursor' 'libxkbcommon' 'libxinerama')
source=("https://github.com/glfw/glfw/archive/${_pkggit}.tar.gz"
        "0001-libdecoration-support.patch"
        "0002-set-O_NONBLOCK-on-repeat-timerfd.patch"
        "0003-wayland-don-t-crash-app-on-api-calls-to-window-focus.patch"
        "0004-fix-broken-opengl-screenshots-on-mutter.patch"
        "0005-don-t-crash-on-get-scancode-name.patch")
sha256sums=('70dd8d43efc3b7e5d71e687cb94989f9124d8457b834b221ff9e41c5c8feea9f'
            '7d8ffc69576355e92de269f52c328b75cb7ed3175fc51a3b1ed9729684baeea3'
            '84e1a852a16fa6ca2666dd6833ab621612b7eb3b1b11f806406f8ded1ae51a8e'
            'a442f8c7e40fb09775f922b95402108b366114874ee96e370c29e5f8500a02b7'
            '27aea70b07df2d46ac7469c129d28d695eff1ec9492489aa7b2558dd780ebdf0'
            '16a2410511d75f00902ab1869942a80d85261f8390a97be946f82662891351e5')

prepare() {
  cd "$srcdir/glfw-$_pkggit"
  rm -rf build-wayland || true
  mkdir build-wayland

  for patch in "$srcdir/00"*.patch; do
    echo "Applying patch $patch"
    patch -p1 < "$patch"
  done
}

build() {
  cd "$srcdir/glfw-$_pkggit/build-wayland"

  cmake .. \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DBUILD_SHARED_LIBS=ON \
      -DGLFW_USE_WAYLAND=ON \
      -DGLFW_USE_LIBDECOR=ON
}

package() {
  cd "$srcdir/glfw-$_pkggit"/build-wayland

  make DESTDIR=$pkgdir install

  cd ..
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
