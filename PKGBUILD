# Maintainer: Ecmel Berk Canlıer <me@ecmelberk.com>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: philefou <tuxication AT gmail DOT com>
# Contributor: lindquist <tomas@famolsen.dk>
# Contributor: Christoph Siegenthaler <csi@gmx.ch>
# Contributor: Mihai Militaru <mihai.militaru@ephemeros.org>
# Contributor: SpepS <dreamspepser at yahoo dot it>

pkgname=glfw-wayland-minecraft
pkgdesc="A free, open source, portable framework for graphical application development (wayland, patched for Minecraft)"
pkgver=3.3.8
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
        "0003-Don-t-crash-on-calls-to-focus-or-icon.patch"
        "0004-wayland-fix-broken-opengl-screenshots-on-mutter.patch"
        "0005-Add-warning-about-being-an-unofficial-patch.patch")
sha512sums=('70d6d99fb7e7616990516070c9a430915dc68d89ec4fe785570f0b35f5c9606a34121e0cd57c0a7debb50e87e2a8e8d97d81a6d52d65ef454f7fd191bd9f679f'
            '28a7a218a904175f6a51bf11bad359438276e83b2fa1a20b74377bbb418fa1b5867239c422f866d01c37315ebce9d916dbdda1140abed5ec0b23b04c43a57202'
            '99a65117e59473abdbc5e92062682117a6b5d20bb0bae2a92833ef2fa2f83e79e974721d70074f3f8c07f277476584102588002568e8c5e6ba01f63075672fe4'
            '997a3cd6470ee958e75422415e7582fb11ffa2e7b718cdf54005e203de480d589f3c49fd88b39b1c8d3c89cc1a9444cdc37b340a797c93fccd20dca0a08da747')

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
