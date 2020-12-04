#!/bin/bash

echo "Hello $1"
time=$(date)

#!/bin/bash
mkdir -p backups

# Example:  NotifyExport-2020-12-04_16-34-13.json
date=$(date +"%Y-%m-%dT%H-%M-%SZ")
filename="NotifyExport-${date}.json"
wget https://jsonplaceholder.typicode.com/todos/1 -O backups/$filename

#wget https://jsonplaceholder.typicode.com/todos/1 -O downloadedfile.json 
echo "::set-output name=time::$time"
