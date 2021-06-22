#!/bin/bash

 tail -n +2 temp3.csv | cut -d, -f8 | sort | uniq -c
