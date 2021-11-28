# Result 904 MB
FROM node:12.22.7-buster-slim

WORKDIR /app

# Install WebKit dependencies
RUN npm install -g pm2 \
        && \
    apt-get update \
        && \
    apt-get install -y \
    libwoff1 \
    libopus0 \
    libwebp6 \
    libwebpdemux2 \
    libenchant1c2a \
    libgudev-1.0-0 \
    libsecret-1-0 \
    libhyphen0 \
    libgdk-pixbuf2.0-0 \
    libegl1 \
    libnotify4 \
    libxslt1.1 \
    libevent-2.1-6 \
    libgles2 \
    libgl1 \
    libvpx5 \
    libgstreamer1.0-0 \
    libgstreamer-gl1.0-0 \
    libgstreamer-plugins-base1.0-0 \
    libgstreamer-plugins-bad1.0-0 \
    libharfbuzz-icu0 \
    libopenjp2-7 \
# Install Chromium dependencies
    libnss3 \
    libxss1 \
    libasound2 \
# Install Firefox dependencies
    libdbus-glib-1-2 \
    libxt6 \
        && \
    apt-get clean

# Copying required files
COPY package.json package.json
COPY package-lock.json package-lock.json
RUN npm i
COPY . .

EXPOSE 8080
CMD [ "pm2-runtime", "listen.js" ]
