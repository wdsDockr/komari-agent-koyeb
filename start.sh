#!/bin/sh
mkdir -p /tmp/www
echo "OK" > /tmp/www/index.html

while true; do
  echo -e "HTTP/1.1 200 OK\r\nContent-Length: 2\r\n\r\nOK" | nc -l -p 80 -q 1 2>/dev/null || \
  echo -e "HTTP/1.1 200 OK\r\nContent-Length: 2\r\n\r\nOK" | nc -l 80 2>/dev/null
done &

exec /app/komari-agent