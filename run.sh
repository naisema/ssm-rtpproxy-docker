#!/bin/bash
docker run --network host --privileged -itd --rm -p 7722:7722/udp --name rtpproxy rtpproxy
