#!/bin/bash
# SPDX-License-Identifier: MIT
# Copyright (C) 2026 VIKINGYFY

if [ -n "${GITHUB_WORKSPACE:-}" ] && [ -d "$GITHUB_WORKSPACE/wrt/package" ]; then
	PKG_PATH="$GITHUB_WORKSPACE/wrt/package"
else
	PKG_PATH="$(pwd)"
fi

# 修改 Aurora 菜单式样
if [ -d "$PKG_PATH/luci-app-aurora-config" ]; then
	echo " "
	if find "$PKG_PATH/luci-app-aurora-config/root/usr/share/aurora/" -type f -name '*.template' -exec \
		sed -i "s/nav_type '.*'/nav_type 'dropdown'/g; s/struct_radius_base '.*'/struct_radius_base '0.125rem'/g" {} +; then
		echo "theme-aurora has been fixed!"
	else
		echo "theme-aurora fix failed; continuing!"
	fi
fi

#修复TailScale配置文件冲突
FEEDS_PACKAGES="$PKG_PATH/../feeds/packages"
TS_FILE="$(find "$FEEDS_PACKAGES" -maxdepth 3 -type f -wholename '*/tailscale/Makefile' -print -quit 2>/dev/null)"
if [ -f "$TS_FILE" ]; then
	echo " "

	if sed -i '/\/files/d' "$TS_FILE"; then
		echo "tailscale has been fixed!"
	else
		echo "tailscale fix failed; continuing!"
	fi
fi

#修复Rust编译失败
RUST_FILE="$(find "$FEEDS_PACKAGES" -maxdepth 3 -type f -wholename '*/rust/Makefile' -print -quit 2>/dev/null)"
if [ -f "$RUST_FILE" ]; then
	echo " "

	if sed -i 's/ci-llvm=true/ci-llvm=false/g' "$RUST_FILE"; then
		echo "rust has been fixed!"
	else
		echo "rust fix failed; continuing!"
	fi
fi
