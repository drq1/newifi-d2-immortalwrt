#!/bin/bash
# Description: OpenWrt DIY script part 2 (After Update feeds)

# 1. 默认禁用 Wi-Fi (作为纯有线高性能主路由/旁路由使用)
sed -i 's/set wireless.radio${devidx}.disabled=0/set wireless.radio${devidx}.disabled=1/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 2. 设置默认主机名与时区
sed -i 's/OpenWrt/Newifi3-Router/g' package/base-files/files/bin/config_generate

# 3. 内核网络参数深度调优 (针对 512MB 内存有线高并发与代理优化)
cat >> package/base-files/files/etc/sysctl.conf << 'EOF'

# 开启 Google BBR 拥塞控制
net.core.default_qdisc = fq
net.ipv4.tcp_congestion_control = bbr

# 扩大最大连接跟踪数 (默认 16384 -> 131072，防止 BT/大并发断网)
net.netfilter.nf_conntrack_max = 131072
net.nf_conntrack_max = 131072

# 增大 TCP 监听队列与 SYN 队列
net.core.somaxconn = 2048
net.ipv4.tcp_max_syn_backlog = 4096

# 开启 TCP Fast Open 减少握手延迟
net.ipv4.tcp_fastopen = 3

# 优化内存缓存回收机制 (针对 512MB RAM 调优)
vm.swappiness = 10
vm.vfs_cache_pressure = 50
EOF
