FROM balenalib/armv7hf-ubuntu:latest

ENV NODE_VERSION 10.20.1
ENV NPM_VERSION 6.14.4
ENV NVM_DIR /usr/local/nvm

WORKDIR /home/vipulgupta2048/work/webdriverio-test

#================================================
# Customize sources for apt-get
#================================================
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

RUN apt-get -qqy update && apt-get -qqy --no-install-recommends install -y netcat curl jq git-core gcc g++ make  \
    && curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash \
    && source $NVM_DIR/nvm.sh   \
    && nvm install $NODE_VERSION  \
    && nvm alias default $NODE_VERSION  \
    && nvm use default \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/* \
    && apt-get -qyy clean


RUN node --version && npm --version 


# ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
# ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

## ADD PACKAGE.JSON HERE 
## ADd tests code here and expose ports

# RUN npm install -g node-gyp node-pre-gyp prebuild-install \
    # && rm -rf /tmp/* \
    # && npm ci --production \
    # && npm cache clear --force \
