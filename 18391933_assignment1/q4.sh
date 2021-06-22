#!/bin/bash

head -n 10000 temp2.csv> temp3.csv

 for line in $(tail -n +2 temp3.csv | cut -d, -f27 );do
        month=$(date -d @"$line" '+%B')
        sed -i "s/$line/$month/" temp3.csv
 done

 for line in $(tail -n +2 temp3.csv | cut -d, -f8 );do
        month=$(date -d @"$line" '+%B')
        sed -i "s/$line/$month/" temp3.csv
 done
