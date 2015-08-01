#!/bin/bash

# Author : Oxyno-zeta <oxynozeta.oz@gmail.com>

ARGS=""

if [ -n "$SSLH_USER" ] ; then
  ARGS=$ARGS" --user "$SSLH_USER
else
  ARGS=$ARGS" --user root"
fi

if [ -n "$SSLH_LISTEN_ADDRESS" ] ; then
  if [ -n "$SSLH_LISTEN_PORT" ] ; then
    ARGS=$ARGS" --listen "$SSLH_LISTEN_ADDRESS":"$SSLH_LISTEN_PORT
  else
    ARGS=$ARGS" --listen "$SSLH_LISTEN_ADDRESS":443"
  fi
else
  if [ -n "$SSLH_LISTEN_PORT" ] ; then
    ARGS=$ARGS" --listen 0.0.0.0:"$SSLH_LISTEN_PORT
  else
    ARGS=$ARGS" --listen 0.0.0.0:443"
  fi
fi

if [ "$SSLH_OPENVPN_ENABLE" == "yes" ] ; then
  if [ -n "$SSLH_OPENVPN_PORT" ] ; then
    ARGS=$ARGS" --openvpn "$SSLH_OPENVPN_ADDRESS":"$SSLH_OPENVPN_PORT
  else
    ARGS=$ARGS" --openvpn "$SSLH_OPENVPN_ADDRESS":1194"
  fi
fi

if [ "$SSLH_SSL_ENABLE" == "yes" ] ; then
  if [ -n "$SSLH_SSL_PORT" ] ; then
    ARGS=$ARGS" --ssl "$SSLH_SSL_ADDRESS":"$SSLH_SSL_PORT
  else      
    ARGS=$ARGS" --ssl "$SSLH_SSL_ADDRESS":443"
  fi
fi

if [ "$SSLH_SSH_ENABLE" == "yes" ] ; then
  if [ -n "$SSLH_SSH_PORT" ] ; then
    ARGS=$ARGS" --ssh "$SSLH_SSH_ADDRESS":"$SSLH_SSH_PORT
  else      
    ARGS=$ARGS" --ssh "$SSLH_SSH_ADDRESS":22"
  fi
fi

ARGS=$ARGS" -f"

/usr/sbin/sslh $ARGS


