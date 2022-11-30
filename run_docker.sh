#!/bin/sh -x
SPARK_VERSION=3.3.1
CASSANDRA_VERSION=3.11.4

set -e
docker compose -f "docker-compose.yml" down
docker build --pull --rm -f "inf728-cassandra-node/Dockerfile" -t inf728-cassandra-node:${CASSANDRA_VERSION} "inf728-cassandra-node"
docker build --pull --rm -f "inf728-spark/Dockerfile" -t inf728-spark:${SPARK_VERSION} "inf728-spark"
docker build --pull --rm -f "inf728-polynote/Dockerfile" -t inf728-polynote:0.4.10 "inf728-polynote"
docker compose -f "docker-compose.yml" up -d --build