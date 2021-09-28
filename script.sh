#!/bin/bash
#az storage blob list -c mycontainer --account-name mystorageaccount > mycontainer.json
for i in *.json; do
	echo "name,size,modified date" > "${i%.*}".csv
	cat "$i" | jq -r '.[].name' > name.txt
	cat "$i" | jq -r '.[].properties.contentLength' > size.txt
	cat "$i" | jq -r '.[].properties.lastModified' > date.txt
	paste -d "," name.txt size.txt date.txt >> "${i%.*}".csv
	rm name.txt size.txt date.txt
done
