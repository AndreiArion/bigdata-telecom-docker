CREATE KEYSPACE IF NOT EXISTS inf728
  WITH replication = {'class': 'NetworkTopologyStrategy', 'sauron_dc1': 2 };

CREATE TABLE IF NOT EXISTS inf728.temperature (
    ville text,
    temperature int,
    PRIMARY KEY (ville)
);

INSERT INTO temperature (ville, temperature ) VALUES ( 'Rennes', 30);

