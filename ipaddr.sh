#!/bin/bash

# 定义要修改的文件路径
CONFIG_GENERATE="package/base-files/files/bin/config_generate"

# 检查文件是否存在
if [ ! -f "$CONFIG_GENERATE" ]; then
    echo "错误: 未找到 $CONFIG_GENERATE 文件"
    exit 1
fi

# 备份原始文件
cp "$CONFIG_GENERATE" "${CONFIG_GENERATE}.bak"

# 使用sed进行精确修改
sed -i '/case "$1" in/,/esac/ {
    /lan) ipad=${ipaddr:-"192.168.1.1"} ;;/ {
        s/192.168.1.1/192.168.100.1/
    }
}' "$CONFIG_GENERATE"

echo "已成功将LAN默认IP从192.168.1.1修改为192.168.100.1"
