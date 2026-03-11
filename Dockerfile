FROM ghcr.io/komari-monitor/komari-agent:latest

RUN apt-get update && apt-get install -y netcat-openbsd 2>/dev/null || \
    apk add --no-cache netcat-openbsd 2>/dev/null || true

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 80

ENTRYPOINT []
CMD ["/start.sh"]