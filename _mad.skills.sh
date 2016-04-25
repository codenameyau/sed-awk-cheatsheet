#!/bin/bash

# Show all the male births in NY.
sed -rn '/NY.+boy/p;' data/births.csv

# Sum the number of male births in NY.
sed -rn '/NY.+boy/p' data/births.csv | awk -F',' '{ s+=$4; } END { print s }'

# Sum the numer of male births in NY since the year 2000.
sed -rn '/NY.+boy/p' data/births.csv | awk -F',' '{ if ($1 >= 2000) s+=$4 } END { print s }'
