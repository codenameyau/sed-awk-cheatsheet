#!/bin/bash

# Count the number of lines.
data_file="../../data/names.csv"
total_lines=$(wc -l $data_file | awk '{ print $1 }')

# Get 20 random names. Sed substitution is a bottleneck. Parenthesis and string concat example in awk.
shuf -i 1-$total_lines -n 20 | xargs -i sed -n 's/"//g; {}p;' $data_file | awk -F',' '{ print $1, $2, "(" $4 ")"}'
