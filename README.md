# AI 自动构建的 MX4200 系列 ImmortalWrt 固件

本项目通过 GitHub Actions 自动构建面向 Linksys MX4200 系列的 ImmortalWrt 固件。

## 支持设备

- Linksys MX4200v1
- Linksys MX4200v2

## 自动构建

- 每天 香港时间 19:00 自动构建。
- 固件基于 [VIKINGYFY/immortalwrt](https://github.com/VIKINGYFY/immortalwrt) 的 `main` 分支。
- 基于上游 qualcommax/IPQ807x 的开源 NSS 加速栈构建。
- 每个 Release 仅包含 MX4200v1 / MX4200v2 各自的 `factory.bin` 与 `sysupgrade.bin`；名称中的时间为构建开始时间，便于核对上游源码提交。
- 也可在 GitHub Actions 的 **MX4200** 工作流中手动触发构建。

## 目录说明

- `.github/workflows/`：GitHub Actions 构建流程
- `Config/MX4200.txt`：仅选择 MX4200v1 与 MX4200v2 的目标配置
- `Scripts/`：沿用上游项目的自定义构建脚本

## 说明

本项目仅调整构建编排与设备选择；其余构建逻辑、脚本和软件包配置继续沿用上游项目。
