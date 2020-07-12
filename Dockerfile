FROM balenalib/armv7hf-ubuntu-node:latest

ENV NODE_VERSION 10.20.1
ENV NPM_VERSION 6.14.4
ENV NVM_DIR /usr/local/nvm
USER root
WORKDIR /home/vipulgupta2048/work/webdriverio-test

# ================================================
# Customize sources for apt-get
# ================================================
RUN  echo "deb http://ports.ubuntu.com/ubuntu-ports/ bionic main\n" > /etc/apt/sources.list \
    && echo "deb-src http://ports.ubuntu.com/ubuntu-ports/ bionic main\n" >> /etc/apt/sources.list \
    && echo "deb http://ports.ubuntu.com/ubuntu-ports/ bionic-updates main\n" >> /etc/apt/sources.list \
    && echo "deb-src http://ports.ubuntu.com/ubuntu-ports/ bionic-updates main\n" >> /etc/apt/sources.list \
    && echo "deb http://ports.ubuntu.com/ubuntu-ports/ bionic-security main\n" >> /etc/apt/sources.list \
    && echo "deb [arch=armhf] http://ports.ubuntu.com/ bionic main universe multiverse\n" >> /etc/apt/sources.list \
    && echo "deb-src http://ports.ubuntu.com/ubuntu-ports/ bionic-security main\n" >> /etc/apt/sources.list
  
# No interactive frontend during docker build
ENV DEBIAN_FRONTEND=noninteractive \
    DEBCONF_NONINTERACTIVE_SEEN=true

RUN apt-get update -qqy \
  && apt-get -qqy install chromium-browser git-core python3 gcc g++ build-essential --yes \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/* \
  && apt-get -qyy clean

# RUN mkdir /tests
# COPY . /tests

ADD . /tests
WORKDIR /tests

RUN npm install -g node-gyp node-pre-gyp webdriverio prebuild-install \
    && npm install \
    && rm -rf /tmp/* \
    && npm cache clear --force 

RUN npx wdio wdio.conf -y
