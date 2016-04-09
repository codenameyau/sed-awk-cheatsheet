# sed-awk lessons

Following the tutorials here.
- http://www.thegeekstuff.com/tag/sed-tips-and-tricks/

```bash
# List out the columns in table.
cat table.txt | sed 1d | awk '{ print $2 }'

# Sum the columns in table.
cat table.txt | sed 1d | awk '{ sum += $2 } END { print sum }'
```
