# sed-awk

Follow the tutorials here:
- http://www.thegeekstuff.com/tag/sed-tips-and-tricks/
- http://www.grymoire.com/Unix/Sed.html
- http://www.grymoire.com/Unix/Awk.html

Once you've got the skills, it's time to up your game with real-life data found
in the `/data` folder. May the Tux be with you.

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

### TLDR

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

--

### Mad Useful Commands

```bash
# List out the second column in the table.
cat text/table.txt | sed 1d | awk '{ print $2 }'

# Sum the columns in the table.
cat text/table.txt | sed 1d | awk '{ sum += $2 } END { print sum }'

# Kills all processes by name.
ps aux | grep chrome | awk '{ print $2 }' | kill

# Deletes trailing whitespace.
sed 's/\s\+$//g' filename

# Deletes all blank lines from file.
sed '/^$/d' filename

# Append a new line at the end of every file.
sed '1a \n' *

# Insert 'use strict' to the top of every js file.
sed "1i 'use strict';" *.js

# Generate random numbers and then sort.
for i in {1..20}; do echo $(($RANDOM * 777 * $i)); done | sort -n
```


### Sed Print and Delete Commands

```bash
# Print line 2.
sed -n 2p text/geek.txt

# Delete follows a similar syntax as print but without the `-n` flag.
sed 2d text/geek.txt

# Print lines `2` to `5`.
sed -n '2,5'p text/geek.txt

# Print lines `2` to the last line.
sed -n '2,$'p text/geek.txt

# Print lines starting with `3` and skipping by `2`.
sed -n '3~2'p text/geek.txt

# Prints the line matching the pattern and the next '3' lines.
sed -n '/Sysadmin/,+3p' text/geek.txt

# Prints the lines matching the between the two patterns.
sed -n '/Hardware/,/Website/p' text/geek.txt

# Execute multiple sed commands.
sed -n -e '3p' -e '7p' text/geek.txt
sed -n '3p; 7p' text/geek.txt
```
