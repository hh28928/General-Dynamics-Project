import re
import sys




fileToClean = sys.argv[1]

with open('cleaned' + fileToClean, 'w') as f:
    #print('#[{"metric":"d1.bmp.altitude","tags":{"device":"1","sensor":"BMP280"},"aggregateTags":[],"dps":"')
    print("Timestamp" + "   value",  file = f)
    #print("value", file = f)
    with open(fileToClean) as myfile:
        for line in myfile:
            line = re.sub('metric.*:{"', '', line)
            for word in line.split(","):
                # word = word.replace('"metric":"d1.bmp.altitude"', "")
                # word = word.replace('"tags"', "")
                # word = word.replace('"device":"1"', "")
                # word = word.replace('"sensor":"BMP280"', "")
                # word = word.replace('"aggregateTags"', "")
                # word = word.replace('"dps":', "")

                word = word.replace("{", "")
                word = word.replace("[", "")
                word = word.replace("}", "")
                word = word.replace("]", "")
                name, var = word.partition(":")[::2]
                print(name + "  " + var, file=f)
                #print(var, file=f)


