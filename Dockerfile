FROM alpine:3.4
MAINTAINER Steve Streeting <steve@stevestreeting.com>

# Install packages needed to build
RUN apk add --update --no-cache \
  bash \
  ca-certificates \
  curl \
  rsync \
  openssh-client \
  wget

# Install hugo.
ARG HUGO_VERSION=0.37
ARG HUGO_SHA256=347effe255a4e184f77baf14637aa83fb2db1f9d66b4eb1940937f626894de15

# Rember sha256sum (and md5sum) expect 2 spaces in front of the filename on alpine...
RUN curl -Ls https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz \
       -o /tmp/hugo.tar.gz \
  && echo "${HUGO_SHA256}  /tmp/hugo.tar.gz" | sha256sum -c - \
  && tar xf /tmp/hugo.tar.gz -C /tmp \
  && mv /tmp/hugo_${HUGO_VERSION}_linux_amd64/hugo_${HUGO_VERSION}_linux_amd64 /usr/bin/hugo \
  && rm -rf /tmp/hugo* \
