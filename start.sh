#!/bin/sh
mkdir -p /tmp/www
echo "OK" > /tmp/www/index.html

# HTTP 保活服务
while true; do
  echo -e "HTTP/1.1 200 OK\r\nContent-Length: 2\r\n\r\nOK" | nc -l -p 80 -q 1 2>/dev/null || \
  echo -e "HTTP/1.1 200 OK\r\nContent-Length: 2\r\n\r\nOK" | nc -l 80 2>/dev/null
done &

# 定时保活，每10分钟访问所有节点
while true; do
  curl -s https://scornful-billye-aoko-64c2e29c.koyeb.app/ > /dev/null
  curl -s https://komari-agent-latest-kts2.onrender.com/ > /dev/null
  sleep 600
done &

# 启动 agent
exec /app/komari-agent