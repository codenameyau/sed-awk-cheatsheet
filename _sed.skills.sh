#!/bin/bash

#####################################################################
# PRINTING (p)
# http://www.thegeekstuff.com/2009/09/unix-sed-tutorial-printing-file-lines-using-address-and-patterns/
#
# Syntax:
# sed -n 'ADDRESS'p filename
# sed -n '/PATTERN/p' filename
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
sed -n '/Hardware/,/Website/p' text/geek.txt


#####################################################################
# DELETION (d)
# http://www.thegeekstuff.com/2009/09/unix-sed-tutorial-delete-file-lines-using-address-and-patterns/
#
# Syntax:
# sed 'ADDRESS'd filename
# sed /PATTERN/d filename
#####################################################################

# Deletes the nth line from the file.
sed '3d' text/geek.txt

# Delete every lines starting from 3 and skipping by 2.
sed '3~2d' text/geek.txt

# Delete lines from 3 to 5.
sed '3,5d' text/geek.txt

# Delete the last line.
sed '$d' text/geek.txt

# Delete lines matching the pattern.
sed '/Sysadmin/d' text/geek.txt
