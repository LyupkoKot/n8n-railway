FROM n8nio/n8n:latest

USER root
# System packages (Chromium is optional—remove if you don't need it)
RUN apk add --no-cache python3 py3-pip chromium chromium-chromedriver \
  && python3 -m venv /opt/py \
  && /opt/py/bin/pip install --upgrade pip \
  && /opt/py/bin/pip install requests beautifulsoup4 pinterest-downloader \
  && chown -R node:node /opt/py

# Make venv the default python/pip for runtime (including Execute Command node)
ENV PATH="/opt/py/bin:${PATH}"

USER node
