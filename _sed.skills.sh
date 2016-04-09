#!/bin/bash

#####################################################################
# PRINTING
#####################################################################

# Print contents of a file.
sed -n '/fox/p' text/*
sed -n '/Sysadmin/p' text/geek.txt

# Print a specific line `N`.
sed -n '3'p text/geek.txt

# Print lines `3` to `5`.
sed -n '3,5'p text/geek.txt

# Print lines starting with `3` and skipping by `2`.
sed -n '3~2'p text/geek.txt

# Print the last line.
sed -n '$'p text/geek.txt

# Print lines `2` to the last line.
sed -n '2,$'p text/geek.txt

# Print lines matching the pattern until the specified line.
sed -n '/Sysadmin/,3p' text/geek.txt
sed -n '/Oracle/,5p' text/geek.txt

# Print lines starting from `3` until it matches the pattern.
sed -n '3,/Sysadmin/p' text/geek.txt

# Print lines matching the pattern to the last line.
sed -n '/Website/,$p' text/geek.txt

# Prints the lines matching the pattern and the next '3' lines.
sed -n '/Sysadmin/,+3p' text/geek.txt

# Prints the lines matching the between the two patterns.
sed -n '/Hardware/Website/p' text/geek.txt
