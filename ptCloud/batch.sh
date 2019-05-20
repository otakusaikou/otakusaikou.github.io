#!/bin/bash

# usage: ./batch.sh input xyzRGB NTUAdmin
mkdir -p las
if [[ ! -z "$1" && ! -z "$2" && ! -z "$3" ]]
then
    for infile in $1/*
    do
        outfile=las/$(basename ${infile%.*}.las)
        echo $infile $outfile
        txt2las -parse $2 -i $infile -set_version 1.2 -o $outfile
    done
    potreeconverter --list-of-files las/* -f $2 -p $3 -o $3
fi
