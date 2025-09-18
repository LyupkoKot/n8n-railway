FROM n8nio/n8n:latest

# If you want Pinterest/Python support keep this block, otherwise delete it
USER root
RUN apk add --no-cache python3 py3-pip chromium chromium-chromedriver \
  && pip3 install --no-cache-dir requests beautifulsoup4 pinterest-downloader
USER node