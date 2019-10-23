FROM node:6.15.1-stretch
MAINTAINER Petr Sloup <petr.sloup@klokantech.com>

ENV NODE_ENV="production"
WORKDIR /data

ENTRYPOINT ["/bin/bash", "/usr/src/app/run.sh"]

RUN apt-get -qq update \
&& DEBIAN_FRONTEND=noninteractive apt-get -y install \
    apt-transport-https curl unzip \
    build-essential python libcairo2-dev \
    libgles2-mesa-dev libgbm-dev libllvm3.9 \
    libprotobuf-dev libxxf86vm-dev xvfb \
    x11-utils software-properties-common protobuf-compiler \
    pkg-config libcairo2-dev libgif-dev \
    libgl1-mesa-glx build-essential g++ \
&& apt-get clean


RUN curl -sL https://deb.nodesource.com/setup_4.x | bash -
RUN apt-get install -y nodejs xvfb
RUN mkdir /var/cache/npm
RUN npm config set cache /var/cache/npm --global
RUN mkdir -p /usr/src/app

COPY tileserver-gl/ /usr/src/app
RUN ls /usr/src/app
RUN cd /usr/src/app && npm install --production