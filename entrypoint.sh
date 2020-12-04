#!/bin/sh -l

echo "Hello $1"
time=$(date)

# Create directory if do not already exists
mkdir -p backups
cd backups

# Example:  NotifyExport-2020-12-04_16-34-13.json
filename=$(printf 'NotifyExport-%(%Y-%m-%d_%H-%M-%S.json)T\n' -1)
wget https://jsonplaceholder.typicode.com/todos/1 -O $filename

#wget https://jsonplaceholder.typicode.com/todos/1 -O downloadedfile.json 
echo "::set-output name=time::$time"
