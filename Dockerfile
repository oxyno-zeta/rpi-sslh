
# SSLH
FROM resin/rpi-raspbian:wheezy
MAINTAINER Oxyno-zeta <oxynozeta.oz@gmail.com>

# Make APT non-interactive
ENV DEBIAN_FRONTEND noninteractive

# Install software
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y sslh

# Needed for script
# Enable need 'yes' or something else
ENV SSLH_USER root
ENV SSLH_LISTEN_ADDRESS 0.0.0.0
ENV SSLH_LISTEN_PORT 443

ENV SSLH_OPENVPN_ENABLE yes
ENV SSLH_OPENVPN_ADDRESS 192.168.1.2
ENV SSLH_OPENVPN_PORT 1194

ENV SSLH_SSL_ENABLE yes
ENV SSLH_SSL_ADDRESS 192.168.1.2
ENV SSLH_SSL_PORT 443

ENV SSLH_SSH_ENABLE yes
ENV SSLH_SSH_ADDRESS 192.168.1.2
ENV SSLH_SSH_PORT 22

# Expose
EXPOSE $SSLH_LISTEN_PORT

ADD run.sh /run.sh
RUN chmod +x run.sh

ENTRYPOINT "./run.sh"


