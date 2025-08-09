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

sed -i 's/192.168.1.1/172.16.0.9/g' package/base-files/files/bin/config_generate
sed -i 's/192.168.*addr_offset.*1/172.16.$((addr_offset++)).9/g' package/base-files/files/bin/config_generate

# sed -i "/network.\$1.proto='static'/i\                                set network.\$1.gateway='10.10.10.10'" package/base-files/files/bin/config_generate

sed -i "/timezone='UTC'/a\                set system.@system[-1].zonename='Asia/Shanghai'" package/base-files/files/bin/config_generate
sed -i "s/timezone='UTC'/timezone='CST-8'/g" package/base-files/files/bin/config_generate

sed -i "/system.ntp.enable_server/a\                add_list system.ntp.server='ntp.aliyun.com'" package/base-files/files/bin/config_generate

sed -i 's/root:/root:$1$nZL.pSU8$iINNlIkw.K6U5U6NH8BC31/' package/base-files/files/etc/shadow
