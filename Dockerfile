FROM balenalib/armv7hf-ubuntu-node:latest

USER root

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
  && apt-get -qqy install chromium-browser git-core python3 gcc g++ make --yes \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/* \
  && apt-get -qyy clean

ADD . /tests
WORKDIR /tests

RUN npm install -g node-gyp node-pre-gyp prebuild-install \
    && npm install \
    && rm -rf /tmp/* \
    && npm cache clear --force 

CMD ['npm','run','e2e']
