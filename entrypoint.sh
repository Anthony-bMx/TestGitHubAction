#!/bin/sh

echo "Hello $1"
time=$(date)

mkdir -p backups
cd backups

# Example:  NotifyExport-2020-12-04T16-47-47Z.json
date=$(date +"%Y-%m-%dT%H-%M-%SZ")
filename="NotifyExport-${date}.json"
wget https://jsonplaceholder.typicode.com/todos/1 -O $filename

#wget https://jsonplaceholder.typicode.com/todos/1 -O downloadedfile.json 
echo "::set-output name=time::$time"
