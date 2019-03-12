# sed-awk

## TLDR

```bash
$ tldr sed
  sed
  Run replacements based on regular expressions.

  - Replace the first occurrence of a string in a file, and print the result:
    sed 's/find/replace/' filename

  - Replace only on lines matching the line pattern:
    sed '/line_pattern/s/find/replace/'

  - Replace all occurrences of a string in a file, overwriting the file (i.e. in-place):
    sed -i 's/find/replace/g' filename

  - Replace all occurrences of an extended regular expression in a file:
    sed -r 's/regex/replace/g' filename

  - Apply multiple find-replace expressions to a file:
    sed -e 's/find/replace/' -e 's/find/replace/' filename
```

```bash
$ tldr awk

  awk
  A versatile programming language for working on files.

  - Print the fifth column in a space separated file:
    awk '{print $5}' filename

  - Print the second column of the lines containing "something" in a space separated file:
    awk '/something/ {print $2}' filename

  - Print the third column in a comma separated file:
    awk -F ',' '{print $3}' filename

  - Sum the values in the first column and print the total:
    awk '{s+=$1} END {print s}' filename

  - Sum the values in the first column and pretty-print the values and then the total:
    awk '{s+=$1; print $1} END {print "--------"; print s}' filename
```

## Useful Commands

```bash
# List out the second column in the table.
cat text/table.txt | sed 1d | awk '{ print $2 }'

# Sum the columns in the table.
cat text/table.txt | sed 1d | awk '{ sum += $2 } END { print sum }'

# Kills all processes by name.
ps aux | grep chrome | awk '{ print $2 }' | kill
pkill chrome

# Deletes trailing whitespace.
sed 's/\s\+$//g' filename

# Deletes all blank lines from file.
sed '/^$/d' filename

# Insert 'use strict' to the top of every js file.
sed "1i 'use strict';" *.js

# Append a new line at the end of every file.
sed '1a \n' *

# Generate random numbers and then sort.
for i in {1..20}; do echo $(($RANDOM * 777 * $i)); done | sort -n

# Commatize numbers.
sed -r ':loop; s/(.*[0-9])([0-9]{3})/\1,\2/; t loop' text/numbers.txt
```

## Tutorial
Follow the tutorials here:
- http://www.thegeekstuff.com/tag/sed-tips-and-tricks/
- http://www.grymoire.com/Unix/Sed.html
- http://www.grymoire.com/Unix/Awk.html

```bash
# Unzip data.
unzip data.zip

# Zip data.
zip -r data.zip data/

# Preview the files.
head data/names.csv && tail data/names.csv

# Preview csv columns.
sed -n 1p data/colleges.csv | tr ',' '\n'

# Count the number of lines.
wc -l data/*
```

### Sed Print

```sh
# Print contents of a file.
sed -n '/fox/p' text/*
sed -n '/Sysadmin/p' text/geek.txt

# Print lines starting with `3` and skipping by `2`.
sed -n '3~2p' text/geek.txt

# Print the last line.
sed -n '$p' text/geek.txt

# Prints the lines matching the between the two patterns.
sed -n '/Hardware/,/Website/p' text/geek.txt
```

### Sed Print Line Number

```sh
# Prints the line number for all lines in the file.
sed -n '=' filename

# Prints the line number that matches the pattern.
sed -n '/Linux/=' filename

# Prints the line number in range of two patterns (inclusive).
sed -n '/Linux/,/Hardware/=' filename

# Prints the total number of lines.
sed -n '$=' filename
```

### Sed Delete
The `d` command performs a deletion.

```sh
# Deletes the 3rd line from beginning of file.
sed '3d' text/geek.txt

# Delete every lines starting from 3 and skipping by 2.
sed '3~2d' text/geek.txt

# Delete lines from 3 to 5.
sed '3,5d' text/geek.txt

# Delete the last line.
sed '$d' text/geek.txt

# Delete lines matching the pattern.
sed '/Sysadmin/d' text/geek.txt
```

### Sed Substitute
The `s` command performs a substitution.

```sh
# Simple substituion for the first result.
sed 's/Linux/Unix/' text/geek.txt

# Simple substituion for global instances.
sed 's/Linux/Unix/g' text/geek.txt

# Replace nth instance.
sed 's/Linux/Unix/2' text/geek.txt

# Write matched lines to output.
sed -n 's/Linux/Unix/gp' text/geek.txt > text/geek-sub.txt

# Use regex group for capturing additional patterns (up to 9).
sed 's/\(Linux\).\+/\1/g' text/geek.txt
sed -r 's/(Linux).+/\1/g' text/geek.txt

# Remove the last word.
sed -r 's/\d$//g' text/geek.txt

# Remove all letters.
sed -r 's/[a-zA-Z]//g' text/geek.txt

# Remove html tags (WIP).
sed -r 's|(</?[a-z]+>)||g' text/html.txt

# Commatize any number.
sed ':a;s/\B[0-9]\{3\}\>/,&/;ta' text/numbers.txt
sed -r ':loop; s/\B[0-9]{3}\>/,&/; t loop' text/numbers.txt
```

### Sed Transform
The `y` command performs a transformation.

```sh
# Converts all lowercase chars to uppercase.
sed 'y/abcdefghijklmnopqrstuvwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/' text/geek.txt

# Converts all uppercase chars to lowercase.
sed 'y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/' text/geek.txt

# Perform a two character shift.
sed 'y/abcdefghijklmnopqrstuvwxyz/cdefghijklmnopqrstuvwxyzab/' text/geek.txt
```

### Sed Multiple Commands
The `-e` flag allows for multiple commands.

```sh
sed -r -e 's/etc\.*//g' -e 's/(\s+)(\))/\2/g' text/geek.txt
```
