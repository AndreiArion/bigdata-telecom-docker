#!/usr/bin/env bash

# define heap size for local development
MAX_HEAP_SIZE=500M
HEAP_NEWSIZE=100M

# define cluster topology
CASSANDRA_CLUSTER_NAME=sauron
CASSANDRA_DC=sauron_dc1
CASSANDRA_ENDPOINT_SNITCH=GossipingPropertyFileSnitch

# define gossip entrypoints
CASSANDRA_SEEDS=spark-master,spark-worker-a,spark-worker-b

