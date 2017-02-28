#!/bin/bash
# docker build -t kostyaurysov/sample-node .
docker push kostyaurysov/sample-node

ssh deploy@35.187.30.81 << EOF
docker pull kostyaurysov/sample-node:latest
docker stop web || true
docker rm web || true
docker rmi kostyaurysov/sample-node:current || true
docker tag kostyaurysov/sample-node:latest kostyaurysov/sample-node:current
docker run -d --net app --restart always --name web -p 80:80 kostyaurysov/sample-node:current
EOF
