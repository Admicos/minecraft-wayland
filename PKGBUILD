# Maintainer: Ecmel Berk Canlıer <me@ecmelberk.com>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: philefou <tuxication AT gmail DOT com>
# Contributor: lindquist <tomas@famolsen.dk>
# Contributor: Christoph Siegenthaler <csi@gmx.ch>
# Contributor: Mihai Militaru <mihai.militaru@ephemeros.org>
# Contributor: SpepS <dreamspepser at yahoo dot it>

pkgname=glfw-wayland-minecraft
pkgdesc="A free, open source, portable framework for graphical application development (wayland, patched for Minecraft)"
pkgver=3.3.4
pkgrel=2
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
        "0002-Don-t-crash-on-calls-to-focus-or-icon.patch"
        "0003-fix-broken-opengl-screenshots-on-mutter.patch"
        "0004-Do-not-crash-on-window-position-set.patch")
sha512sums=('2b45ab72da7a2c007c0f42ccd56205f9684cfb980e2b1df127850cd057bb2b02ce02c7c64acd54cd433778e7017148f214afedf09badff9d2edf5f9b8d9d2701'
            'e90c5995f405dc5d0581c597719fb1bf0d9335cec162506e34e37c676a4d6eee4a50f2c9d5d1bd1a27f3668ea4a0570db24a10aad7145cd8688e25523d497de8'
            '02fbbb28f6f6ffae3b5b32aac76218b917229e491981e4576054e96a78c7a3dfec3f3b2ffb939d47188b5d47681805c05d66b6fd75ad18b1d225655187ddfb9a'
            '3ca405894fb3549c0bba69fd9f3b5bc5ade1d010e5d82a76c8c2684fd8f008976ad81344b842993a6620e7935c177c524acd2bf1d43c9790dd404a845bdcef72'
            '77732e58d6a6b3406ded5aa208b77bcdcaee808ed9a624ea2f41331a1231a96589bb0608d88835f7081f1fdb8b538e63f9cdc8d8fdbb0ce4b1d588c667782af1')

prepare() {
  cd "$srcdir/glfw-$pkgver"
  mkdir build-wayland
}

build() {
  cd "$srcdir/glfw-$pkgver"
  for patch in ../../00*.patch; do
    echo "Applying patch $patch"
    patch -p1 < "$patch"
  done
  cd "build-wayland"

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
