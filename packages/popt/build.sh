TERMUX_PKG_HOMEPAGE=http://www.rpm5.org/
TERMUX_PKG_DESCRIPTION="popt cli argument parser."
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_VERSION=1.16
TERMUX_PKG_SRCURL=http://ftp.rpm.org/mirror/popt/popt-$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=e728ed296fe9f069a0e005003c3d6b2dde3d9cad453422a10d6558616d304cc8
TERMUX_PKG_BREAKS="popt-dev"
TERMUX_PKG_REPLACES="popt-dev"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_post_configure() {
  echo '#undef HAVE_GLOB_H' >> config.h
}

