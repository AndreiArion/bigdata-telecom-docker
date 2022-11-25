#!/bin/sh -x

docker compose -f "docker-compose.yml" down
docker build --pull --rm -f "inf728-cassandra-spark/Dockerfile" -t inf728-cassandra-spark:3.0.2 "inf728-cassandra-spark"
docker build --pull --rm -f "inf728-polynote/Dockerfile" -t inf728-polynote:0.4.10 "inf728-polynote"
docker compose -f "docker-compose.yml" up -d --build