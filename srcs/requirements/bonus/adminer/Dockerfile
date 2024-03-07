# Dockerfile for adminer
FROM debian:oldstable-slim

# Adminer'in en son sürümünün indirileceği URL
ARG ADMINER_VERSION=4.8.1
ARG ADMINER_URL="https://www.adminer.org/static/download/${ADMINER_VERSION}/adminer-${ADMINER_VERSION}.php"

# Gerekli paketleri yükle
RUN apt-get update && \
    apt-get install -y wget && \
    rm -rf /var/lib/apt/lists/*

# Adminer'i indir
RUN wget -O /var/www/adminer.php "${ADMINER_URL}"

# Expose the port
EXPOSE 8080

# Default command to run when starting the container
CMD ["php", "-S", "0.0.0.0:8080", "-t", "/var/www/"]
