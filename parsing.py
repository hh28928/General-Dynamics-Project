import re

fileToClean = input("what is the file name that needs cleaning? ")
with open('cleaned' + fileToClean, 'w') as f:
    #print('#[{"metric":"d1.bmp.altitude","tags":{"device":"1","sensor":"BMP280"},"aggregateTags":[],"dps":"')
    print("Timestamp" + "   value",  file = f)
    #print("value", file = f)
    with open(fileToClean) as myfile:
        for line in myfile:
            for word in line.split(","):
                #word = word.replace('[{"metric":"d1.bmp.altitude","tags":{"device":"1","sensor":"BMP280"},"aggregateTags":[],"dps":', "")
                word = word.replace("{", "")
                word = word.replace(" ", "")
                word = word.replace("}}]", "")
                name, var = word.partition(":")[::2]
                print(name + "  " + var, file=f)
                #print(var, file=f)

print(fileToClean + " has been cleaned, check the output file!!!!")




