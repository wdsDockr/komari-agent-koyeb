#!/bin/sh
mkdir -p /tmp/www
echo "OK" > /tmp/www/index.html

# 尝试启动轻量HTTP服务
if command -v busybox >/dev/null 2>&1; then
    busybox httpd -f -p 80 -h /tmp/www &
elif command -v python3 >/dev/null 2>&1; then
    cd /tmp/www && python3 -m http.server 80 &
fi

# 启动 agent
exec komari-agent
