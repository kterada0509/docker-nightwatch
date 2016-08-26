FROM node:4.5

MAINTAINER Kentaro Terada kterada.0509sg@gmail.com



RUN set -x \
    # System update
    && apt-get update \


    # Install npm (and its extra packages)
    && apt-get install -y \
                openjdk-7-jdk \
                openjdk-7-jre \

    # Cleanup apt cache
    && apt-get clean && rm -r /var/lib/apt/lists/* \

    # Create app directory
    && mkdir -p /usr/src/app

WORKDIR /usr/src/app
ADD package.json .

RUN set -x \

    # Install npm packages
    && npm install \

    # Install gulp and grunt
    && npm install -g \
                gulp

CMD [ "npm" ]
