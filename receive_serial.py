import serial
import requests
import json

PORT = 'COM7'

DB_URL = 'https://script.google.com/macros/s/AKfycbwAFYfCpCvRX7AOqhyTj-z1QL2c0ao02SQyu9GrAOxHBWNzhmuxhScXLvu2wBg6Buhk/exec'

ser = serial.Serial(PORT, 9600, timeout=None)
egg_data = ser.readline()

json_data = {
  'eggData': "101111",
}

r = requests.post(DB_URL, data=json.dumps(json_data))

ser.close()