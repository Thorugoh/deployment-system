FROM jenkins/inbound-agent:latest

USER root

RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Install Node.js (LTS) and npm
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - \
 && apt-get install -y nodejs \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
 
USER jenkins
