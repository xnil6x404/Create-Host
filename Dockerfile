FROM ubuntu:22.04
LABEL maintainer="wingnut0310 <wingnut0310@gmail.com>"

ENV DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    GOTTY_VERSION=1.5.0

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    wget \
    ca-certificates \
    locales && \
    locale-gen en_US.UTF-8 && \
    wget https://github.com/sorenisanerd/gotty/releases/download/v${GOTTY_VERSION}/gotty_${GOTTY_VERSION}_linux_amd64.tar.gz -O /tmp/gotty.tar.gz && \
    tar -C /usr/local/bin -xzf /tmp/gotty.tar.gz gotty && \
    chmod +x /usr/local/bin/gotty && \
    apt-get purge -y wget && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/gotty.tar.gz

COPY run_gotty.sh /run_gotty.sh
RUN chmod +x /run_gotty.sh

EXPOSE 8080

CMD ["/run_gotty.sh"]
