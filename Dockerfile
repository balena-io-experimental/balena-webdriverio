FROM balenalib/armv7hf-ubuntu-node:12-bionic-run

USER root
RUN install_packages chromium-browser git-core python3 gcc g++ make 
 
ADD . /tests
WORKDIR /tests

RUN npm install \
    && rm -rf /tmp/* \
    && npm cache clear --force 

CMD balena-idle
