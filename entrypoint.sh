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
wgetoutput=$(wget -S "https://jsonplaceholder.typicode.com/todos/1" -O filename.json 2>&1)

# Extract status code (Double quotes are important to preserve internal spacing)
statuscode=$(echo "$wgetoutput" | grep "HTTP/" | awk '{print $2}')

# If failed (Non 200 status code)
if [ ! "$statuscode" = "200" ]
then
  echo "::set-output name=success::'Download failed'"
  echo "Export failed"
  # Print command output
  echo "$wgetoutput"
  # Exit with error
  exit 1
fi

echo "::set-output name=success::'Download succeed'"


