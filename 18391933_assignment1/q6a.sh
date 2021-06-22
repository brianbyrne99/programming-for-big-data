#!/bin/bash
cut -d, -f1-36 temp3.csv> tmpA.csv
cut -d, -f37 temp3.csv |  tr '[:upper:]' '[:lower:]'> tmpB.csv
cut -d, -f38-39 temp3.csv> tmpC.csv
paste -d ',' tmpA.csv tmpB.csv tmpC.csv> temp4.csv
