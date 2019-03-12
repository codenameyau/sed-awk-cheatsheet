#!/bin/bash
#
# Description:
# Examples of basic awk usage with the files in '/text'.
# http://www.thegeekstuff.com/2010/01/awk-introduction-tutorial-7-awk-print-examples/
#
# Syntax:
# awk '/search pattern1/ {Actions}
#      /search pattern2/ {Actions}' file
#

# Command without search pattern will perform action on all lines.
awk '{ print; }' text/employee.txt

# Command without action will print the lines matching the pattern.
awk '/Technology/' text/employee.txt
sed -n '/Technology/p' text/employee.txt

# Multiple patterns with regex.
awk '/(Tech)|(Market)/' text/employee.txt

# Print columns. $NF contains the number of columns.
awk '{ print $2, $NF }' text/employee.txt

# Multi-line block.
awk 'BEGIN { print "Beginning this command"; }
{ print $2, $NF; }
END { print "End of this command"; }' text/employee.txt

# Same as above written as one line.
awk 'BEGIN { print "Beginning this command"; } { print $2, $NF; } END { print "End of this command"; }' text/employee.txt

# Find the employee with an id greater than 200.
awk '$1 > 200' text/employee.txt

# Match column to regex.
awk '$4 ~ /[tT]echnology/' text/employee.txt

# Sum columns.
awk '{ s += $1; print $1} END { print s }' text/employee.txt

# Sum column, only get result.
awk '{ s += $1 } END { print s }' text/employee.txt

# Sum columns with full syntax.
awk 'BEGIN { s=0 } { s += $1 } END { print s }' text/employee.txt
