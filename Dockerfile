#FROM node:lts-alpine
FROM ubuntu:focal

ARG HUGO_VERSION=0.101.0

#RUN apt-get-get update && apt-get-get install -y 

RUN apt-get update && \
    apt-get install -y git

 RUN apt-get -y install ca-certificates openssl wget \                                                                                                                                                                                                      
  && update-ca-certificates

RUN wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
    tar -xf hugo_${HUGO_VERSION}_Linux-64bit.tar.gz -C /usr/local/bin && \
    hugo version && rm hugo_${HUGO_VERSION}_Linux-64bit.tar.gz
    
RUN wget -q -O - https://raw.githubusercontent.com/canha/golang-tools-install-script/master/goinstall.sh | bash

RUN wget https://dist.ipfs.io/kubo/v0.14.0/kubo_v0.14.0_linux-amd64.tar.gz && \
    tar -xvzf kubo_v0.14.0_linux-amd64.tar.gz && \
    cd kubo && \
    bash install.sh && \
    cd ..



#RUN git submodule init

#RUN git submodule update