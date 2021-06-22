#!/bin/bash

number_columns=$(head -1 temp.csv | sed 's/[^,]//g' | wc -c)
cp temp.csv temp2.csv

for (( i = number_columns; i >0; i-- )); do
        #statements
        bool="false"
        cp temp2.csv temp.csv
        uniq_c=$(cut -d, -f"$i"  temp.csv | tail -n +2 | sort | uniq | wc -l)                        
        if [ $uniq_c != 1 ]
        then
        	bool="true"
        fi


        if [ "$bool" = "false" ]
        then
             cut -d, -f"$i" --complement temp.csv> temp2.csv
        fi
done
