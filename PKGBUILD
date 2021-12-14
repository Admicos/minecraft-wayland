# Maintainer: Ecmel Berk Canlıer <me@ecmelberk.com>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: philefou <tuxication AT gmail DOT com>
# Contributor: lindquist <tomas@famolsen.dk>
# Contributor: Christoph Siegenthaler <csi@gmx.ch>
# Contributor: Mihai Militaru <mihai.militaru@ephemeros.org>
# Contributor: SpepS <dreamspepser at yahoo dot it>

pkgname=glfw-wayland-minecraft
pkgdesc="A free, open source, portable framework for graphical application development (wayland, patched for Minecraft)"
pkgver=3.3.6
pkgrel=1
arch=('x86_64')
url="https://github.com/Admicos/minecraft-wayland"
license=('custom:ZLIB')
depends=('wayland' 'libxkbcommon' 'libgl')
conflicts=('glfw' 'glfw-wayland')
provides=("glfw=$pkgver")
makedepends=('mesa' 'cmake' 'doxygen' 'vulkan-headers' 'vulkan-icd-loader'
             'extra-cmake-modules' 'wayland-protocols' 'libxi' 'libxrandr'
             'libxcursor' 'libxkbcommon' 'libxinerama')
source=("https://github.com/glfw/glfw/archive/${pkgver}.tar.gz"
        "0001-set-O_NONBLOCK-on-repeat-timerfd.patch"
        "0002-Continue-poll-if-timerfd-cant-be-read.patch"
        "0003-Don-t-crash-on-calls-to-focus-or-icon.patch"
        "0004-fix-broken-opengl-screenshots-on-mutter.patch")
sha512sums=('4c295c5f4c02f6ede125fce67c52a97450f552f3985b664745bd8a836c1d6d69c04727c956fd26ec61f1e5fd9c074a28dcf6b1d1800f118444eef066f048b201'
            '0f43d8a4c6c7e8946d302383e188b618694f122689d0142efcfa227f8fff5d9e655bf422c892533d2dc661751cb507dc14d784e8273b9ebfb847a55becc6c8ea'
            '0887d28a76e76c7fb6853b51ccb983ae5e69a22a6d0e31522592ad4fcbb36f608ad3bcf07d41cfe6da5bac64495f4a714c261e00ccfa2260900a18f1e034ffc9'
            '02fbbb28f6f6ffae3b5b32aac76218b917229e491981e4576054e96a78c7a3dfec3f3b2ffb939d47188b5d47681805c05d66b6fd75ad18b1d225655187ddfb9a'
            '3ca405894fb3549c0bba69fd9f3b5bc5ade1d010e5d82a76c8c2684fd8f008976ad81344b842993a6620e7935c177c524acd2bf1d43c9790dd404a845bdcef72')

prepare() {
  cd "$srcdir/glfw-$pkgver"
  rm -rf build-wayland || true
  mkdir build-wayland

  for patch in "$srcdir/00"*.patch; do
    echo "Applying patch $patch"
    patch -p1 < "$patch"
  done
}

build() {
  cd "$srcdir/glfw-$pkgver/build-wayland"

  cmake .. \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DBUILD_SHARED_LIBS=ON \
      -DGLFW_USE_WAYLAND=ON
}

package() {
  cd "$srcdir/glfw-$pkgver"/build-wayland

  make DESTDIR=$pkgdir install

  cd ..
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
