FROM ubuntu:focal AS ubuntu-builder-common

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -q --no-allow-insecure-repositories update
RUN apt-get install --assume-yes -q --no-install-recommends context
ENTRYPOINT ["mtxrun"]


