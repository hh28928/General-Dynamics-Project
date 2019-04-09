import json
from pprint import pprint
import time
import re
with open('sensordata.json') as f:
	data = json.load(f)
filename = "test_metrics.json"
file = open(filename, "w")

for a in data:
    json_metrics = "["
    #pprint(data[a])
    #for neo in data[a][0]:
        #print(neo)
        #pprint(data["devices"][0][neo])
        #print("_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-")
    for lsm in data[a][1]:
        if lsm == "device":
                continue
        #pprint(data["devices"][1][lsm])
        if type(data["devices"][1][lsm]) is float:
            json_metrics += "{\"metric\": \"d2.lsm." + lsm + "\",\"timestamp\": %.0f" %time.time()
            json_metrics += ",\"value\": %.18f" % data["devices"][1][lsm]
            json_metrics += ",\"tags\": {\"sensor\": \"LSM9DS1\",\"device\": \"1\"}}," 
            continue
        for value in data["devices"][1][lsm]:
            temp = value[:-2]
            temp_d = value[-1:]
            json_metrics += "{\"metric\": \"d2.lsm." + temp+"."+temp_d + "\",\"timestamp\": %.0f" %time.time()
            json_metrics += ",\"value\": %.18f" % data["devices"][1][lsm][value]
            json_metrics += ",\"tags\": {\"sensor\": \"LSM9DS1\",\"device\": \"1\"}},"
    for bmp in data[a][2]:
        if bmp == "device":
            continue
        json_metrics += "{\"metric\": \"d2.bmp." + bmp + "\",\"timestamp\": %.0f" %time.time()
        json_metrics += ",\"value\": %.18f" % data["devices"][2][bmp]
        json_metrics += ",\"tags\": {\"sensor\": \"BMP280\",\"device\": \"1\"}}," 
    for dht in data[a][3]:
        if dht == "device":
            continue
        json_metrics += "{\"metric\": \"d2.dht." + dht + "\",\"timestamp\": %.0f" %time.time()
        json_metrics += ",\"value\": %.18f" % data["devices"][3][dht]
        json_metrics += ",\"tags\": {\"sensor\": \"DHT22\",\"device\": \"1\"}}," 
    json_metrics = json_metrics[:-1]
    json_metrics += "]"
    file.write(json_metrics)
    file.close()
