#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
sed -i 's/KERNEL_PATCHVER:=5\.4/KERNEL_PATCHVER:=5.10/' target/linux/ramips/Makefile
git clone https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic.git packages
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
sed -i '/^PKG_BUILD_PARALLEL:=1$/a PKG_USE_MIPS16:=0' feeds/packages/utils/v2dat/Makefile
rm -rf feeds/routing/batman-adv
mv files/batman-adv feeds/routing
