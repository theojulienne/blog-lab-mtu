FROM debian:buster

RUN apt update && apt install -y tcpdump traceroute bird python3 curl iputils-tracepath ethtool
RUN mkdir -p /run/bird

ADD bin/set-iface-mtu /usr/bin/set-iface-mtu
ADD bin/sample-http-server /usr/bin/sample-http-server

CMD bird -f