#!/bin/bash
#pull data from openTWSDB
curl -i -H "Accept: application/json" -H "Content-Type: application/json" -X GET http://192.168.1.247:8080/api/query/gexp?start=1h-ago&exp=scale(m=sum:d1.dht.temperature, 1024)
