#!/bin/sh

echo "Hello $1"
time=$(date)

# Prepare destination directory
mkdir -p backups
cd backups


# Get formated date
date=$(date +"%Y-%m-%dT%H-%M-%SZ")

# Prepare filename (Example:  "Notify-Backup-2020-12-07T14-19-16Z.json")
filename="Notify-Backup-${date}.json"

# Interogate API to get configuration file
wget https://jsonplaceholder.typicode.com/todos/1 -O $filename

echo "::set-output name=time::$time"
