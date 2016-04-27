#!/bin/bash

# Count the total number of lines in the file.
data_file="../../data/names.csv"
total_lines=$(wc -l $data_file | awk '{ print $1 }')

# Get 20 random names.
shuf -i 1-$total_lines -n 30 | \
xargs -i sed -n '{}p' $data_file | \
awk -F',' '{ print $2 }' | \
sed 's/"//g'
