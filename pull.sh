#!/bin/bash
curl GET "http://10.166.139.88:8080/api/query?start=10d-ago&m=sum:d1.lsm.accel.x" > lsmAccX.txt
curl GET "http://10.166.139.88:8080/api/query?start=10d-ago&m=sum:d1.lsm.accel.y" > lsmAccY.txt
curl GET "http://10.166.139.88:8080/api/query?start=10d-ago&m=sum:d1.lsm.accel.z" > lsmAccZ.txt
curl GET "http://10.166.139.88:8080/api/query?start=10d-ago&m=sum:d1.lsm.temperature" > lsmTmp.txt
curl GET "http://10.166.139.88:8080/api/query?start=10d-ago&m=sum:d1.lsm.mag.x" > lsmMagX.txt
curl GET "http://10.166.139.88:8080/api/query?start=10d-ago&m=sum:d1.lsm.mag.y" > lsmMagY.txt
curl GET "http://10.166.139.88:8080/api/query?start=10d-ago&m=sum:d1.lsm.mag.z" > lsmMagZ.txt
curl GET "http://10.166.139.88:8080/api/query?start=10d-ago&m=sum:d1.lsm.gyro.x" > lsmGyrX.txt
curl GET "http://10.166.139.88:8080/api/query?start=10d-ago&m=sum:d1.lsm.gyro.y" > lsmGyrY.txt
curl GET "http://10.166.139.88:8080/api/query?start=10d-ago&m=sum:d1.lsm.gyro.z" > lsmGyrZ.txt
curl GET "http://10.166.139.88:8080/api/query?start=10d-ago&m=sum:d1.bmp.altitude" > bmpAlt.txt
curl GET "http://10.166.139.88:8080/api/query?start=10d-ago&m=sum:d1.bmp.temperature" > bmpTemp.txt
curl GET "http://10.166.139.88:8080/api/query?start=10d-ago&m=sum:d1.bmp.pressure" > bmpPre.txt
curl GET "http://10.166.139.88:8080/api/query?start=10d-ago&m=sum:d1.dht.humidity" > dhtHum.txt
curl GET "http://10.166.139.88:8080/api/query?start=10d-ago&m=sum:d1.dht.temperature" > dhtTemp.txt
~       
