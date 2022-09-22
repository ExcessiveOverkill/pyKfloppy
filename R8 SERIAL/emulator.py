import serial
import os
import time
ser = serial.Serial("COM1", timeout=1)
os.chdir('Files')
print(os.getcwd())
#data = bytes('srtf#abc.lse', 'utf-8')
dataArray = bytearray(8)
fileData = bytearray()
fileName = ''

def getData(length):
    if length == 0: 
        s = ser.read_until(b'\x04', size=None)
    else:
        s = ser.read(size=length)
    return s


def getCmd(dataArray):
    i=0
    while dataArray[0] != 1 and i <5:
        for x in range(0, len(dataArray)-1):
            dataArray[x] = dataArray[x+1]
        i += 1
    
    string  = ''
    for x in range(1, 4):
        string += dataArray.decode('utf-8')[x]
    return string

def getCmdData(dataArray): 
    i=0
    while dataArray[0] != 1 and i <5:
        for x in range(0, len(dataArray)-1):
            dataArray[x] = dataArray[x+1]
        i += 1
    
    string  = ''
    for x in range(5, len(dataArray)-1):
        string += dataArray.decode('utf-8')[x]
    return string

def sendACK(): 
    ser.write(bytes('\x06', 'utf-8'))
    print('ACK')

def sendNAK(): 
    ser.write(bytes('\x15', 'utf-8'))
    print('NAK')

def checkForFile(filename):
    return False

def createNewFile(filename):
    file = open(filename, 'w')
    file.close()
    global fileName
    fileName = filename
    return True

def saveToFile():
    global fileName
    global fileData
    print(fileData)
    file = open(fileName, 'w')
    if '.LS' in fileName: file.write(fileData.decode('utf-8'))
    else: file.write(str(fileData))
    file.close()
    fileData = bytearray(0)
    return

def runSerial():
    global dataArray
    global fileData
    if getCmd(dataArray) == 'SLF':
        if checkForFile(getCmdData(dataArray)) == True: sendACK()
        if checkForFile(getCmdData(dataArray)) == False: sendNAK()

    if getCmd(dataArray) == 'DFF':
        if createNewFile(str(getCmdData(dataArray))) == True: sendACK()
        if createNewFile(str(getCmdData(dataArray))) == False: sendNAK()

    if getCmd(dataArray) == 'RTS':
        blockLength = int(getCmdData(dataArray))
        print('rts received')
        sendACK()
        getData(1)
        dataBlock = bytearray(getData(blockLength))
        ser.reset_input_buffer()
        print('block: ' + str(dataBlock))
        if len(dataBlock) == blockLength: sendACK()
        fileData = fileData + dataBlock
        
        

    if getCmd(dataArray) == 'CLR':
        saveToFile()
        sendACK()


    if getCmd(dataArray) == 'RQS':
        msg = bytearray('\x06\x02\x33\x04', 'utf-8')
        ser.write(msg)
        print(msg)

while True:
    if ser.in_waiting > 0:
        dataArray = bytearray(getData(0))
        print('new data: ' + str(dataArray))
        runSerial()

