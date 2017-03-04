#!/bin/bash
# docker build -t kostyaurysov/sample-node .
docker push ivanplus/sample-node

ssh ivn_plus@104.155.22.214 << EOF
docker pull ivanplus/sample-node:latest
docker stop web || true
docker rm web || true
docker rmi ivanplus/sample-node:current || true
docker tag ivanplus/sample-node:latest ivanplus/sample-node:current
docker run -d --net lab6 --restart always --name web -p 80:80 ivanplus/sample-node:current
EOF
