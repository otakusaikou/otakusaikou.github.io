#!/bin/bash

# usage: ./auto.sh input.txt xyzRGB NTUAdmin
txt2las -parse $2 -i $1 -set_version 1.2 -o ${1%.*}.las
if [[ "$2" == "xyzi" ]]
then
    potreeconverter ${1%.*}.las -f ${2} --intensity-range 4096 -a INTENSITY -p $3 -o $3 --overwrite --material INTENSITY 
elif [[ "$2" == "xyzRGB" ]]
then
    potreeconverter ${1%.*}.las -f ${2} -p $3 -o $3 --overwrite --material RGB
fi
