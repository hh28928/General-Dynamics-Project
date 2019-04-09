#!/bin/bash
curl GET "http://10.166.139.88:8080/api/query?start=10d-ago&m=sum:d2.lsm.accel.x" > lsmAccX_d2.txt
curl GET "http://10.166.139.88:8080/api/query?start=10d-ago&m=sum:d2.lsm.accel.y" > lsmAccY_d2.txt
curl GET "http://10.166.139.88:8080/api/query?start=10d-ago&m=sum:d2.lsm.accel.z" > lsmAccZ_d2.txt
curl GET "http://10.166.139.88:8080/api/query?start=10d-ago&m=sum:d2.lsm.temperature" > lsmTmp_d2.txt
curl GET "http://10.166.139.88:8080/api/query?start=10d-ago&m=sum:d2.lsm.mag.x" > lsmMagX_d2.txt
curl GET "http://10.166.139.88:8080/api/query?start=10d-ago&m=sum:d2.lsm.mag.y" > lsmMagY_d2.txt
curl GET "http://10.166.139.88:8080/api/query?start=10d-ago&m=sum:d2.lsm.mag.z" > lsmMagZ_d2.txt
curl GET "http://10.166.139.88:8080/api/query?start=10d-ago&m=sum:d2.lsm.gyro.x" > lsmGyrX_d2.txt
curl GET "http://10.166.139.88:8080/api/query?start=10d-ago&m=sum:d2.lsm.gyro.y" > lsmGyrY_d2.txt
curl GET "http://10.166.139.88:8080/api/query?start=10d-ago&m=sum:d2.lsm.gyro.z" > lsmGyrZ_d2.txt
curl GET "http://10.166.139.88:8080/api/query?start=10d-ago&m=sum:d2.bmp.altitude" > bmpAlt_d2.txt
curl GET "http://10.166.139.88:8080/api/query?start=10d-ago&m=sum:d2.bmp.temperature" > bmpTemp_d2.txt
curl GET "http://10.166.139.88:8080/api/query?start=10d-ago&m=sum:d2.bmp.pressure" > bmpPre_d2.txt
curl GET "http://10.166.139.88:8080/api/query?start=10d-ago&m=sum:d2.dht.humidity" > dhtHum_d2.txt
curl GET "http://10.166.139.88:8080/api/query?start=10d-ago&m=sum:d2.dht.temperature" > dhtTemp_d2.txt
~       
