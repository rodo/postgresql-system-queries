#!/usr/bin/env python3
"""
Test un chagment de type dans pg

"""
import threading
import psycopg2
import time
import json
from pathlib import Path




"""thread worker function"""

def test_on(port, user):

    dsn= "dbname=postgres user={} host=localhost port={}".format(user, port)
    
    conn = psycopg2.connect(dsn)
    print(conn.dsn)

    result = list(Path(".").rglob("*.sql"))

    for f in result:
        with open(f) as sql_file:
            query = sql_file.read()            
            cur = conn.cursor()

            try:
                res = cur.execute(query)
                res = cur.fetchall()
            except:
                print(f)
            cur.close()
    conn.close()
    


with open("config.json") as conf_file:
    data = json.load(conf_file)
    for p in data['clusters']:
        print(p)
        test_on(p['port'], p['user'])
        
