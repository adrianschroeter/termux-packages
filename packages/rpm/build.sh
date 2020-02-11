TERMUX_PKG_HOMEPAGE=https://rpm.org/
TERMUX_PKG_DESCRIPTION="rpm package manager"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_VERSION=4.15.1
TERMUX_PKG_REVISION=0
TERMUX_PKG_SRCURL=http://ftp.rpm.org/releases/rpm-4.15.x/rpm-${TERMUX_PKG_VERSION}.tar.bz2
TERMUX_PKG_SHA256=ddef45f9601cd12042edfc9b6e37efcca32814e1e0f4bb8682d08144a3e2d230
TERMUX_PKG_DEPENDS="bzip2, coreutils, diffutils, gzip, less, libbz2, liblzma, tar, xz-utils, zlib, libgcrypt, file, popt, libarchive"
TERMUX_PKG_BREAKS="rpm-devel"
TERMUX_PKG_REPLACES="rpm-devel"
TERMUX_PKG_ESSENTIAL=true

TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
--host=${TERMUX_ARCH}-linux
--without-selinux
--without-lua
--with-crypto=libgcrypt
--enable-ndb
--disable-bdb
--disable-dependency-tracking
"

TERMUX_PKG_RM_AFTER_INSTALL="
"

termux_step_pre_configure() {
        CFLAGS+=" -ffunction-sections -Wno-implicit-function-declaration"
}

termux_step_post_massage() {
        sed -i -e '/_db_backend/s/bdb/ndb/' $TERMUX_PKG_MASSAGEDIR/$TERMUX_PREFIX/lib/rpm/macros
}

