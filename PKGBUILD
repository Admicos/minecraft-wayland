# Maintainer: Ecmel Berk Canlıer <me@ecmelberk.com>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: philefou <tuxication AT gmail DOT com>
# Contributor: lindquist <tomas@famolsen.dk>
# Contributor: Christoph Siegenthaler <csi@gmx.ch>
# Contributor: Mihai Militaru <mihai.militaru@ephemeros.org>
# Contributor: SpepS <dreamspepser at yahoo dot it>

pkgname=glfw-wayland-minecraft
pkgdesc="A free, open source, portable framework for graphical application development (wayland, patched for Minecraft)"
pkgver=3.4.0+1.19
_pkggit=3eaf1255b29fdf5c2895856c7be7d7185ef2b241
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
source=("https://github.com/glfw/glfw/archive/${_pkggit}.tar.gz"
        "0003-Don-t-crash-on-calls-to-focus-or-icon.patch"
        "0005-Add-warning-about-being-an-unofficial-patch.patch"
        "0007-Platform-Prefer-Wayland-over-X11.patch"
        "0008-Wayland-Add-support-for-wp_fractional_scale_v1.patch"
        "0009-Defer-setting-cursor-position-until-the-cursor-is-lo.patch")
sha512sums=('c205eb24b40f818976c7338caf1f05b06947c9348a83533bdee6f60dd5db8c7342a110242627aaab35bc4ffd8e29f9ec258bccac814b9a93995aa24133bed64d'
            '9c6f6e81de1feafeed93988207999d21754c93ff97c8c3158aee43f38b291f4589feaf83e42081445cf89c9209c86e56a0102fccf0d0a97740874dd88e84a746'
            'd8e8b704e19652bb30c7799300a1bd0db1619ad17e8e36a3ee51673933eba6a8c47dbd615f4a9a385021bdfaa1ddedb2f24e8c05b670ef5278c71d217e91146e'
            'c524857950180090fd774c5650a8467357e91eea0d6bef49bd28f2ef52981767f28f3dbb1649f98e25188e56bfa41855aca9bf99e335111c9557ff8e069588e7'
            'fe5582503ca0e8ba916a9413fbc387e49561d9fefb27849a15af5d6ed3f1e1fa45d1d55da306b1d2087696377600a81ba3cb44e10a7d240f55f85c311012905d'
            '243a74669626ea6c641a798c5287f59f43860fdaac4d2e366ad46695fce471fdf3e4f68078ec2ebfc41878efc13ac6d7f799981f3d3d01edc2c11b34a696bd73')

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
      -DGLFW_BUILD_EXAMPLES=OFF \
      -DGLFW_BUILD_TESTS=OFF
}

package() {
  cd "$srcdir/glfw-$_pkggit"/build-wayland

  make DESTDIR=$pkgdir install

  cd ..
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
