#!/bin/bash
# Description: OpenWrt DIY script part 2 (After Update feeds)

# 1. 默认禁用 Wi-Fi (作为纯有线高性能主路由/旁路由使用)
# 将所有无线接口默认设置为 disabled = 1
sed -i 's/set wireless.radio${devidx}.disabled=0/set wireless.radio${devidx}.disabled=1/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 2. 设置默认主机名为 Newifi3-Router
sed -i 's/OpenWrt/Newifi3-Router/g' package/base-files/files/bin/config_generate

# 3. 默认开启 BBR 拥塞控制
sed -i '$a net.core.default_qdisc=fq' package/base-files/files/etc/sysctl.conf
sed -i '$a net.ipv4.tcp_congestion_control=bbr' package/base-files/files/etc/sysctl.conf
