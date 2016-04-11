# Converts pixels in fer2013.csv (data set) to images

import csv
from PIL import Image

#image parameters
size = 48,48
mode = 'RGB'
file = 'private-test-150.csv'

with open(file,'r') as csvin:
    traindata=csv.reader(csvin, delimiter=',', quotechar='"')
    rowcount=0
    for row in traindata:
        if rowcount > 0:
            print 'rows ' + str(rowcount) + "\n"
            x=0
            y=0
            pixels=row[1].split()
            img = Image.new(mode,size)
            for pixel in pixels:
                colour=(int(pixel),int(pixel),int(pixel))
                img.putpixel((x,y), colour)
                x+=1
                if x >= 48:
                    x=0
                    y+=1
            imgfile='img-'+str(rowcount)+'-'+str(row[0])+'.png'
            img.save(imgfile,'png')
        rowcount+=1
