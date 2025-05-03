FROM ubuntu:20.04
LABEL maintainer="wingnut0310 <wingnut0310@gmail.com>"

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV GOTTY_VERSION 1.5.0

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    wget \
    ca-certificates && \
    wget https://github.com/sorenisanerd/gotty/releases/download/v${GOTTY_VERSION}/gotty_${GOTTY_VERSION}_linux_amd64.tar.gz -O /tmp/gotty.tar.gz && \
    tar -C /usr/local/bin -xzf /tmp/gotty.tar.gz gotty && \
    apt-get purge -y wget && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/gotty.tar.gz

EXPOSE 8080

CMD ["gotty", "-w", "/bin/bash"]
