#!/usr/bin/python
from py2neo import neo4j, Graph

graph_db = neo4j.GraphDatabaseService("http://localhost:7474/db/data/")

results = graph_db.cypher.execute("match (n) where n.system='USERMGMNT' return n")

print results
