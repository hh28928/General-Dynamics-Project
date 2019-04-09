import lsm9ds1
import neo6m_gps
import dht22
import bmp280
import time
import json
import re
import ast
import subprocess
class GDSensors:
  def __init__(self):
    try:
      self.gps = neo6m_gps.GPS()
    except :
      print('error initalizing neo6m gps')
      self.gps = None
    try:
      self.lsm = lsm9ds1.LSM()
    except :
      print('error initalizing lsm ')
      self.lsm = None
    try:
      self.bmp = bmp280.BMP()
    except :
      print('error initalizing bmp ')
      self.bmp = None
    try:
      self.dht = dht22.DHT()
    except :
      print('error initalizing dht ')
      self.dht = None
    try:
      self.scanner = fm_scanner.Scanner()
      scanner.load('freq.csv')
      scanner.setup_scan("FM",87.1,108.1,"WFM",200000)
    except:
      print('error initalizing scanner ')
      self.scanner = None
    
  def GetData(self):
    data ={"devices":[]}


    try:
        if not self.gps is None:
          data["devices"].append(ast.literal_eval(self.gps.GetData()))
    except RuntimeError as error:
        data["devices"].append({"device":"NEO6MGPS","error":error.args})
    try:
        if not self.lsm is None:
          data["devices"].append(ast.literal_eval(self.lsm.GetData()))
    except RuntimeError as error:
        data["devices"].append({"device":"LSM9DS1","error":error.args})
    try:
        if not self.bmp is None:
          data["devices"].append(ast.literal_eval(self.bmp.GetData()))
    except RuntimeError as error:
        data["devices"].append({"device":"BMP280","error":error.args})
    try:
        if not self.dht is None:
          data["devices"].append(ast.literal_eval(self.dht.GetData()))
    except RuntimeError as error:
        data["devices"].append({"device":"DHT22","error":error.args})
    try:
        if not self.scanner is None:
          data["devices"].append(ast.literal_eval(self.scanner.GetData()))
    except RuntimeError as error:
        data["devices"].append({"device":"GQRX","error":error.args})

    return json.dumps(data)
    #return ast.literal_eval(json.dumps(data))

if __name__ == "__main__":
    sensors = GDSensors()
    while True:
      try:
        temp_json = sensors.GetData()
        #temp_json.replace("\'",'')

        filename = "sensordata.json"
        file = open(filename,"w")
        file.write(str(temp_json))
        print("\n", str(temp_json),"\n")
        print("file has been written")
        print("Sending data")
        time.sleep(2.0)
        subprocess.call("./sendData.sh")
        print("\n")
        print("Done, thanks")
      except RuntimeError as error:
        print(error.args)
      time.sleep(3.0)
