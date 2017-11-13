################################################################################
#      This file is part of LibreELEC - https://LibreELEC.tv
#      Copyright (C) 2016 Team LibreELEC
#      Copyright (C) 2016 kszaq
#
#  LibreELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  LibreELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with LibreELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="qca9377-firmware-aml"
PKG_VERSION="1.0.0-3"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="Free-to-use"
PKG_SITE="https://boundarydevices.com/product/bd_sdmac_wifi/"
# PKG_URL="http://linode.boundarydevices.com/repos/apt/ubuntu-relx/pool/main/q/qca-firmware/qca-firmware_${PKG_VERSION}_armhf.deb"
PKG_URL="http://kszaq.libreelec.tv/sources/qca-firmware_${PKG_VERSION}_armhf.deb"
PKG_SOURCE_DIR="qca-firmware-$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="firmware"
PKG_AUTORECONF="no"

unpack() {
  mkdir -p "$BUILD/$PKG_NAME-$PKG_VERSION"
  dpkg -x "$SOURCES/$PKG_NAME/$PKG_SOURCE_NAME" "$BUILD/$PKG_NAME-$PKG_VERSION"
}

make_target() {
  : # nothing todo
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/kernel-overlays/base/lib/firmware

  cp -PR lib/firmware $INSTALL/usr/lib/kernel-overlays/base/lib
  cp -P usr/share/doc/qca-firmware/copyright $INSTALL/usr/lib/kernel-overlays/base/lib/firmware/LICENSE.qca
}
