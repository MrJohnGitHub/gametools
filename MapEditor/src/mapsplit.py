#coding=utf-8
#!/usr/bin/python 
# coding: UTF-8  #第一行加这句可以提示那一个地方有问题

import os
import random
from nt import chdir
import shutil
import json
import sys
import codecs
import re

from PIL import Image,ImageFile

mapPath = sys.argv[1]
saveRoot = sys.argv[2]
mapName = sys.argv[3]
tileSize = int(sys.argv[4])
smallPath = saveRoot + "/" + mapName + "/small.jpg"
savePath = saveRoot + "/" + mapName + "/image"

print(mapPath)
print(saveRoot)
print(mapName)

#Image.MAX_IMAGE_PIXELS = 320000000
#ImageFile.LOAD_TRUNCATED_IMAGES = True
img = Image.open("%s/%s.jpg" % (mapPath, mapName)) #打开当前路径图像
width = img.size[0]
height = img.size[1]

xcount = 0
ycount = 0
if width % tileSize == 0:
	xcount = width / tileSize
else:
	xcount = width / tileSize + 1
	
if height % tileSize == 0:
	ycount = height / tileSize
else:
	ycount = height / tileSize + 1

#创建文件夹
if (not os.path.exists(savePath)):
	os.makedirs(savePath)
	
for y in range(0, ycount):	
	for x in range(0, xcount):
		box1 = (x*tileSize, y*tileSize, (x+1)*tileSize, (y+1)*tileSize)    #设置图像裁剪区域
		image1 = img.crop(box1)   #图像裁剪
		name = '%s/%s_%s.jpg' % (savePath, y, x)
		print(name)
		image1.save(name)  #存储当前区域
		

smallImg = img.resize((int(width/10), int(height/10)), Image.ANTIALIAS)
smallImg.save(smallPath)

