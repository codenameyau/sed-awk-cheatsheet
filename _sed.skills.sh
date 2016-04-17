#!/bin/bash
#
# Description:
# Examples of basic sed usage with the files in '/text'

#-===================================================================
# PRINTING (p)
# http://www.thegeekstuff.com/2009/09/unix-sed-tutorial-printing-file-lines-using-address-and-patterns/
#
# Syntax:
# sed -n 'ADDRESS'p filename
# sed -n '/PATTERN/p' filename
#-===================================================================
exit

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


#-===================================================================
# DELETION (d)
# http://www.thegeekstuff.com/2009/09/unix-sed-tutorial-delete-file-lines-using-address-and-patterns/
#
# Syntax (same as print):
# sed 'ADDRESS'd filename
# sed /PATTERN/d filename
#-===================================================================

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


#-===================================================================
# SUBSTITUTION (s)
# http://www.thegeekstuff.com/2009/09/unix-sed-tutorial-replace-text-inside-a-file-using-substitute-command/
#
# Syntax:
# sed 'ADDRESSs/REGEX/REPLACEMENT/FLAGS' filename
# sed '/PATTERN/s/REGEX/REPLACEMENT/FLAGS' filename
#
# Delimiter:
# '/' can be replaced with any character (;@|-*~) as a delimiter.
#
# Flags:
# -g - replace all instances of REGEX with REPLACEMENT
# -n - replace the nth instance
# -p - print line if a substituion was made
# -i - case-insensitive substituion
# -r - extended regex (preferred)
# -w - write to file if a substituion was made
#-===================================================================

# Simple substituion for the first result.
sed 's/Linux/Unix/' text/geek.txt

# Simple substituion for global instances.
sed 's/Linux/Unix/g' text/geek.txt

# Replace nth instance.
sed 's/Linux/Unix/2' text/geek.txt

# Write matched lines to output.
sed -n 's/Linux/Unix/gp' text/geek.txt > text/geek-sub.txt

# Replace parens with square brackets.
sed 's/(/[/g; s/)/]/g' text/geek.txt
sed -r 's/\((.+)\)/\[\1\]/g' text/geek.txt

# Capture group for substituion.
sed 's/\(Linux\).\+/\1/g' text/geek.txt
sed -r 's/(Linux).+/\1/g' text/geek.txt

# Remove parenthesis and everything inside.
sed 's/(.\+)//g' text/geek.txt
sed -r 's/\(.+\)//g' text/geek.txt

# Remove only the parenthesis.
sed 's/(\(.\+\))/\1/g' text/geek.txt
sed -r 's/\((.+)\)/\1/g' text/geek.txt

# Replace everything inside parenthesis with YOLO.
sed -r 's/\(.+\)/\(YOLO\)/g' text/geek.txt

# Remove the last 3 characters.
sed 's/.\{3\}$//g' text/geek.txt
sed -r 's/.{3}$//g' text/geek.txt

# Remove the last word.
sed -r 's/\d$//g' text/geek.txt

# Remove all letters.
sed -r 's/[a-zA-Z]//g' text/geek.txt

# Remove number lists.
sed -r 's/[0-9](\. )?//g' text/geek.txt

# Remove all alphanumeric characters.
sed -r 's/\w//g' text/geek.txt

# Removes html tags.
sed 's/<[^>]*>//g' text/html.txt

# Replace value with parenthesis value.
sed 's/ .\+(\(.\+\))/ \1/g' text/geek.txt

# Commatize some numbers. Incorrect attempts.
sed -r 's/([0-9]+)([0-9]{3}$)/\1,\2/g' text/numbers.txt
sed -r 's/([0-9]*)([0-9]{3})+([0-9]{3}$)/\1,\2,\3/g' text/numbers.txt

# Commatize any number. Example with labels and loops
# http://shallowsky.com/blog/linux/cmdline/sed-insert-commas.html
sed ':a;s/\B[0-9]\{3\}\>/,&/;ta' text/numbers.txt


#-===================================================================
# APPEND (a), INSERT (i), REPLACE (c)
# http://www.thegeekstuff.com/2009/11/unix-sed-tutorial-append-insert-replace-and-count-file-lines/
#
# Syntax:
# sed 'ADDRESSa TEXT' filename
# sed '/PATTERN/a TEXT' filename
#-===================================================================

# Append examples.
sed '1a hello world' text/geek.txt
sed '/Linux/a TUX' text/geek.txt
sed '$a this is the last line' text/geek.txt

# Insert examples.
sed '1i this will be inserted before line 1' text/geek.txt

# Replace examples.
sed '1c HAS BEEN REPLACED' text/geek.txt
sed -r '/[wW]indows/c HAS BEEN HAXed' text/geek.txt


#-===================================================================
# PRINT LINE NUMBER
# http://www.thegeekstuff.com/2009/11/unix-sed-tutorial-append-insert-replace-and-count-file-lines/
#
# Syntax:
# sed '=' filename
# sed '/PATTERN/=' filename
#-===================================================================

# Prints the line number for all lines in the file.
sed -n '=' filename

# Prints the line number that matches the pattern.
sed -n '/Linux/=' filename

# Prints the line number in range of two patterns (inclusive).
sed -n '/Linux/,/Hardware/=' filename

# Prints the total number of lines.
sed -n '$=' filename
