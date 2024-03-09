# Dockerfile for Grafana
FROM debian:oldstable-slim

# Grafana'nın indirileceği URL
ARG GRAFANA_VERSION=8.2.5
ARG GRAFANA_URL="https://dl.grafana.com/oss/release/grafana_${GRAFANA_VERSION}_amd64.deb"

# Gerekli paketleri yükle
RUN apt-get update && \
    apt-get install -y wget && \
    apt-get install -y libfontconfig1

# Grafana'yı indir ve kur
RUN wget ${GRAFANA_URL} && \
    dpkg -i grafana_${GRAFANA_VERSION}_amd64.deb && \
    rm grafana_${GRAFANA_VERSION}_amd64.deb

# Expose Grafana port
EXPOSE 3000

ENTRYPOINT [ "grafana-server" ]

# Default command to run when starting the container
CMD ["--homepath=/usr/share/grafana", "--config=/etc/grafana/grafana.ini", "--packaging=docker", "cfg:default.log.mode=console", "cfg:default.paths.data=/var/lib/grafana", "cfg:default.paths.logs=/var/log/grafana"]

