# shadowsocks-go

A fresh implementation of Shadowsocks in Go,that has custom authorization🤔



## Features

- [x] SOCKS5 proxy with UDP Associate
- [x] Support for Netfilter TCP redirect on Linux (IPv6 should work but not tested)
- [x] Support for Packet Filter TCP redirect on MacOS/Darwin (IPv4 only)
- [x] UDP tunneling (e.g. relay DNS packets)
- [x] TCP tunneling (e.g. benchmark with iperf3)
- [x] SIP003 plugins
- [x] Replay attack mitigation


## Install



```sh
go get -u -v github.com/bugfan/shadowsocks-go
```


## Basic Usage

### Server

Start a server listening on port 8488 using `AEAD_CHACHA20_POLY1305` AEAD cipher with password `your-password`.

```sh
shadowsocks-go -s 'ss://AEAD_CHACHA20_POLY1305:your-password@:8488' -verbose
```


### Client

Start a client connecting to the above server. The client listens on port 1080 for incoming SOCKS5 
connections, and tunnels both UDP and TCP on port 8053 and port 8054 to 8.8.8.8:53 and 8.8.4.4:53 
respectively. 

```sh
shadowsocks-go -c 'ss://AEAD_CHACHA20_POLY1305:your-password@[server_address]:8488' \
    -verbose -socks :1080 -u -udptun :8053=8.8.8.8:53,:8054=8.8.4.4:53 \
                             -tcptun :8053=8.8.8.8:53,:8054=8.8.4.4:53
```

Replace `[server_address]` with the server's public address.

## forked from 
```
https://github.com/shadowsocks/go-shadowsocks2
```

## run
 SHADOWSOCKS_SF_CAPACITY=1e6 SHADOWSOCKS_SF_FPR=1e-6 SHADOWSOCKS_SF_SLOT=10 ./shadowsocks-go -s 'ss://AEAD_CHACHA20_POLY1305:abcdef@0.0.0.0:8080'

 ## todo
 - add auth logic which could access shadowsocks-auth
 - add auto-config module which pull config from configuration center
 - dockerization
 