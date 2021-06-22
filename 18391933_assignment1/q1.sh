#!/bin/bash

cp reddit_20212.csv cleaned_reddit_data.csv 

cut -d, -f1-3,34 --complement reddit_20212.csv> cleaned_reddit_data.csv
