import serial

PORT = 'COM7'

ser = serial.Serial(PORT, 9600, timeout=None)
data = ser.readline()

print(data)

ser.close()