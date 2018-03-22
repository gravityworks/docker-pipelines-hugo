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

# Rember sha256sum (and md5sum) expect 2 spaces in front of the filename on alpine...
RUN curl -Ls https://github.com/spf13/hugo/releases/download/v0.37.1/hugo_0.37.1_Linux-64bit.tar.gz \
       -o /tmp/hugo.tar.gz \
  && echo "7b848083f93822dd21b0a2f14a110bd99f6efb4b838d499df6d04a49d0debf8b  /tmp/hugo.tar.gz" | sha256sum -c - \
  && tar xf /tmp/hugo.tar.gz -C /tmp \
  && mv /tmp/hugo_0.37.1_linux_amd64/hugo_0.37.1_linux_amd64 /usr/bin/hugo \
  && rm -rf /tmp/hugo* \
