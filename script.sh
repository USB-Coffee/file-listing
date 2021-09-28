#!/bin/bash
echo "name,size,modified date" > output.csv
cat list.json | jq -r '.[].name' > name.txt
cat list.json | jq -r '.[].properties.contentLength' > size.txt
cat list.json | jq -r '.[].properties.lastModified' > date.txt
paste -d "," name.txt size.txt date.txt >> output.csv
rm name.txt size.txt date.txt
