FROM ubuntu:latest

ADD ./Caddyfile /root/Caddyfile
ADD ./start.sh /root/start.sh

RUN apt update && \
    apt install ca-certificates git wget golang-go -y && \
    rm -rf /var/cache/apt/* && \
    go install github.com/caddyserver/xcaddy/cmd/xcaddy@latest && \
    ~/go/bin/xcaddy build --with github.com/caddyserver/forwardproxy@caddy2=github.com/klzgrad/forwardproxy@naive

CMD /root/start.sh
