FROM ghcr.io/komari-monitor/komari-agent:latest

RUN apt-get update && apt-get install -y busybox-static 2>/dev/null || \
    apk add --no-cache busybox 2>/dev/null || true

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 80
CMD ["/start.sh"]
