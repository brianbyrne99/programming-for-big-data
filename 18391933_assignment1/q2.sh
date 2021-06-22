#!/bin/bash

number_columns=$(head -1 cleaned_reddit_data.csv | sed 's/[^,]//g' | wc -c)
cp cleaned_reddit_data.csv temp.csv

for (( i = number_columns; i >0; i-- )); do
        #statements
        bool="false"
        cp temp.csv cleaned_reddit_data.csv
        for line in $(tail -n +2 cleaned_reddit_data.csv | cut -d, -f"$i");do
        if [ ! -z "$line" ]
        then
      bool="true"
        fi
        done
        if [ "$bool" = "false" ]
        then
             cut -d, -f"$i" --complement cleaned_reddit_data.csv> temp.csv
        fi
done




