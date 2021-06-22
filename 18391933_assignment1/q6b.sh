#!/bin/bash

cut -d, -f1-36 temp4.csv> tmpA.csv
cut -d, -f37 temp4.csv |  tr -d '[:punct:]'> tmpB.csv
cut -d, -f38-39 temp4.csv> tmpC.csv
paste -d ',' tmpA.csv tmpB.csv tmpC.csv> temp5.csv
