# Newifi D2 (Newifi 3) ImmortalWrt 固件自动编译

基于 GitHub Actions 在线编译适用于 **新路由 3 (Newifi D2 / MT7621)** 的精简高效 ImmortalWrt 固件。

### 固件特性
* **源码分支**: ImmortalWrt 23.05 (官方稳定分支)
* **核心代理**: 预装 `HomeProxy`（专为 `sing-box` 优化的现代化代理面板）
* **日常实用**:
  - 网络唤醒 (WOL)
  - KMS 服务器 (vlmcsd)
  - ZeroTier 异地内网穿透
  - AdGuard Home 管理界面 (支持二进制与规则放在 `/tmp` 内存运行，零闪存磨损)
* **系统优化**:
  - 启用 MTK 芯片硬件流量卸载 (HW Flow Offload)，千兆测速满速运行低 CPU
  - 包含完整 USB 3.0 / Ext4 / Diskman 存储支持，方便挂载 U 盘

### 编译与下载
在 GitHub 仓库顶部的 **Actions** 页面中，选择 **`Build ImmortalWrt for Newifi D2`**，点击 **Run workflow** 即可开始云端自动编译。编译完成后会自动发布到 Releases 供下载。
