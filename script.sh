#!/bin/bash
# ssconvert provided by gnumeric package (GUI) 
#az storage blob list -c mycontainer --account-name mystorageaccount > mycontainer.json
for i in *.json; do
	echo "\"name\",\"size\",\"modified date\"" > "${i%.*}".csv
	cat "$i" | jq '.[].name' > name.txt
	cat "$i" | jq '.[].properties.contentLength' > size.txt
	cat "$i" | jq  '.[].properties.lastModified' > date.txt
	paste -d "," name.txt size.txt date.txt >> "${i%.*}".csv
	ssconvert --merge-to=combined.xls *.csv
	rm name.txt size.txt date.txt
done
