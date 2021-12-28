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
pkgrel=3
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
        "0001-Wayland-Set-O_NONBLOCK-on-repeat-timerfd.patch"
        "0002-Wayland-Continue-poll-if-timerfd-can-t-be-read.patch"
        "0003-Don-t-crash-on-calls-to-focus-or-icon.patch"
        "0004-wayland-fix-broken-opengl-screenshots-on-mutter.patch"
        "0005-Add-warning-about-being-an-unofficial-patch.patch")
sha512sums=('4c295c5f4c02f6ede125fce67c52a97450f552f3985b664745bd8a836c1d6d69c04727c956fd26ec61f1e5fd9c074a28dcf6b1d1800f118444eef066f048b201'
            'a7f48ed4ada21aff8c9184ed5a87b960ab0691ed82581af1510c4f529ad86c44b2d16dc1dc3cc2b8de8c60ae804c8e85404a48df394fbfbeb6a7629fce6a21e0'
            'f04d3280fbcefd06248a4e7746900df9fc798440b0b056a39c95005d0660a348335a02d1d76daed7a8c5b4d757ee285366a97a51fb5751f554a998a9b26ac250'
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
