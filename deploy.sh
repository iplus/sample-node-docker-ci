#!/bin/bash
# docker build -t kostyaurysov/sample-node .
docker push ivanplus/sample-node

ssh ivn.plus@35.187.100.237  << EOF
docker pull ivanplus/sample-node:latest
docker stop web || true
docker rm web || true
docker rmi ivanplus/sample-node:current || true
docker tag ivanplus/sample-node:latest ivanplus/sample-node:current
docker run -d --net app --restart always --name web -p 80:80 ivanplus/sample-node:current
EOF
